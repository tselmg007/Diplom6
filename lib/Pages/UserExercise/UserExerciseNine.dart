import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserExerciseNine extends StatefulWidget {
  final int selectedQuestions;

  const UserExerciseNine({Key? key, required this.selectedQuestions}) : super(key: key);

  @override
  State<UserExerciseNine> createState() => _UserExerciseState();
}

class _UserExerciseState extends State<UserExerciseNine> {
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

  Future<void> fetchQuizzes() async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('SmartTrafficInputNineCollection')
          .orderBy('CreatedAt')
          .get();

      setState(() {
        quizList = snapshot.docs.map((doc) => doc.data()).toList();
      });
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error fetching quizzes: $e')),
      );
    }
  }

  Future<void> saveWrongAnswerToFirestore(Map<String, dynamic> quizData) async {
    final userUID = FirebaseAuth.instance.currentUser?.uid;

    if (userUID != null) {
      try {
        final updatedData = Map<String, dynamic>.from(quizData);
        updatedData['userUID'] = userUID;
        updatedData['wrongAttempts'] = FieldValue.increment(1);

        await FirebaseFirestore.instance
            .collection('WrongAnswerTestNineCollection')
            .doc(quizData['questionId'])
            .set(updatedData, SetOptions(merge: true));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving wrong answer: $e')),
        );
      }
    }
  }

  Future<void> checkWrongAttemptsAndSaveToFlashcards(Map<String, dynamic> currentQuiz) async {
    try {
      final snapshot = await FirebaseFirestore.instance
          .collection('WrongAnswerTestNineCollection')
          .doc(currentQuiz['questionId'])
          .get();

      if (snapshot.exists) {
        final data = snapshot.data();
        final wrongAttempts = data?['wrongAttempts'] ?? 0;

        String targetCollection = '';
        if (wrongAttempts == 3) {
          targetCollection = 'YellowFlashCardCollection';
        } else if (wrongAttempts > 3 && wrongAttempts <= 5) {
          targetCollection = 'OrangeFlashCardCollection';
        } else if (wrongAttempts > 5) {
          targetCollection = 'RedFlashCardCollection';
        }

        if (targetCollection.isNotEmpty) {
          await moveToFlashcardCollection(currentQuiz, targetCollection);
        }
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Error checking wrong attempts: $e')),
      );
    }
  }

  Future<void> moveToFlashcardCollection(Map<String, dynamic> quizData, String targetCollection) async {
    final userUID = FirebaseAuth.instance.currentUser?.uid;

    if (userUID != null) {
      try {
        quizData['userUID'] = userUID;
        String questionId = quizData['questionId'];

        await FirebaseFirestore.instance
            .collection(targetCollection)
            .doc(questionId)
            .set(quizData, SetOptions(merge: true));

        final collections = ['YellowFlashCardCollection', 'OrangeFlashCardCollection', 'RedFlashCardCollection'];
        for (var collection in collections) {
          if (collection != targetCollection) {
            await FirebaseFirestore.instance.collection(collection).doc(questionId).delete();
          }
        }
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error moving to flashcard collection: $e')),
        );
      }
    }
  }

  void nextQuestion() async {
    final currentQuiz = quizList[currentQuestionIndex];
    final correctAnswer = currentQuiz['CorrectAnswer'];

    if (selectedOption != null && selectedOption == correctAnswer) {
      correctAnswersCount++;
    }

    await checkWrongAttemptsAndSaveToFlashcards(currentQuiz);

    if (currentQuestionIndex < widget.selectedQuestions - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedOption = null;
        isAnswerSelected = false;
      });
    } else {
      showFinalResult();  // This will show the result dialog at the end of the quiz
    }
  }

  void showFinalResult() {
    showDialog(
      context: context,
      barrierDismissible: false,  // Prevent dialog from being dismissed by tapping outside
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: const Text("Дасгал ажиллаж дууслаа. 🎉"),
        content: Text(
          "Та ${quizList.length}-с $correctAnswersCount зөв хариулсан байна. "
          "Алдсан ${quizList.length - correctAnswersCount} асуулт тухайн дэд бүлгийн алдсан тестийн санд бүртгэгдлээ.",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {
              // Close only the dialog, not the page
              Navigator.of(context).pop(); // Dismiss the dialog
            },
            child: const Text(
              'OK',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
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
          "Асуулт ${currentQuestionIndex + 1}/${widget.selectedQuestions}",
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
                    final answer = answers[index];
                    final isSelected = selectedOption == answer;
                    final isCorrect = answer == currentQuiz['CorrectAnswer'];

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
                                  selectedOption = answer;
                                  isAnswerSelected = true;
                                });

                                final isCorrect = selectedOption == currentQuiz['CorrectAnswer'];

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      isCorrect
                                          ? "🎉 Зөв хариулт!"
                                          : "❌ Буруу хариулт. Зөв хариулт: ${currentQuiz['CorrectAnswer']}",
                                    ),
                                    backgroundColor: isCorrect ? Colors.green : Colors.redAccent,
                                  ),
                                );

                                if (!isCorrect) {
                                  saveWrongAnswerToFirestore(currentQuiz);
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
                            answer,
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
                      currentQuestionIndex == widget.selectedQuestions - 1 ? 'Дуусгах' : 'Дараа',
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
