import 'dart:io';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'EditProfilePage.dart';

class ProfilePage extends StatefulWidget {
  @override
  _ProfilePageState createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  File? _imageFile;
  final picker = ImagePicker();
  final currentUser = FirebaseAuth.instance.currentUser;

  String? username;
  String? email;
  String? password;

  Future<void> _loadUserInfo() async {
    if (currentUser == null) return;

    final doc = await FirebaseFirestore.instance
        .collection('UserList')
        .doc(currentUser!.uid)
        .get();
    if (doc.exists) {
      final data = doc.data()!;
      setState(() {
        username = data['Username'] ?? '';
        email = data['Email'] ?? '';
        password = data['Password'] ?? '';
      });
    }
  }

  Future<void> _pickImage() async {
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() => _imageFile = File(pickedFile.path));
    }
  }

  @override
  void initState() {
    super.initState();
    _loadUserInfo();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      appBar: AppBar(
        title: const Text('Хувийн мэдээлэл', style: TextStyle(fontSize: 16)),
        centerTitle: true,
                backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
        elevation: 1,
      ),
      body: Center(
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(24),
            boxShadow: [
              BoxShadow(
                  color: Colors.black12, blurRadius: 8, offset: Offset(0, 4)),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Stack(
                alignment: Alignment.bottomRight,
                children: [
                  CircleAvatar(
                    radius: 60,
                    backgroundImage: _imageFile != null
                        ? FileImage(_imageFile!)
                        : const AssetImage('assets/default_profile.png')
                            as ImageProvider,
                    backgroundColor: Colors.grey.shade200,
                  ),
                  Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.blueAccent,
                      border: Border.all(color: Colors.white, width: 2),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black26,
                          blurRadius: 4,
                          offset: Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.edit,
                          color: Colors.white, size: 20),
                      onPressed: _pickImage,
                      padding: const EdgeInsets.all(4),
                      constraints: const BoxConstraints(),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Text(
                username ?? '...',
                style: const TextStyle(
                    fontSize: 18, fontWeight: FontWeight.w600),
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.person, size: 14, color: Colors.black54),
                      SizedBox(width: 6),
                      Text(
                        "Хувийн мэдээлэл",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  TextButton.icon(
                    onPressed: () async {
                      if (username != null &&
                          email != null &&
                          password != null) {
                        final result = await Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => EditProfilePage(
                              username: username!,
                              email: email!,
                              password: password!,
                            ),
                          ),
                        );
                        if (result == true) {
                          _loadUserInfo(); // 🟢 Шинэчлэгдсэн мэдээллийг дахин унших
                        }
                      }
                    },
                    icon: const Icon(Icons.edit, size: 15),
                    label: const Text("Засах"),
                    style: TextButton.styleFrom(
                      foregroundColor: Colors.blueAccent,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.email, size: 14, color: Colors.black54),
                      SizedBox(width: 6),
                      Text(
                        "Цахим хаяг",
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    email ?? '',
                    style: const TextStyle(
                        color: Colors.black54, fontSize: 14),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: const [
                      Icon(Icons.lock, size: 14, color: Colors.black54),
                      SizedBox(width: 6),
                      Text(
                        "Нууц үг",
                        
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    password != null ? '*' * password!.length : '',
                    style: const TextStyle(
                        color: Colors.black54, fontSize: 14),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
