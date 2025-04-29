import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // To get the current user's UID
import 'package:flutter/material.dart';

class UserExerciseThirteen extends StatefulWidget {
  const UserExerciseThirteen({Key? key}) : super(key: key);

  @override
  State<UserExerciseThirteen> createState() => _UserExerciseState();
}

class _UserExerciseState extends State<UserExerciseThirteen> {
  int currentQuestionIndex = 0;
  int correctAnswersCount = 0;
  List<Map<String, dynamic>> quizList = [];
  String? selectedOption;
  bool isAnswerSelected = false;

  @override
  void initState() {
    super.initState();
    fetchQuizzes();
  }

  // Fetch quizzes from Firestore
  Future<void> fetchQuizzes() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('SmartTrafficInputThirteenCollection')
        .orderBy('CreatedAt')
        .get();

    setState(() {
      quizList = snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  // Save wrong answer attempts to Firestore
  Future<void> saveWrongAnswerToFirestore(Map<String, dynamic> quizData) async {
    final userUID = FirebaseAuth.instance.currentUser?.uid;

    if (userUID != null) {
      quizData['userUID'] = userUID; // Add userUID to the quizData map

      // Ensure wrongAttempts is incremented by 1 each time
      await FirebaseFirestore.instance
          .collection('WrongAnswerTestThirteenCollection')
          .doc(quizData['questionId'])
          .update({
            'wrongAttempts': FieldValue.increment(1), // Increment wrongAttempts by 1
          });
    }
  }

  // Check wrong attempts and move to the flashcard collections
  Future<void> checkWrongAttemptsAndSaveToFlashcards(Map<String, dynamic> currentQuiz) async {
    final snapshot = await FirebaseFirestore.instance
        .collection('WrongAnswerTestThirteenCollection')
        .doc(currentQuiz['questionId'])
        .get();

    if (snapshot.exists) {
      final data = snapshot.data();
      final wrongAttempts = data?['wrongAttempts'] ?? 0;

      // If wrongAttempts is exactly 3, save to YellowFlashCardCollection
      if (wrongAttempts == 3) {
        moveToFlashcardCollection(currentQuiz, 'YellowFlashCardCollection');
      }
      // If wrongAttempts is between 4 and 5, save to OrangeFlashCardCollection
      else if (wrongAttempts > 3 && wrongAttempts <= 5) {
        moveToFlashcardCollection(currentQuiz, 'OrangeFlashCardCollection');
      }
      // If wrongAttempts is greater than 5, save to RedFlashCardCollection
      else if (wrongAttempts > 5) {
        moveToFlashcardCollection(currentQuiz, 'RedFlashCardCollection');
      }
    }
  }

  // Move to the correct flashcard collection and delete the document from the previous collection
  Future<void> moveToFlashcardCollection(Map<String, dynamic> quizData, String targetCollection) async {
    final userUID = FirebaseAuth.instance.currentUser?.uid;

    if (userUID != null) {
      quizData['userUID'] = userUID;
      String questionId = quizData['questionId'];

      // Save quiz data to the target flashcard collection
      await FirebaseFirestore.instance
          .collection(targetCollection)
          .doc(questionId)
          .set(quizData, SetOptions(merge: true));

      // Remove from the previous collection (based on wrongAttempts logic)
      if (targetCollection == 'YellowFlashCardCollection') {
        await FirebaseFirestore.instance
            .collection('OrangeFlashCardCollection')
            .doc(questionId)
            .delete();
        await FirebaseFirestore.instance
            .collection('RedFlashCardCollection')
            .doc(questionId)
            .delete();
      } else if (targetCollection == 'OrangeFlashCardCollection') {
        await FirebaseFirestore.instance
            .collection('YellowFlashCardCollection')
            .doc(questionId)
            .delete();
        await FirebaseFirestore.instance
            .collection('RedFlashCardCollection')
            .doc(questionId)
            .delete();
      } else if (targetCollection == 'RedFlashCardCollection') {
        await FirebaseFirestore.instance
            .collection('YellowFlashCardCollection')
            .doc(questionId)
            .delete();
        await FirebaseFirestore.instance
            .collection('OrangeFlashCardCollection')
            .doc(questionId)
            .delete();
      }
    }
  }

  // Move to the next question
  void nextQuestion() async {
    final currentQuiz = quizList[currentQuestionIndex];
    final correctAnswer = currentQuiz['CorrectAnswer'];

    // Check if the selected answer is correct
    if (selectedOption != null && selectedOption == correctAnswer) {
      correctAnswersCount++;
    }

    // Save wrong attempts to Firestore and check if the question should move to flashcards
    if (selectedOption != null && selectedOption != correctAnswer) {
      await saveWrongAnswerToFirestore(currentQuiz);
    }

    // Check the wrong attempts and save to FlashCard collections (Yellow, Orange, Red)
    await checkWrongAttemptsAndSaveToFlashcards(currentQuiz);

    // Move to the next question or show final result
    if (currentQuestionIndex < quizList.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedOption = null; // Reset answer for the next question
        isAnswerSelected = false; // Reset selection
      });
    } else {
      showFinalResult();
    }
  }

  // Show the final result when all questions are done
  void showFinalResult() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text("Дасгал ажиллаж дууслаа. 🎉"),
        content: Text(
          "Та ${quizList.length}-с $correctAnswersCount зөв хариулсан байна. "
          "Алдсан ${quizList.length - correctAnswersCount} асуулт тухайн дэд бүлгийн алдсан тестийн санд бүртгэгдлээ.",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );

    Future.delayed(const Duration(seconds: 4), () {
      if (Navigator.of(context).canPop()) {
        Navigator.of(context).pop(); // dialog
        Navigator.of(context).pop(); // page
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    if (quizList.isEmpty) {
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    final currentQuiz = quizList[currentQuestionIndex];
    final question = currentQuiz['Question'] ?? 'Асуулт олдсонгүй';
    final imageUrl = currentQuiz['Image'] ?? '';
    final answers = List<String>.generate(5, (i) => currentQuiz['Answer${i + 1}'] ?? '')
        .where((ans) => ans.isNotEmpty)
        .toList();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Асуулт ${currentQuestionIndex + 1}/${quizList.length}",
          style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
        ),
        backgroundColor: Colors.blue[100],
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.blue[100],
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.1),
                    blurRadius: 8,
                    spreadRadius: 2,
                  ),
                ],
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    question,
                    textAlign: TextAlign.start,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(height: 10),
                  if (imageUrl.isNotEmpty && imageUrl.startsWith("http"))
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
                      child: Image.network(
                        imageUrl,
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 170,
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => const SizedBox(),
                      ),
                    ),
                  const SizedBox(height: 20),
                  ...List.generate(answers.length, (index) {
                    final isSelected = selectedOption == answers[index];
                    final isCorrect = answers[index] == currentQuiz['CorrectAnswer'];

                    Color buttonColor = Colors.white;
                    if (selectedOption != null) {
                      if (isSelected && isCorrect) {
                        buttonColor = Colors.greenAccent;
                      } else if (isSelected && !isCorrect) {
                        buttonColor = Colors.redAccent;
                      }
                    }

                    return Padding(
                      padding: const EdgeInsets.only(bottom: 5),
                      child: ElevatedButton(
                        onPressed: !isAnswerSelected
                            ? () {
                                setState(() {
                                  selectedOption = answers[index];
                                  isAnswerSelected = true;
                                });
                                // Show the correct/incorrect SnackBar immediately
                                final correctAnswer = currentQuiz['CorrectAnswer'];
                                if (selectedOption == correctAnswer) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("🎉 Зөв хариулт!"),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text("❌ Буруу хариулт. Зөв хариулт: $correctAnswer"),
                                      backgroundColor: Colors.redAccent,
                                    ),
                                  );
                                }
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          foregroundColor: Colors.black,
                          minimumSize: const Size(double.infinity, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(
                            answers[index],
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 14,
                            ),
                          ),
                        ),
                      ),
                    );
                  }),
                  const SizedBox(height: 60),
                ],
              ),
            ),
          ),
          // 🧭 Буцах + Дараа / Дуусгах товчнууд
          Positioned(
            bottom: 20,
            left: 20,
            right: 20,
            child: Row(
              children: [
                if (currentQuestionIndex > 0)
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        setState(() {
                          currentQuestionIndex--;
                          selectedOption = null;
                          isAnswerSelected = false;
                        });
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        padding: const EdgeInsets.symmetric(vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                      ),
                      child: const Text(
                        'Буцах',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                if (currentQuestionIndex > 0) const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: isAnswerSelected ? nextQuestion : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      padding: const EdgeInsets.symmetric(vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15.0),
                      ),
                    ),
                    child: Text(
                      currentQuestionIndex == quizList.length - 1 ? 'Дуусгах' : 'Дараа',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 15,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
