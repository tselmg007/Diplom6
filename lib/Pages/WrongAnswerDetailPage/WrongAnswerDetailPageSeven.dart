import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';  // To get the current user's UID
import 'package:flutter/material.dart';

class WrongAnswerDetailPageSeven extends StatefulWidget {
  const WrongAnswerDetailPageSeven({Key? key}) : super(key: key);

  @override
  State<WrongAnswerDetailPageSeven> createState() => _WrongAnswerDetailPage1State();
}

class _WrongAnswerDetailPage1State extends State<WrongAnswerDetailPageSeven> {
  int currentQuestionIndex = 0;
  List<Map<String, dynamic>> quizList = [];
  String? selectedOption;
  bool? isAnswerCorrect;
  bool isLoading = true;

  static const String collectionName = 'WrongAnswerTestSevenCollection';

  @override
  void initState() {
    super.initState();
    fetchWrongAnswers();
  }

  // Fetch questions from Firestore
  Future<void> fetchWrongAnswers() async {
    setState(() {
      isLoading = true;  // Show loading indicator when fetching data
    });

    try {
      final userUID = FirebaseAuth.instance.currentUser?.uid;  // Get the current user's UID
      if (userUID != null) {
        final snapshot = await FirebaseFirestore.instance
            .collection(collectionName)
            .where('userUID', isEqualTo: userUID)  // Filter by userUID
            .get();

        setState(() {
          quizList = snapshot.docs
              .map((doc) => doc.data() as Map<String, dynamic>)
              .toList();
          isLoading = false;  // Data has been fetched, hide loading
        });
      }
    } catch (e) {
      setState(() {
        isLoading = false;  // Hide loading on error
      });
      debugPrint('Error fetching data: $e');
    }
  }

  // Delete a question from Firestore by its questionId
  Future<void> deleteQuestion(String questionId) async {
    try {
      await FirebaseFirestore.instance
          .collection(collectionName)
          .doc(questionId)
          .delete();
      setState(() {
        quizList.removeAt(currentQuestionIndex);
        if (currentQuestionIndex >= quizList.length && currentQuestionIndex > 0) {
          currentQuestionIndex--;
        }
        selectedOption = null;
        isAnswerCorrect = null;
      });
      // Fetch updated data after deleting the question
      await fetchWrongAnswers();
    } catch (e) {
      debugPrint('Error deleting question: $e');
    }
  }

  void nextQuestion() {
    if (currentQuestionIndex < quizList.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedOption = null;
        isAnswerCorrect = null;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(content: Text('Сүүлчийн асуулт байна.')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    if (isLoading) {
      // Show loading indicator while data is being fetched
      return const Scaffold(
        body: Center(child: CircularProgressIndicator()),
      );
    }

    // Show message when no questions are available
    if (quizList.isEmpty) {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            'Алдсан асуулт',
            style: TextStyle(color: Colors.black, fontSize: 15),
          ),
          backgroundColor: Colors.blue[100],
          iconTheme: const IconThemeData(color: Colors.black),
          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Colors.black),
            onPressed: () {
              // Handle the back action
              Navigator.of(context).pop();
            },
          ),
        ),
        body: const Center(
          child: Text(
            'Асуулт хоосон байна!',
            style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
          ),
        ),
      );
    }

    final currentQuiz = quizList[currentQuestionIndex];
    final question = currentQuiz['Question'] ?? 'Асуулт олдсонгүй';
    final imageUrl = currentQuiz['Image'] ?? '';
    final correctAnswer = currentQuiz['CorrectAnswer'];
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
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () {
            // Handle the back action
            Navigator.of(context).pop();
          },
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete, color: Colors.red),
            onPressed: () {
              showDialog(
                context: context,
                builder: (BuildContext context) {
                  return AlertDialog(
                    title: const Text("Устгах уу?"),
                    content: const Text("Та энэ асуултыг бүр мөсөн устгахдаа итгэлтэй байна уу?"),
                    actions: [
                      TextButton(
                        child: const Text("Cancel"),
                        onPressed: () => Navigator.of(context).pop(),
                      ),
                      TextButton(
                        child: const Text("OK"),
                        onPressed: () async {
                          if (currentQuiz['questionId'] != null) {
                            await deleteQuestion(currentQuiz['questionId']);
                            Navigator.of(context).pop();
                          }
                        },
                      ),
                    ],
                  );
                },
              );
            },
          ),
        ],
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
                    final isCorrect = answers[index] == correctAnswer;

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
                                  isAnswerCorrect = answers[index] == correctAnswer;
                                });

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      isAnswerCorrect!
                                          ? "🎉 Зөв хариулт!"
                                          : "❌ Буруу хариулт. Зөв нь: $correctAnswer",
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
