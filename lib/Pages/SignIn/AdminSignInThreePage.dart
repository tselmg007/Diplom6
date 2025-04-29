import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:traffic/Pages/AdminQuestionInput/AdminQuizInputThreePage.dart';  

class AdminSignInThreePage extends StatefulWidget {
  @override
  _SignInPage2State createState() => _SignInPage2State();
}

class _SignInPage2State extends State<AdminSignInThreePage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool _obscureText = true;
  bool _isLoading = false;  // Track loading state

  // Sign-in method
  Future<void> signInWithEmailPassword(String email, String password) async {
    try {
      setState(() {
        _isLoading = true;  // Show loading indicator
      });

      // Attempt to sign in using Firebase Authentication
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      print("User signed in: ${userCredential.user?.email}");

      // Navigate to HomePage (AdminQuizInputOnePage)
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => AdminQuizInputThreePage()),
      );
    } catch (e) {
      print("Error signing in: $e");
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Бүртгэлгүй хэрэглэгч байна.")),
      );
    } finally {
      setState(() {
        _isLoading = false;  // Hide loading indicator after process is finished
      });
    }
  }

  // Validate email format
  String? validateEmail(String email) {
    if (!email.contains('@') || !email.contains('.')) {
      return 'Имэйл зөв оруулна уу. (Жишээ: example@gmail.com)';
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white60,  // App bar background color
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            border: Border.all(color: Colors.black, width: 2), // Border around the whole container
          ),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // GitHub-like Logo or Icon
                Icon(
                  Icons.account_circle, // Example of an icon, you can replace with an actual image if needed
                  size: 100,
                  color: Colors.black,
                ),
                SizedBox(height: 40),

                // Email input field with rounded corners and padding
                TextField(
                  controller: emailController,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    labelStyle: TextStyle(color: Colors.black38),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.black),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    errorText: validateEmail(emailController.text), // Show error if invalid email
                  ),
                ),
                SizedBox(height: 13),

                // Password input field with toggle visibility button
                TextField(
                  controller: passwordController,
                  obscureText: _obscureText,
                  decoration: InputDecoration(
                    labelText: 'Password',
                    labelStyle: TextStyle(color: Colors.grey),
                    filled: true,
                    fillColor: Colors.grey[200],
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.red),
                      borderRadius: BorderRadius.circular(12),
                    ),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureText ? Icons.visibility_off : Icons.visibility,
                        color: Colors.black,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureText = !_obscureText;
                        });
                      },
                    ),
                  ),
                ),
                SizedBox(height: 30),

                // Sign In Button with styling and loading state
                _isLoading
                    ? CircularProgressIndicator()  // Show a loading spinner while signing in
                    : ElevatedButton(
                        onPressed: () async {
                          String email = emailController.text.trim();
                          String password = passwordController.text.trim();

                          // Validate email and password
                          if (email.isNotEmpty && password.isNotEmpty) {
                            await signInWithEmailPassword(email, password);
                          } else {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(content: Text("Имэйл болон нууц үгээ оруулна уу.")),
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.black,  // Button color
                          padding: EdgeInsets.symmetric(horizontal: 60, vertical: 15),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Text("Sign In", style: TextStyle(fontSize: 18, color: Colors.white)),
                      ),
                SizedBox(height: 13),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
