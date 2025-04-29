import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:traffic/Pages/SignUpAndLogin/LoginPage.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  _SignupPageState createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();

  bool isLoading = false;
  bool _obscurePassword = true;

  // Function to register the user using email and password
  Future<void> registerUser() async {
    if (!_formKey.currentState!.validate()) return;

    setState(() => isLoading = true);

    try {
      final email = emailController.text.trim(); // Get email input
      final password = passwordController.text.trim(); // Get password input

      final auth = FirebaseAuth.instance;
      
      try {
        // Attempt to create a new user using the email and password
        UserCredential userCredential = await auth.createUserWithEmailAndPassword(
            email: email, password: password);

        // Save additional user data (like phone number) in Firestore if needed
        await FirebaseFirestore.instance.collection("UserList").doc(userCredential.user!.uid).set({
          "Email": email,
          "Password": password,
        });

        // Show success message
        ScaffoldMessenger.of(context).showSnackBar(
          const SnackBar(content: Text("Амжилттай бүртгэгдлээ!")),

        );

        // Clear text fields
        emailController.clear();
        passwordController.clear();

        // Navigate to LoginPage after registration
        Future.delayed(const Duration(seconds: 1), () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => const LoginPage()),
          );
        });
      } on FirebaseAuthException catch (e) {
        if (e.code == 'email-already-in-use') {
          // Handle the specific error for email already in use
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text("Энэ имэйл хаяг аль хэдийн бүртгэгдсэн байна!")),

          );
        } else {
          // General Firebase authentication error handling
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Алдаа: ${e.message}")));
        }
      }
    } catch (e) {
      // Catch any other errors
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Алдаа: ${e.toString()}")));
    } finally {
      setState(() => isLoading = false);
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
              colors: [Colors.green, Colors.blue],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Form(
            key: _formKey,
            child: Column(mainAxisSize: MainAxisSize.min, children: [
              const CircleAvatar(
                radius: 40,
                backgroundColor: Colors.white24,
                child: Icon(Icons.person_add, size: 40, color: Colors.white),
              ),
              const SizedBox(height: 20),
              // Email input
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.emailAddress,
                style: const TextStyle(color: Colors.white),
                decoration: InputDecoration(
                  prefixIcon: const Icon(Icons.email, color: Colors.white),
                  labelText: 'Email',
                  labelStyle: const TextStyle(color: Colors.white70),
                  enabledBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white38)),
                  focusedBorder: const UnderlineInputBorder(borderSide: BorderSide(color: Colors.white)),
                ),
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Энгийн имэйл хаяг оруулна уу';
                  }
                  // Check if the email format is correct
                  String pattern = r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,4}$';
                  RegExp regExp = RegExp(pattern);
                  if (!regExp.hasMatch(value)) {
                    return 'Энэ бол зөв имэйл хаяг биш';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 20),

              // Password input with visibility toggle
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
                  if (value == null || value.length < 6) {
                    return 'Нууц үг дор хаяж 6 тэмдэгттэй байх ёстой';
                  }
                  final regex = RegExp(r'^(?=.*[A-Z])(?=.*[a-z])(?=.*\d)(?=.*[@$!%*?&])[A-Za-z\d@$!%*?&]{6,}$');
                  if (!regex.hasMatch(value)) {
                    return 'Нууц үгэнд 1 том, 1 жижиг үсэг, 1 тоо, 1 тусгай тэмдэгт орсон байх ёстой';
                  }
                  return null;
                },
              ),

              const SizedBox(height: 30),

              // Sign up button
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.white,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: isLoading ? null : registerUser,
                child: isLoading
                    ? const CircularProgressIndicator()
                    : const Text("SIGN UP", style: TextStyle(color: Colors.deepPurple)),
              ),

              const SizedBox(height: 20),

              // Login button to go back to login page
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.deepPurple,
                  minimumSize: const Size.fromHeight(50),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginPage()),
                  );
                },
                child: const Text("Already have an account? Login", style: TextStyle(color: Colors.white)),
              ),
            ]), 
          ),
        ),
      ),
    );
  }
}
