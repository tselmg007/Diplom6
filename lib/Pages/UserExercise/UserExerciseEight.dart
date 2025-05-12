import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class UserExerciseEight extends StatefulWidget {
  final int startIndex;
  final int endIndex;

  const UserExerciseEight({Key? key, required this.startIndex, required this.endIndex}) : super(key: key);

  @override
  State<UserExerciseEight> createState() => _UserExerciseState();
}

class _UserExerciseState extends State<UserExerciseEight> {
  int currentQuestionIndex = 0;
  int correctAnswersCount = 0;
  List<Map<String, dynamic>> quizList = [];
  String? selectedOption;
  bool isAnswerSelected = false;
  bool showOnlyWrong = false;
  bool hasSavedWrongAnswer = false;
  bool isQuestionSaved = false;
  List<bool> isQuestionSavedList = [];

  @override
void initState() {
  super.initState();
  fetchQuizzes();
  }

  Future<void> fetchQuizzes() async {
  try {
    final snapshot = await FirebaseFirestore.instance
        .collection('SmartTrafficInputEightCollection')
        .orderBy('CreatedAt')
        .get();

    final allQuizzes = snapshot.docs.map((doc) => doc.data()).toList();
    final selectedRange = allQuizzes.sublist(
      widget.startIndex - 1,
      widget.endIndex > allQuizzes.length ? allQuizzes.length : widget.endIndex,
    );

    setState(() {
      quizList = selectedRange;
      isQuestionSavedList = List.generate(quizList.length, (_) => false);
    });

    await checkIfQuestionIsSaved(); // <<== CHECK SKIP AFTER QUIZ FETCHED
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Error fetching quizzes: $e')),
    );
  }
}

 Future<void> checkIfQuestionIsSaved() async {
  final userUID = FirebaseAuth.instance.currentUser?.uid;
  if (userUID != null && quizList.isNotEmpty) {
    final quiz = quizList[currentQuestionIndex];
    final doc = await FirebaseFirestore.instance
        .collection('SkipQuizCollection')
        .doc(quiz['questionId'])
        .get();

    setState(() {
      isQuestionSavedList[currentQuestionIndex] = doc.exists && doc.data()?['userUID'] == userUID;
      showOnlyWrong = isQuestionSavedList[currentQuestionIndex];
    });
  }
}


  Future<void> saveToFirestore(String collectionName, Map<String, dynamic> quizData) async {
    final userUID = FirebaseAuth.instance.currentUser?.uid;
    if (userUID != null && quizData['questionId'] != null) {
      try {
        final dataToSave = Map<String, dynamic>.from(quizData);
        dataToSave['userUID'] = userUID;
        await FirebaseFirestore.instance
            .collection(collectionName)
            .doc(quizData['questionId'])
            .set(dataToSave, SetOptions(merge: true));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving to $collectionName: $e')),
        );
      }
    }
  }

  Future<void> saveWrongAnswer(Map<String, dynamic> quizData) async {
    final userUID = FirebaseAuth.instance.currentUser?.uid;
    if (userUID != null && quizData['questionId'] != null) {
      try {
        final data = Map<String, dynamic>.from(quizData);
        data['userUID'] = userUID;
        data['wrongAttempts'] = FieldValue.increment(1);
        await FirebaseFirestore.instance
            .collection('WrongAnswerTestEightCollection')
            .doc(quizData['questionId'])
            .set(data, SetOptions(merge: true));
      } catch (e) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error saving wrong answer: $e')),
        );
      }
    }
  }

  Future<void> checkWrongAttempts(Map<String, dynamic> quizData) async {
    final doc = await FirebaseFirestore.instance
        .collection('WrongAnswerTestEightCollection')
        .doc(quizData['questionId'])
        .get();

    if (doc.exists) {
      final attempts = (doc.data()?['wrongAttempts'] ?? 0) as int;
      String collection = '';

      if (attempts == 3) {
        collection = 'YellowFlashCardCollection';
      } else if (attempts > 3 && attempts <= 5) {
        collection = 'OrangeFlashCardCollection';
      } else if (attempts > 5) {
        collection = 'RedFlashCardCollection';
      }

      if (collection.isNotEmpty) {
        await saveToFirestore(collection, quizData);

        for (final other in ['YellowFlashCardCollection', 'OrangeFlashCardCollection', 'RedFlashCardCollection']) {
          if (other != collection) {
            await FirebaseFirestore.instance.collection(other).doc(quizData['questionId']).delete();
          }
        }
      }
    }
  }

Future<void> onCheckboxChanged(bool? val) async {
  final userUID = FirebaseAuth.instance.currentUser?.uid;
  final quiz = quizList[currentQuestionIndex];

  if (val == true) {
    await saveToFirestore('SkipQuizCollection', quiz);
    setState(() {
      isQuestionSavedList[currentQuestionIndex] = true;
      showOnlyWrong = true;
    });
  } else {
    final confirmed = await showDialog<bool>(
      context: context,
      builder: (context) => AlertDialog(
        title: Text("Баталгаажуулалт"),
        content: Text("Энэ асуултыг алгасах жагсаалтаас устгах уу?"),
        actions: [
          TextButton(onPressed: () => Navigator.pop(context, false), child: Text("Үгүй")),
          TextButton(onPressed: () => Navigator.pop(context, true), child: Text("Тийм")),
        ],
      ),
    );

    if (confirmed == true) {
      await FirebaseFirestore.instance
          .collection('SkipQuizCollection')
          .doc(quiz['questionId'])
          .delete();
      setState(() {
        isQuestionSavedList[currentQuestionIndex] = false;
        showOnlyWrong = false;
      });
    }
  }
}


  Future<void> nextQuestion({bool skipped = false}) async {
    final quiz = quizList[currentQuestionIndex];
    final correctAnswer = quiz['CorrectAnswer'];

    if (skipped) {
      final doc = await FirebaseFirestore.instance
          .collection('ComplicatedQuestionCollection')
          .doc(quiz['questionId'])
          .get();
      
      if (doc.exists) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text("Энэ асуулт өмнө нь хадгалагдсан байна")),
        );
        return;
      }
      
      await saveToFirestore('ComplicatedQuestionCollection', quiz);
    } else {
      final isCorrect = selectedOption == correctAnswer;

      if (!isCorrect && !hasSavedWrongAnswer && !showOnlyWrong) {
        await saveWrongAnswer(quiz);
        await checkWrongAttempts(quiz);
      }

      if (!isCorrect && selectedOption == null && !showOnlyWrong) {
        await saveWrongAnswer(quiz);
        await checkWrongAttempts(quiz);
      } else if (isCorrect) {
        correctAnswersCount++;
      }
    }


    if (currentQuestionIndex < quizList.length - 1) {
      setState(() {
        currentQuestionIndex++;
        selectedOption = null;
        isAnswerSelected = false;
        hasSavedWrongAnswer = false;
      });
       await checkIfQuestionIsSaved(); 
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
        title: const Text("Дасгал дууслаа 🎉"),
        content: Text(
          "Та ${quizList.length}-аас $correctAnswersCount зөв хариуллаа. "
          "Алдаатай болон алгассан асуулт хадгалагдлаа.",
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK', style: TextStyle(fontWeight: FontWeight.bold)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (quizList.isEmpty) {
      return const Scaffold(body: Center(child: CircularProgressIndicator()));
    }

    final quiz = quizList[currentQuestionIndex];
    final question = quiz['Question'] ?? 'Асуулт алга';
    final imageUrl = quiz['Image'] ?? '';
    final answers = List.generate(5, (i) => quiz['Answer${i + 1}'] ?? '').where((e) => e.isNotEmpty).toList();

    return Scaffold(
      appBar: AppBar(
        title: Text("Асуулт ${widget.startIndex + currentQuestionIndex}/${widget.endIndex}",
            style: const TextStyle(color: Colors.black)),
        backgroundColor: Colors.blue[100],
        iconTheme: const IconThemeData(color: Colors.black),
        actions: [
          Row(
            children: [
              const Text("Эргэлзсэн асуулт", style: TextStyle(fontSize: 13, color: Colors.black)),
              Checkbox(
  value: isQuestionSavedList.isNotEmpty ? isQuestionSavedList[currentQuestionIndex] : false,
  onChanged: onCheckboxChanged,
)
            ],
          )
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
              ),
              padding: const EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(question, style: const TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                  if (imageUrl.isNotEmpty && imageUrl.startsWith("http"))
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15),
                        child: Image.network(imageUrl, height: 170, fit: BoxFit.cover),
                      ),
                    ),
                  const SizedBox(height: 10),
                  ...answers.map((answer) {
                    final isSelected = selectedOption == answer;
                    final isCorrect = answer == quiz['CorrectAnswer'];
                    Color color = Colors.white;

                    if (selectedOption != null) {
                      if (isSelected && isCorrect) color = Colors.greenAccent;
                      else if (isSelected && !isCorrect) color = Colors.redAccent;
                    }

                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: ElevatedButton(
                        onPressed: !isAnswerSelected
                            ? () async {
                                setState(() {
                                  selectedOption = answer;
                                  isAnswerSelected = true;
                                });

                                final correct = answer == quiz['CorrectAnswer'];

                                if (!correct) {
                                  await saveWrongAnswer(quiz);
                                  await checkWrongAttempts(quiz);
                                  hasSavedWrongAnswer = true;
                                }

                                ScaffoldMessenger.of(context).showSnackBar(
                                  SnackBar(
                                    content: Text(
                                      correct
                                          ? "🎉 Зөв хариулт!"
                                          : "❌ Буруу хариулт. Зөв: ${quiz['CorrectAnswer']}",
                                    ),
                                    backgroundColor: correct ? Colors.green : Colors.red,
                                  ),
                                );
                              }
                            : null,
                        style: ElevatedButton.styleFrom(
                          backgroundColor: color,
                          foregroundColor: Colors.black,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                          minimumSize: const Size(double.infinity, 45),
                        ),
                        child: Align(
                          alignment: Alignment.centerLeft,
                          child: Text(answer, style: const TextStyle(fontWeight: FontWeight.bold)),
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
                      onPressed: () => setState(() {
                        currentQuestionIndex--;
                        selectedOption = null;
                        isAnswerSelected = false;
                      }),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blueAccent,
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                      ),
                      child: const Text('Буцах', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                    ),
                  ),
                if (currentQuestionIndex > 0) const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: () => nextQuestion(skipped: true),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.orangeAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    child: const Text('Алгасах', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)),
                  ),
                ),
                const SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    onPressed: (isAnswerSelected || showOnlyWrong) ? () => nextQuestion(skipped: false) : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blueAccent,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                    ),
                    child: Text(
                      currentQuestionIndex == quizList.length - 1 ? 'Дуусгах' : 'Дараа',
                      style: const TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}