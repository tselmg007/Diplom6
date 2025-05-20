import 'dart:async';
import 'dart:math';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:traffic/Pages/UserDashboard.dart';
import 'package:traffic/Pages/Provider/QuizProvider.dart';
import 'package:provider/provider.dart';

class UserTakeExam extends StatefulWidget {
  const UserTakeExam({Key? key}) : super(key: key);

  @override
  State<UserTakeExam> createState() => _UserExerciseState();
}

class _UserExerciseState extends State<UserTakeExam> {
  int currentQuestionIndex = 0;
  int correctAnswersCount = 0;
  List<Map<String, dynamic>> quizList = [];
  Map<int, String?> selectedAnswers = {};
  Set<int> answeredQuestions = {};
  int remainingTime = 1200;
  Timer? countdownTimer;
  String emoji = "🙂";
  List<int> skippedQuestionIndices = [];

  @override
  void initState() {
    super.initState();
    final quizProvider = Provider.of<QuizProvider>(context, listen: false);
    quizList = quizProvider.questions;
    fetchQuizzes();
    startTimer();
  }

  Future<void> fetchQuizzes() async {
    try {
      final collections = [
        'SmartTrafficInputOneCollection',
        'SmartTrafficInputTwoCollection',
        'SmartTrafficInputThreeCollection',
        'SmartTrafficInputFourCollection',
        'SmartTrafficInputFiveCollection',
        'SmartTrafficInputSixCollection',
        'SmartTrafficInputSevenCollection',
        'SmartTrafficInputEightCollection',
        'SmartTrafficInputNineCollection',
        'SmartTrafficInputTenCollection',
        'SmartTrafficInputElevenCollection',
        'SmartTrafficInputTwelveCollection',
        'SmartTrafficInputThirteenCollection',
        'SmartTrafficInputFourteenCollection',
        'SmartTrafficInputFifteenCollection',
        'SmartTrafficInputSixteenCollection',
        'SmartTrafficInputSeventeenCollection',
        'SmartTrafficInputEighteenCollection',
        'SmartTrafficInputNineteenCollection',
        'SmartTrafficInputTwentyCollection',
        'SmartTrafficInputTwentyOneCollection',
        'SmartTrafficInputTwentyTwoCollection',
        'SmartTrafficInputTwentyThreeCollection',
        'SmartTrafficInputTwentyFourCollection',
      ];

      List<Map<String, dynamic>> allQuestions = [];

      for (var collection in collections) {
        final snapshot = await FirebaseFirestore.instance
            .collection(collection)
            .orderBy('CreatedAt')
            .limit(23)
            .get();
        allQuestions.addAll(snapshot.docs.map((doc) => doc.data()));
      }

      allQuestions.shuffle(Random());
      setState(() {
        quizList = allQuestions.take(20).toList();
      });
    } catch (e) {
      debugPrint('Error fetching quizzes: $e');
    }
  }

  void startTimer() {
    countdownTimer = Timer.periodic(const Duration(seconds: 1), (timer) {
      if (remainingTime > 0) {
        setState(() {
          remainingTime--;
        });
      } else {
        timer.cancel();
        saveExamResults();
        showDialog(
          context: context,
          barrierDismissible: false,
          builder: (_) => AlertDialog(
            title: const Text("Анхааруулга !!!"),
            content: const Text("Та шалгалтаа хугацаандаа дуусгаж амжаагүй байна."),
            actions: [
              TextButton(
                child: const Text("OK"),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (_) => const UserDashboard()),
                  );
                },
              ),
            ],
          ),
        );
      }
    });
  }

  Future<void> saveExamResults() async {
    try {
      final userUID = FirebaseAuth.instance.currentUser?.uid;

      if (userUID != null) {
        final userResults = {
          'userUID': userUID,
          'correctAnswers': correctAnswersCount,
          'wrongAnswers': quizList.length - correctAnswersCount,
          'totalQuestions': quizList.length,
          'timestamp': Timestamp.now(),
        };

        await FirebaseFirestore.instance
            .collection('saveExamResult')
            .doc(userUID)
            .set(userResults);
      }
    } catch (e) {
      debugPrint('Error saving exam results: $e');
    }
  }

  Future<void> saveWrongAnswerToFirestore(Map<String, dynamic> questionData) async {
    final userUID = FirebaseAuth.instance.currentUser?.uid;
    if (userUID == null) return;

    try {
      final wrongAnswerData = {
        'userUID': userUID,
        'question': questionData['Question'],
        'correctAnswer': questionData['CorrectAnswer'],
        'selectedAnswer': selectedAnswers[currentQuestionIndex],
        'timestamp': Timestamp.now(),
        'image': questionData['Image'] ?? '',
      };

      await FirebaseFirestore.instance
          .collection('WrongAnswerExamCollection')
          .add(wrongAnswerData);
    } catch (e) {
      debugPrint('Error saving wrong answer: $e');
    }
  }

  void selectAnswer(String answer) {
    setState(() {
      selectedAnswers[currentQuestionIndex] = answer;
    });
  }

  void nextQuestion() async {
    final currentQuiz = quizList[currentQuestionIndex];
    final correctAnswer = currentQuiz['CorrectAnswer'];
    final selectedAnswer = selectedAnswers[currentQuestionIndex];

    if (selectedAnswer != null && !answeredQuestions.contains(currentQuestionIndex)) {
      if (selectedAnswer == correctAnswer) {
        correctAnswersCount++;
      } else {
        await saveWrongAnswerToFirestore(currentQuiz);
      }
      answeredQuestions.add(currentQuestionIndex);
    }

    if (currentQuestionIndex < quizList.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      showFinalResult();
    }
  }

  void previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    }
  }

  void showFinalResult() {
    if (correctAnswersCount == quizList.length) {
      emoji = "🎉";
    } else if (correctAnswersCount >= quizList.length - 5) {
      emoji = "🙂";
    } else {
      emoji = "😔";
    }

    saveExamResults();

    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (_) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        title: Text("Шалгалт дууслаа $emoji"),
        content: Text(
          "Та ${quizList.length}-с $correctAnswersCount зөв хариулсан байна.\n"
          "Алдсан ${quizList.length - correctAnswersCount} асуулт.",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pushReplacement(
                context,
                MaterialPageRoute(builder: (context) => const UserDashboard()),
              );
            },
            child: const Text("OK"),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    countdownTimer?.cancel();
    super.dispose();
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

    int minutes = remainingTime ~/ 60;
    int seconds = remainingTime % 60;

    return WillPopScope(
      onWillPop: () async {
        bool? exit = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Шалгалт дуусгах уу?"),
            content: const Text("Үр дүн дашбоард-д хадгалагдахгүйг анхаарна уу? Гарахдаа итгэлтэй байна уу?"),
            actions: [
              TextButton(
                child: const Text("Үгүй"),
                onPressed: () => Navigator.of(context).pop(false),
              ),
              TextButton(
                child: const Text("Тийм"),
                onPressed: () => Navigator.of(context).pop(true),
              ),
            ],
          ),
        );
        return exit ?? false;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            "Асуулт ${currentQuestionIndex + 1}/${quizList.length}",
            style: const TextStyle(color: Colors.black, fontSize: 15),
          ),
          backgroundColor: Colors.blue[100],
          iconTheme: const IconThemeData(color: Colors.black),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 16),
              child: Center(
                child: Text(
                  "$minutes:${seconds.toString().padLeft(2, '0')}",
                  style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ],
        ),
        body: Stack(
          children: [
            SingleChildScrollView(
              padding: const EdgeInsets.only(left: 20, right: 20, top: 20, bottom: 150),
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
                    Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        question,
                        style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        textAlign: TextAlign.start,
                      ),
                    ),
                    const SizedBox(height: 10),
                    if (imageUrl.isNotEmpty && imageUrl.startsWith("http"))
                      Center(
                        child: ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            imageUrl,
                            width: MediaQuery.of(context).size.width * 0.8,
                            height: 170,
                            fit: BoxFit.cover,
                            errorBuilder: (context, error, stackTrace) => const SizedBox(),
                          ),
                        ),
                      ),
                    const SizedBox(height: 20),
                    ...List.generate(answers.length, (index) {
                      final isSelected = selectedAnswers[currentQuestionIndex] == answers[index];
                      final isCorrect = answers[index] == currentQuiz['CorrectAnswer'];

                      Color buttonColor = isSelected ? Colors.blue[100]! : Colors.white;
                      if (selectedAnswers[currentQuestionIndex] != null) {
                        if (isSelected && isCorrect) {
                          buttonColor = Colors.blue;
                        } else if (isSelected && !isCorrect) {
                          buttonColor = Colors.blue;
                        }
                      }

                      return Padding(
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: () => selectAnswer(answers[index]),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: buttonColor,
                              foregroundColor: Colors.black,
                              minimumSize: const Size(double.infinity, 50),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              side: BorderSide(
                                color: buttonColor == Colors.white
                                    ? Colors.grey.shade300
                                    : Colors.black,
                              ),
                            ),
                            child: Center(
                              child: Text(
                                answers[index],
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 14,
                                ),
                              ),
                            ),
                          ),
                        ),
                      );
                    }),
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
                        onPressed: previousQuestion,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.blueAccent,
                          padding: const EdgeInsets.symmetric(vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
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
                      onPressed: selectedAnswers[currentQuestionIndex] == null ? null : nextQuestion,
                      style: ElevatedButton.styleFrom(
                        minimumSize: const Size(double.infinity, 50),
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(25),
                        ),
                        side: const BorderSide(color: Colors.white, width: 1),
                      ),
                      child: Text(
                        currentQuestionIndex == quizList.length - 1 ? 'Дуусгах' : 'Дараа',
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}