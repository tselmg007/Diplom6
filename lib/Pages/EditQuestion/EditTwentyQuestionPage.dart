import 'dart:typed_data';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class EditTwentyQuestionPage extends StatefulWidget {
  final String questionId;
  final Map<String, dynamic> questionData;

  EditTwentyQuestionPage({
    required this.questionId,
    required this.questionData,
  });

  @override
  _EditOneQuestionPageState createState() => _EditOneQuestionPageState();
}

class _EditOneQuestionPageState extends State<EditTwentyQuestionPage> {
  final TextEditingController questionController = TextEditingController();
  final List<TextEditingController> answerControllers =
      List.generate(5, (_) => TextEditingController());
  final List<bool> answerCheckBoxes = List.generate(5, (_) => false);
  int correctIndex = -1;
  bool _isLoading = false;

  String? imageUrl;
  Uint8List? _newImageBytes;

  @override
  void initState() {
    super.initState();
    questionController.text = widget.questionData['Question'] ?? '';
    for (int i = 0; i < 5; i++) {
      answerControllers[i].text = widget.questionData['Answer${i + 1}'] ?? '';
    }
    imageUrl = widget.questionData['Image'] ?? null;

    final correctAnswerText = widget.questionData['CorrectAnswer'] ?? '';
    correctIndex = answerControllers.indexWhere(
      (controller) => controller.text.trim() == correctAnswerText,
    );

    if (correctIndex != -1) {
      answerCheckBoxes[correctIndex] = true;
    }
  }

  Future<void> _pickImage() async {
    try {
      final picker = ImagePicker();
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final bytes = await pickedFile.readAsBytes();
        setState(() {
          _newImageBytes = bytes;
          imageUrl = null;
        });
      }
    } catch (e) {
      debugPrint("📷 Зураг сонгох үед алдаа: $e");
    }
  }

  Future<String?> _uploadImage(Uint8List imageBytes, String questionId) async {
    try {
      final fileName = 'quiz20_$questionId.png';
      final ref = FirebaseStorage.instance.ref().child('quiz20_images/$fileName');
      final uploadTask = ref.putData(imageBytes);
      final snapshot = await uploadTask.whenComplete(() {});
      return await snapshot.ref.getDownloadURL();
    } catch (e) {
      debugPrint("🖼️ Зураг байршуулах алдаа: $e");
      return null;
    }
  }

  Future<void> updateQuestion() async {
    if (_isLoading) return;

    setState(() => _isLoading = true);

    try {
      final question = questionController.text.trim();
      final answers = answerControllers.map((c) => c.text.trim()).toList();
      final correctAnswer = (correctIndex != -1) ? answers[correctIndex] : "";

      if (question.isEmpty) throw "📝 Асуулт хоосон байж болохгүй!";
      if (answers.length < 2) throw "🔢 Дор хаяж 2 хариулт өгнө үү!";
      if (correctIndex == -1) throw "✅ Зөв хариулт сонгогдоогүй байна!";

      String? finalImageUrl = imageUrl;
      if (_newImageBytes != null) {
        final uploadedUrl = await _uploadImage(_newImageBytes!, widget.questionId);
        if (uploadedUrl != null) finalImageUrl = uploadedUrl;
      }

      final updatedData = {
        'Question': question,
        'Answer1': answers[0],
        'Answer2': answers[1],
        'Answer3': answers[2],
        'Answer4': answers[3],
        'Answer5': answers[4],
        'CorrectAnswer': correctAnswer,
        'Image': finalImageUrl ?? "",
        'CreatedAt': FieldValue.serverTimestamp(),
      };

      await FirebaseFirestore.instance
          .collection('SmartTrafficInputTwentyCollection')
          .doc(widget.questionId)
          .update(updatedData);

       ScaffoldMessenger.of(context).showSnackBar(
  SnackBar(
    content: Text(
      "✅ Асуулт амжилттай шинэчлэгдлээ! 🎉",
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

      Navigator.pop(context);
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("❌ Алдаа гарлаа: ${e.toString()} 😓")),
      );
    } finally {
      setState(() => _isLoading = false);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Асуулт засах"),
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
              _newImageBytes != null
                  ? Column(
                      children: [
                        Image.memory(
                          _newImageBytes!,
                          width: MediaQuery.of(context).size.width * 0.8,
                          height: 170,
                          fit: BoxFit.cover,
                        ),
                        IconButton(
                          onPressed: () => setState(() => _newImageBytes = null),
                          icon: Icon(Icons.delete, color: Colors.red),
                        ),
                      ],
                    )
                  : imageUrl != null && imageUrl!.isNotEmpty
                      ? Column(
                          children: [
                            Image.network(
                              imageUrl!,
                              width: MediaQuery.of(context).size.width * 0.8,
                              height: 170,
                              fit: BoxFit.cover,
                            ),
                            IconButton(
                              onPressed: () => setState(() => imageUrl = null),
                              icon: Icon(Icons.delete, color: Colors.red),
                            ),
                          ],
                        )
                      : ElevatedButton.icon(
                          onPressed: _pickImage,
                          icon: Icon(Icons.image),
                          label: Text("Зураг сонгох"),
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
                              for (int i = 0; i < 5; i++) {
                                answerCheckBoxes[i] = false;
                              }
                              answerCheckBoxes[index] = value!;
                              correctIndex = value ? index : -1;
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
                onPressed: _isLoading ? null : updateQuestion,
                style: ElevatedButton.styleFrom(
                  minimumSize: Size(double.infinity, 50),
                  backgroundColor: Colors.white,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  side: BorderSide(color: Colors.white, width: 1),
                ),
                child: _isLoading
                    ? const CircularProgressIndicator()
                    : const Text("Шинэчлэх", style: TextStyle(fontWeight: FontWeight.bold, color: Colors.blue, fontSize: 15)),
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
    for (var controller in answerControllers) {
      controller.dispose();
    }
    super.dispose();
  }
}
