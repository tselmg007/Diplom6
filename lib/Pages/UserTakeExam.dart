import 'dart:async';
import 'dart:math'; // For random selection
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
import 'package:flutter/material.dart';
import 'package:traffic/Pages/UserDashboard.dart'; // Import UserDashboard
import 'package:traffic/Pages/Provider/QuizProvider.dart'; // Та өөрийн замаа ашиглана уу
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
  String? selectedOption;
  bool? isAnswerCorrect;
  int remainingTime = 1200; // 20 minutes (1200 seconds)
  Timer? countdownTimer;
  String emoji = "🙂"; // Default emoji for neutral feedback
  List<int> skippedQuestionIndices = [];
  

@override
void initState() {
  super.initState();
  final quizProvider = Provider.of<QuizProvider>(context, listen: false);
  quizList = quizProvider.questions; // Шууд Provider-оос авна
  startTimer();
}


  // Fetch 10 questions from each collection and combine them
  Future<void> fetchQuizzes() async {
    final snapshot1 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputOneCollection')
        .orderBy('CreatedAt')
        .limit(23)
        .get();

    final snapshot2 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputTwoCollection')
        .orderBy('CreatedAt')
        .limit(23)
        .get();

        final snapshot3 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputThreeCollection')
        .orderBy('CreatedAt')
        .limit(23)
        .get();

    final snapshot4 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputFourCollection')
        .orderBy('CreatedAt')
        .limit(23)
        .get();

        final snapshot5 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputFiveCollection')
        .orderBy('CreatedAt')
        .limit(23)
        .get();

    final snapshot6 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputSixCollection')
        .orderBy('CreatedAt')
        .limit(23)
        .get();

        final snapshot7 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputSevenCollection')
        .orderBy('CreatedAt')
        .limit(23)
        .get();

    final snapshot8 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputEightCollection')
        .orderBy('CreatedAt')
        .limit(23)
        .get();

        final snapshot9 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputNineCollection')
        .orderBy('CreatedAt')
        .limit(23)
        .get();

    final snapshot10 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputTenCollection')
        .orderBy('CreatedAt')
        .limit(23)
        .get();

        final snapshot11 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputElevenCollection')
        .orderBy('CreatedAt')
        .limit(23)
        .get();

    final snapshot12 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputTwelveCollection')
        .orderBy('CreatedAt')
        .limit(23)
        .get();

        final snapshot13 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputThirteenCollection')
        .orderBy('CreatedAt')
        .limit(23)
        .get();

    final snapshot14 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputFourteenCollection')
        .orderBy('CreatedAt')
        .limit(23)
        .get();

        final snapshot15 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputFifteenCollection')
        .orderBy('CreatedAt')
        .limit(23)
        .get();

    final snapshot16 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputSixteenCollection')
        .orderBy('CreatedAt')
        .limit(23)
        .get();

        final snapshot17 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputSeventeenCollection')
        .orderBy('CreatedAt')
        .limit(23)
        .get();

    final snapshot18 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputEighteenCollection')
        .orderBy('CreatedAt')
        .limit(23)
        .get();

        final snapshot19 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputNineteenCollection')
        .orderBy('CreatedAt')
        .limit(23)
        .get();

    final snapshot20 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputTwentyCollection')
        .orderBy('CreatedAt')
        .limit(23)
        .get();

        final snapshot21 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputTwentyOneCollection')
        .orderBy('CreatedAt')
        .limit(23)
        .get();

    final snapshot22 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputTwentyTwoCollection')
        .orderBy('CreatedAt')
        .limit(23)
        .get();

        final snapshot23 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputTwentyThreeCollection')
        .orderBy('CreatedAt')
        .limit(23)
        .get();

    final snapshot24 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputTwentyFourCollection')
        .orderBy('CreatedAt')
        .limit(23)
        .get();

    List<Map<String, dynamic>> allQuestions = [
      ...snapshot1.docs.map((doc) => doc.data()),
      ...snapshot2.docs.map((doc) => doc.data()),
      ...snapshot3.docs.map((doc) => doc.data()),
      ...snapshot4.docs.map((doc) => doc.data()),
      ...snapshot5.docs.map((doc) => doc.data()),
      ...snapshot6.docs.map((doc) => doc.data()),
      ...snapshot7.docs.map((doc) => doc.data()),
      ...snapshot8.docs.map((doc) => doc.data()),
      ...snapshot9.docs.map((doc) => doc.data()),
      ...snapshot10.docs.map((doc) => doc.data()),
      ...snapshot11.docs.map((doc) => doc.data()),
      ...snapshot12.docs.map((doc) => doc.data()),
      ...snapshot13.docs.map((doc) => doc.data()),
      ...snapshot14.docs.map((doc) => doc.data()),
      ...snapshot15.docs.map((doc) => doc.data()),
      ...snapshot16.docs.map((doc) => doc.data()),
      ...snapshot17.docs.map((doc) => doc.data()),
      ...snapshot18.docs.map((doc) => doc.data()),
      ...snapshot19.docs.map((doc) => doc.data()),
      ...snapshot20.docs.map((doc) => doc.data()),
      ...snapshot21.docs.map((doc) => doc.data()),
      ...snapshot22.docs.map((doc) => doc.data()),
      ...snapshot23.docs.map((doc) => doc.data()),
      ...snapshot24.docs.map((doc) => doc.data()),
    ];

    allQuestions.shuffle(Random());

    setState(() {
      quizList = allQuestions.take(20).toList();
    });
  }

  // Start the timer for 20 minutes
  void startTimer() {
  countdownTimer = Timer.periodic(Duration(seconds: 1), (timer) {
    if (remainingTime > 0) {
      setState(() {
        remainingTime--;
      });
    } else {
      timer.cancel();
      saveExamResults(); // Save results even if incomplete
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (_) => AlertDialog(
          title: const Text("Время истекло!"),
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
      } else {
        debugPrint("User UID not found!");
      }
    } catch (e) {
      debugPrint('Error saving exam results: $e');
    }
  }

Future<void> saveWrongAnswerToFirestore(Map<String, dynamic> questionData) async {
  final userUID = FirebaseAuth.instance.currentUser?.uid;
  if (userUID == null) return;

  final wrongAnswerData = {
    'userUID': userUID,
    'question': questionData['Question'],
    'correctAnswer': questionData['CorrectAnswer'],
    'selectedAnswer': selectedOption,
    'timestamp': Timestamp.now(),
    'image': questionData['Image'] ?? '',
  };

  await FirebaseFirestore.instance
      .collection('WrongAnswerExamCollection')
      .add(wrongAnswerData);
}

  // Move to the next question
  void nextQuestion() async {
  final currentQuiz = quizList[currentQuestionIndex];
  final correctAnswer = currentQuiz['CorrectAnswer'];

  if (selectedOption != null) {
    if (selectedOption == correctAnswer) {
      correctAnswersCount++;
    } else {
      await saveWrongAnswerToFirestore(currentQuiz);
    }
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

  // Show final result after the test is completed
  void showFinalResult() {
    if (correctAnswersCount == quizList.length) {
      emoji = "🎉";
    } else if (correctAnswersCount >= quizList.length - 5) {
      emoji = "🙂";
    } else {
      emoji = "😔";
    }

    saveExamResults();  // Save the results after the test is completed

    bool navigated = false;

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
              if (!navigated) {
                navigated = true;
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const UserDashboard()),
                );
              }
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
        // Show confirmation dialog if the user tries to go back
        bool? exit = await showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: const Text("Тестээс гарах уу?"),
            content: const Text("Та шалгалтыг дуусгаагүй байна. Гарахдаа итгэлтэй байна уу?"),
            actions: [
              TextButton(
                child: const Text("Үгүй"),
                onPressed: () {
                  Navigator.of(context).pop(false); // Don't exit
                },
              ),
              TextButton(
                child: const Text("Тийм"),
                onPressed: () {
                  Navigator.of(context).pop(true); // Exit the exam
                },
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
            style: const TextStyle(color: Colors.black, fontWeight: FontWeight.bold, fontSize: 15),
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
                        padding: const EdgeInsets.only(bottom: 8),
                        child: Center(
                          child: ElevatedButton(
                            onPressed: selectedOption == null
                                ? () async {
                                    setState(() {
                                      selectedOption = answers[index];
                                      isAnswerCorrect = isCorrect;
                                    });

                                   if (!isCorrect) {
  await saveWrongAnswerToFirestore(currentQuiz);
}
                                  }
                                : null,
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
                    const SizedBox(height: 15),
                  ],
                ),
              ),
            ),
            if (selectedOption != null || currentQuestionIndex > 0)
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
                        onPressed: selectedOption == null ? null : nextQuestion,
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
