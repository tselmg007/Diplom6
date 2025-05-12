import 'dart:math';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class QuizProvider with ChangeNotifier {
  List<Map<String, dynamic>> _questions = [];
  List<Map<String, dynamic>> get questions => _questions;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  Future<void> loadQuestions() async {
    _isLoading = true;
    notifyListeners();

    try {
      List<QuerySnapshot> snapshots = await Future.wait([
        FirebaseFirestore.instance.collection('SmartTrafficInputOneCollection').limit(8).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputTwoCollection').limit(8).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputThreeCollection').limit(8).get(),
                FirebaseFirestore.instance.collection('SmartTrafficInputFourCollection').limit(8).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputFiveCollection').limit(8).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputSixCollection').limit(8).get(),
                FirebaseFirestore.instance.collection('SmartTrafficInputSevenCollection').limit(8).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputEightCollection').limit(8).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputNineCollection').limit(8).get(),
                FirebaseFirestore.instance.collection('SmartTrafficInputTenCollection').limit(8).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputElevenCollection').limit(8).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputTwelveCollection').limit(8).get(),
                FirebaseFirestore.instance.collection('SmartTrafficInputThirteenCollection').limit(8).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputFourteenCollection').limit(8).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputFifteenCollection').limit(8).get(),
                FirebaseFirestore.instance.collection('SmartTrafficInputSixteenCollection').limit(8).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputSeventeenCollection').limit(8).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputEighteenCollection').limit(8).get(),
                FirebaseFirestore.instance.collection('SmartTrafficInputNineteenCollection').limit(8).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputTwentyCollection').limit(8).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputTwentyOneCollection').limit(8).get(),
                FirebaseFirestore.instance.collection('SmartTrafficInputTwentyTwoCollection').limit(8).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputTwentyThreeCollection').limit(8).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputTwentyFourCollection').limit(8).get(),
      ]);

      List<Map<String, dynamic>> allQuestions = [];
      for (var snapshot in snapshots) {
        allQuestions.addAll(snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>));
      }

      allQuestions.shuffle(Random());
      _questions = allQuestions.take(20).toList();
    } catch (e) {
      debugPrint("Error loading questions: $e");
    }

    _isLoading = false;
    notifyListeners();
  }
}
