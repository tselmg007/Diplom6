import 'package:flutter/material.dart';
import 'package:traffic/Pages/UserTakeExam.dart';
import 'dart:ui';

class StartExamPage extends StatelessWidget {
  const StartExamPage({Key? key}) : super(key: key);

  void _startExam(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const UserTakeExam()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            colors: [Color.fromARGB(255, 86, 180, 221), Colors.white, Colors.white],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
        ),
        child: Center(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(25),
            child: BackdropFilter(
              filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
              child: ElevatedButton(
                onPressed: () => _startExam(context),
                style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromARGB(255, 118, 76, 196).withOpacity(0.2),
                  padding: const EdgeInsets.symmetric(horizontal: 32, vertical: 10),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25),
                  ),
                  elevation: 12,
                  shadowColor: Colors.black.withOpacity(0.3),
                ),
                child: const Text(
                  '🚦 Шалгалт эхлүүлэх',
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w700,
                    color: Colors.white,
                    letterSpacing: 1.5,
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
