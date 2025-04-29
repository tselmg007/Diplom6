import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // To get the current user's UID
import 'package:flutter/material.dart';

class UserExerciseTwo extends StatefulWidget {
  final int questionCount;
   const UserExerciseTwo({Key? key, required this.questionCount}) : super(key: key); // ✅

  @override
  State<UserExerciseTwo> createState() => _UserExerciseState();
}

class _UserExerciseState extends State<UserExerciseTwo> {
  int currentQuestionIndex = 0;
  int correctAnswersCount = 0;
  List<Map<String, dynamic>> quizList = [];
  String? selectedOption;
  bool? isAnswerCorrect;

  @override 
  void initState() {
    super.initState();
    fetchQuizzes();
  }

  Future<void> fetchQuizzes() async {
    final snapshot = await FirebaseFirestore.instance
        .collection('SmartTrafficInputTwoCollection')
        .orderBy('CreatedAt')
        .get();

    setState(() {
      quizList = snapshot.docs.map((doc) => doc.data()).toList();
    });
  }

  // Save wrong answers to Firestore with userUID
  Future<void> saveWrongAnswerToFirestore(Map<String, dynamic> quizData) async {
    final userUID = FirebaseAuth.instance.currentUser?.uid;  // Get the current user's UID

    if (userUID != null) {
      quizData['userUID'] = userUID; // Add userUID to the quizData map

      // Save the wrong answer with userUID to the collection
      await FirebaseFirestore.instance
          .collection('WrongAnswerTestTwoCollection')
          .doc(quizData['questionId']) // Use questionId as the document ID
          .set(quizData);
    }
  }

  void nextQuestion() {
    final currentQuiz = quizList[currentQuestionIndex];
    final correctAnswer = currentQuiz['CorrectAnswer'];

    if (selectedOption != null && selectedOption == correctAnswer) {
      correctAnswersCount++;
    }

    if (currentQuestionIndex < quizList.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedOption = null;
        isAnswerCorrect = null;
      });
    } else {
      showFinalResult();
    }
  }

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
                        onPressed: selectedOption == null
                            ? () {
                                setState(() {
                                  selectedOption = answers[index];
                                  isAnswerCorrect = answers[index] == currentQuiz['CorrectAnswer'];
                                });

                                if (!isAnswerCorrect!) {
                                  // Save the question to the wrong answers collection if the answer is incorrect
                                  saveWrongAnswerToFirestore(currentQuiz);
                                }

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      isAnswerCorrect!
                                          ? "🎉 Зөв хариулт!"
                                          : "❌ Буруу хариулт. Зөв нь: ${currentQuiz['CorrectAnswer']}",
                                    ),
                                    backgroundColor:
                                        isAnswerCorrect! ? Colors.green : Colors.redAccent,
                                    duration: const Duration(seconds: 2),
                                    behavior: SnackBarBehavior.floating,
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    margin: const EdgeInsets.all(12),
                                  ),
                                );
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: buttonColor,
                          foregroundColor: Colors.black,
                          minimumSize: const Size(double.infinity, 45),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          side: BorderSide(
                            color: buttonColor == Colors.white ? Colors.grey.shade300 : Colors.black,
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
                          isAnswerCorrect = null;
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
                    onPressed: selectedOption == null ? null : nextQuestion,
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
