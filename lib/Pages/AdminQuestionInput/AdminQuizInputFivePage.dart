import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'dart:typed_data';
import 'package:image_picker/image_picker.dart';

class AdminQuizInputFivePage extends StatefulWidget {
  @override
  _AdminQuizInputOnePageState createState() => _AdminQuizInputOnePageState();
}

class _AdminQuizInputOnePageState extends State<AdminQuizInputFivePage> {
  final TextEditingController questionController = TextEditingController();
  final List<TextEditingController> answerControllers = List.generate(5, (_) => TextEditingController());
  final List<bool> answerCheckBoxes = List.generate(5, (_) => false);
  bool _isSaving = false;
  int? _correctAnswer;
  Uint8List? _webImageBytes;

  static const String quizCollection = 'SmartTrafficInputFiveCollection';
  static const String storagePath = 'quiz5_images/';

  Future<String?> uploadImage(Uint8List imageBytes, String questionId) async {
    try {
      final fileName = 'quiz5_$questionId.png';
      final storageRef = FirebaseStorage.instance.ref().child(storagePath + fileName);
      final uploadTask = storageRef.putData(imageBytes);
      final snapshot = await uploadTask.whenComplete(() {});
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      debugPrint("🖼️ Зураг байршуулах алдаа: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("🖼️ Зураг байршуулах алдаа: ${e.toString()}"))
      );
      return null;
    }
  }

  Future<void> saveQuestionToFirebase() async {
    if (_isSaving) return;

    final user = FirebaseAuth.instance.currentUser;
    print("🟢 Хандалт хийх гэж байгаа хэрэглэгч: ${user?.email}");

    setState(() => _isSaving = true);

    try {
      final snapshot = await FirebaseFirestore.instance
          .collection(quizCollection)
          .get();
      final quizCount = snapshot.docs.length;

      final question = questionController.text.trim();
      final answers = answerControllers
          .map((controller) => controller.text.trim())
          .where((text) => text.isNotEmpty)
          .toList();

      if (question.isEmpty) throw "📝 Асуулт хоосон байж болохгүй!";
      if (answers.length < 2) throw "🔢 Дор хаяж 2 хариулт өгнө үү!";
      if (_correctAnswer == null) throw "✅ Зөв хариулт сонгогдоогүй байна!";

      String? imageUrl;

      final docRef = await FirebaseFirestore.instance
          .collection(quizCollection)
          .add({}); // Эхлээд хоосон doc үүсгээд ID-г авна
      final questionId = docRef.id;

      if (_webImageBytes != null) {
        imageUrl = await uploadImage(_webImageBytes!, questionId);
        if (imageUrl == null) throw "Зургийг байршуулж чадсангүй";
      }

      final quizData = {
        "Question": question,
        "Answer1": answers.isNotEmpty ? answers[0] : "",
        "Answer2": answers.length > 1 ? answers[1] : "",
        "Answer3": answers.length > 2 ? answers[2] : "",
        "Answer4": answers.length > 3 ? answers[3] : "",
        "Answer5": answers.length > 4 ? answers[4] : "",
        "CorrectAnswer": answers[_correctAnswer!],
        "Image": imageUrl ?? "",
        "CreatedAt": FieldValue.serverTimestamp(),
        "questionId": questionId,
      };

      await docRef.set(quizData); // quizData-г бүрэн шинэчилж хадгалах

      questionController.clear();
      for (final controller in answerControllers) {
        controller.clear();
      }
      setState(() => _webImageBytes = null);
      _correctAnswer = null;
      answerCheckBoxes.fillRange(0, answerCheckBoxes.length, false);

      final successNumber = quizCount + 1;

       ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text(
      "✅ $successNumber дахь асуулт хадгалагдлаа! 🎉",
      style: TextStyle( fontSize: 12),
    ),
    backgroundColor: Colors.greenAccent, // 🔥 Устгалтын өнгө
    behavior: SnackBarBehavior.floating,
    margin: EdgeInsets.all(12),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(12),
    ),
    duration: Duration(seconds: 2),
  ),

      );
    } catch (e) {
      debugPrint("Хадгалах алдаа: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Алдаа гарлаа: ${e.toString()} 😓"))
      );
    } finally {
      setState(() => _isSaving = false);
    }
  }

  Future<void> _pickImage() async {
    try {
      final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final bytes = await pickedFile.readAsBytes();
        setState(() => _webImageBytes = bytes);
      }
    } catch (e) {
      debugPrint("Image picker error: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("📷 Зураг сонгох үед алдаа: ${e.toString()} 😢"))
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Асуулт нэмэх"),
        backgroundColor: Colors.blue[100],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.blue[100],
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(color: Colors.black.withOpacity(0.1), blurRadius: 8, spreadRadius: 2),
            ],
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              TextField(
                controller: questionController,
                keyboardType: TextInputType.multiline,
                maxLines: null,
                decoration: InputDecoration(
                  labelText: "Асуулт оруулна уу?",
                  labelStyle: TextStyle(color: Colors.blue),
                  border: OutlineInputBorder(),
                  filled: true,
                  fillColor: Colors.white,
                  contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                ),
              ),
              const SizedBox(height: 10),
              const Text("Зураг нэмэх (заавал биш):"),
              const SizedBox(height: 8),
              _webImageBytes != null
                  ? Column(
                      children: [
                        Image.memory(
                          _webImageBytes!,
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 170,
                          fit: BoxFit.cover,
                        ),
                        IconButton(
                          onPressed: () => setState(() => _webImageBytes = null),
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    )
                  : ElevatedButton.icon(
                      onPressed: _pickImage,
                      icon: const Icon(Icons.image),
                      label: const Text("Зураг сонгоно уу"),
                    ),
              const SizedBox(height: 10),
              ...List.generate(5, (index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 5),
                  child: Row(
                    children: [
                      Expanded(
                        child: TextField(
                          controller: answerControllers[index],
                          keyboardType: TextInputType.multiline,
                          maxLines: null,
                          decoration: InputDecoration(
                            labelText: "Хариулт ${index + 1}",
                            labelStyle: TextStyle(color: Colors.blue),
                            border: OutlineInputBorder(),
                            filled: true,
                            fillColor: Colors.white,
                            contentPadding: EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                          ),
                        ),
                      ),
                      Checkbox(
                        value: answerCheckBoxes[index],
                        onChanged: (bool? value) {
                          setState(() {
                            if (answerControllers[index].text.trim().isNotEmpty) {
                              for (int i = 0; i < answerCheckBoxes.length; i++) {
                                answerCheckBoxes[i] = false;
                              }
                              answerCheckBoxes[index] = value!;
                              _correctAnswer = value ? index : null;
                            }
                          });
                        },
                      ),
                    ],
                  ),
                );
              }),
              const SizedBox(height: 15),
              ElevatedButton(
                onPressed: _isSaving ? null : saveQuestionToFirebase,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  side: BorderSide(color: Colors.white, width: 1),
                ),
                child: _isSaving
                    ? const CircularProgressIndicator()
                    : const Text("Хадгалах", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 15)),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    questionController.dispose();
    for (final controller in answerControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
