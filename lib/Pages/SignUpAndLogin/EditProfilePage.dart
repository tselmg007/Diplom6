import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class EditProfilePage extends StatefulWidget {
  final String username;
  final String email;
  final String password;

  const EditProfilePage({
    Key? key,
    required this.username,
    required this.email,
    required this.password,
  }) : super(key: key);

  @override
  _EditProfilePageState createState() => _EditProfilePageState();
}

class _EditProfilePageState extends State<EditProfilePage> {
  final _formKey = GlobalKey<FormState>();
  late String _username;
  late String _email;
  late String _password;
  bool _isLoading = false;
  bool _showPassword = false;

  final currentUser = FirebaseAuth.instance.currentUser;

  @override
  void initState() {
    super.initState();
    _username = widget.username;
    _email = widget.email;
    _password = widget.password;
  }

  Future<void> _saveProfile() async {
  if (!_formKey.currentState!.validate()) return;

  _formKey.currentState!.save();
  setState(() => _isLoading = true);

  try {
    // FirebaseAuth нууц үг шинэчлэх
    if (_password != widget.password) {
      await currentUser!.updatePassword(_password);
    }

    // Firestore дээр шинэчлэх
    await FirebaseFirestore.instance
        .collection('UserList')
        .doc(currentUser!.uid)
        .update({
      'Username': _username,
      'Password': _password, // Хэдий Firebase дээр нууц үг хадгалах шаардлагагүй ч, хадгалах бол энэ мөрийг орхи
    });

    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Амжилттай хадгалагдлаа')),
    );
    Navigator.pop(context, true);
  } on FirebaseAuthException catch (e) {
    String error = 'Нууц үг шинэчлэхэд алдаа гарлаа';
    if (e.code == 'requires-recent-login') {
      error = 'Нууц үг шинэчлэхийн тулд дахин нэвтрэх шаардлагатай байна.';
    }
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(error)),
    );
  } catch (e) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text('Алдаа гарлаа: ${e.toString()}')),
    );
  } finally {
    setState(() => _isLoading = false);
  }
}


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Мэдээлэл засварлах', style: TextStyle(fontSize: 16)),
        centerTitle: true,
        backgroundColor: Colors.blue.shade900,
        foregroundColor: Colors.white,
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: Form(
              key: _formKey,
              child: Column(
                children: [
                  const SizedBox(height: 10),
                  TextFormField(
                    initialValue: _username,
                    decoration: _inputStyleWithAsterisk('Нэр', Icons.person),
                    validator: (value) =>
                        value!.isEmpty ? 'Нэр оруулна уу' : null,
                    onSaved: (value) => _username = value!,
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: _email,
                    readOnly: true,
                    decoration: _inputStyleWithAsterisk('Цахим хаяг', Icons.email),
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    initialValue: _password,
                    obscureText: !_showPassword,
                    decoration: _inputStyleWithAsterisk(
                      'Нууц үг',
                      Icons.lock,
                      suffixIcon: IconButton(
                        icon: Icon(
                          _showPassword ? Icons.visibility : Icons.visibility_off,
                        ),
                        onPressed: () {
                          setState(() {
                            _showPassword = !_showPassword;
                          });
                        },
                      ),
                    ),
                    onSaved: (value) => _password = value!,
                  ),
                  const Spacer(),
                  Row(
                    children: [
                      Expanded(
                        child: OutlinedButton(
                          onPressed: () => Navigator.pop(context),
                          child: const Text('Буцах'),
                        ),
                      ),
                      const SizedBox(width: 10),
                      Expanded(
                        child: ElevatedButton(
                          onPressed: _isLoading ? null : _saveProfile,
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blue.shade800,
                          ),
                          child: const Text('Хадгалах', style: TextStyle(color: Colors.black)),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          if (_isLoading)
            Container(
              color: Colors.black.withOpacity(0.3),
              child: const Center(
                child: CircularProgressIndicator(),
              ),
            ),
        ],
      ),
    );
  }

  InputDecoration _inputStyleWithAsterisk(String label, IconData icon, {Widget? suffixIcon}) {
    return InputDecoration(
      label: RichText(
        text: TextSpan(
          text: '$label ',
          style: TextStyle(color: Colors.grey[700], fontSize: 16),
          children: const [
            TextSpan(
              text: '*',
              style: TextStyle(color: Colors.red),
            ),
          ],
        ),
      ),
      prefixIcon: Icon(icon),
      suffixIcon: suffixIcon,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    );
  }
}
