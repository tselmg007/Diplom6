import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:traffic/Pages/EditQuestion/EditOneQuestionPage.dart';

class AdminQuizFifteenListPage extends StatefulWidget {
  const AdminQuizFifteenListPage({Key? key}) : super(key: key);

  @override
  State<AdminQuizFifteenListPage> createState() => _AdminQuizListOnePagesState();
}

class _AdminQuizListOnePagesState extends State<AdminQuizFifteenListPage> {
  bool _isLoading = false;

  Stream<List<Map<String, dynamic>>> fetchQuestions() {
    return FirebaseFirestore.instance
        .collection('SmartTrafficInputFifteenCollection')
        .snapshots()
        .map((snapshot) => snapshot.docs
            .map((doc) => doc.data() as Map<String, dynamic>)
            .toList());
  }

  Future<void> deleteQuestion(String id) async {
    setState(() {
      _isLoading = true;
    });

    try {
      await FirebaseFirestore.instance
          .collection('SmartTrafficInputFifteenCollection')
          .doc(id)
          .delete();

      setState(() {
        _isLoading = false;
      });

   ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text(
      "🗑️ Асуулт амжилттай устгагдлаа! ✅",
      style: TextStyle( fontSize: 12),
    ),
    backgroundColor: Colors.redAccent, // 🔥 Устгалтын өнгө
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    duration: Duration(seconds: 2),
  ),
);

    } catch (e) {
      setState(() {
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text("Алдаа гарлаа. Асуулт устгах боломжгүй!"),
      ));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Асуултуудын жагсаалт", style: TextStyle(color: Colors.black)),
        backgroundColor: Colors.blue[100],
        elevation: 0,
        iconTheme: IconThemeData(color: Colors.black),
      ),
      body: StreamBuilder<List<Map<String, dynamic>>>(
        stream: fetchQuestions(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          }

          if (snapshot.hasError) {
            return Center(child: Text("Алдаа гарлаа."));
          }

          final questions = snapshot.data ?? [];

          return Stack(
            children: [
              ListView.builder(
                itemCount: questions.length,
                itemBuilder: (context, index) {
                  final question = questions[index];
                  final questionId = question['questionId'] ?? '';
                  final questionText = question['Question'] ?? 'Асуулт байхгүй';

                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 1.0),
                    child: Card(
                      margin: EdgeInsets.symmetric(vertical: 8, horizontal: 25),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Container(
                        decoration: BoxDecoration(
                          
                          color: Colors.blue[100],
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(color: Colors.pink.withOpacity(0.4), blurRadius: 6, spreadRadius: 2),
                          ],
                        ),
                        child: ListTile(
                          leading: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: Text(
                              "${index + 1}",
                              style: TextStyle(fontWeight: FontWeight.bold, color: Colors.black),
                            ),
                          ),
                          title: Text(
                            questionText,
                            style: TextStyle(
                              fontWeight: FontWeight.w600,
                              fontSize: 16,
                            ),
                          ),
                          trailing: IconButton(
                            icon: Icon(Icons.delete, color: Colors.red),
                            onPressed: () => deleteQuestion(questionId),
                          ),
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => EditOneQuestionPage(
                                  questionId: questionId,
                                  questionData: question,
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                  );
                },
              ),
              if (_isLoading)
                Center(
                  child: CircularProgressIndicator(),
                ),
            ],
          );
        },
      ),
    );
  }
}
