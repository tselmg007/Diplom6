import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
import 'package:traffic/Pages/SignUpAndLogin/SignupPage.dart';
import 'package:traffic/Pages/BottomNavigationBarChange.dart';
import 'package:traffic/Pages/ReminderSheetPage.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  bool isLoading = false;
  bool _obscurePassword = true;
  bool rememberMe = false;

  @override
  void initState() {
    super.initState();
    _loadUserCredentials();
  }

  // Load saved user credentials if 'Remember Me' was checked previously
  _loadUserCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    setState(() {
      rememberMe = prefs.getBool('rememberMe') ?? false;
      if (rememberMe) {
        emailController.text = prefs.getString('email') ?? '';
        passwordController.text = prefs.getString('password') ?? '';
      }
    });
  }

  // Save user credentials if 'Remember Me' is checked
  _saveUserCredentials() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool('rememberMe', rememberMe);
    if (rememberMe) {
      prefs.setString('email', emailController.text);
      prefs.setString('password', passwordController.text);
    }
  }

  // Login function
  Future<void> loginUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    try {
      final email = emailController.text.trim();  // Get email input
      final password = passwordController.text.trim();  // Get password input

      final auth = FirebaseAuth.instance;
      try {
        // Try logging in with FirebaseAuth first
        UserCredential userCredential = await auth.signInWithEmailAndPassword(
          email: email,
          password: password,
        );

        // If login is successful, save credentials and move to the next page
        _saveUserCredentials();

        // Save user data to Firestore (if necessary)
        await FirebaseFirestore.instance.collection("UserList").doc(userCredential.user!.uid).set({
          "Email": email,
          "Password": password,
       }, SetOptions(merge: true));

        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Амжилттай нэвтэрлээ!")),
        );

        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) =>  ReminderSheetPage()),
        );
     } on FirebaseAuthException catch (e) {
  if (e.code == 'user-not-found' || e.code == 'wrong-password') {
    await _checkUserInFirestore(email, password);
  } else if (e.code == 'invalid-credential' || e.code == 'invalid-login-credentials') {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text("Нууц үг шинэчлэгдсэн байж болзошгүй. Шинэ нууц үгээ шалгана уу?"),
      ),
    );
  } else {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text("Нэвтрэхэд алдаа гарлаа: ${e.message}")),
    );
  }
}
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Нэвтрэхэд алдаа гарлаа: ${e.toString()}")),
      );
    } finally {
      setState(() => isLoading = false);
    }
  }

  // Check user credentials from Firestore if FirebaseAuth fails
  Future<void> _checkUserInFirestore(String email, String password) async {
    try {
      // Search for user in Firestore UserList collection
      final snapshot = await FirebaseFirestore.instance
          .collection('UserList')
          .where('Email', isEqualTo: email)
          .get();

      if (snapshot.docs.isEmpty) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Энэ имэйл хаяг бүртгэгдээгүй байна!")),
        );
        return;
      }

      // Get the user document
      final userDoc = snapshot.docs.first;
      final storedPassword = userDoc["Password"];

      // Check if the password matches
      if (storedPassword == password) {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Амжилттай нэвтэрлээ!")),
        );
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const BottomNavigationBarChange()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Нууц үг буруу байна!")),
        );
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Нэвтрэхэд алдаа гарлаа: ${e.toString()}")),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Container(
          width: 350,
          padding: const EdgeInsets.all(24),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(32),
            gradient: const LinearGradient(
              colors: [Colors.green, Colors.blueAccent],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
            boxShadow: [
              BoxShadow(
                color: Colors.black.withOpacity(0.15),
                blurRadius: 20,
              )
            ],
          ),
          child: Form(
            key: _formKey,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white24,
                child: Icon(Icons.person, size: 40, color: Colors.white),
              ),
              const SizedBox(height: 20),

              // Email input
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white),
                decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.email, color: Colors.white),
                  labelText: 'Email',
                  labelStyle: TextStyle(color: Colors.white70),
                  enabledBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white38)),
                  focusedBorder: UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty || !value.contains('@')) {
                    return 'Энгийн имэйл хаяг оруулна уу';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Password field
              TextFormField(
                controller: passwordController,
                obscureText: _obscurePassword,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.lock, color: Colors.white),
                  labelText: 'Password',
                  labelStyle: const TextStyle(color: Colors.white70),
                  enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white38)),
                  focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscurePassword ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    ),
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                  ),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Enter your password';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 10),

              // Remember Me Checkbox
              Row(
                children: [
                  Checkbox(
                    value: rememberMe,
                    onChanged: (value) {
                      setState(() {
                        rememberMe = value!;
                      });
                    },
                  ),
                  const Text("Remember Me", style: TextStyle(color: Colors.white)),
                ],
              ),

              const SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: isLoading ? null : loginUser,
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text("LOGIN", style: TextStyle(color: Colors.deepPurple)),
              ),

              const SizedBox(height: 15),
              TextButton(
                onPressed: () {
                  // Navigate to the SignUpPage
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const SignupPage()),
                  );
                },
                child: const Text(
                  "Don't have an account? Sign Up",
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w500),
                ),
              ),
            ]), 
          ),
        ),
      ),
    );
  }
}
