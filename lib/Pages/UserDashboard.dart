import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageOne.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({Key? key}) : super(key: key);

  @override
  State<UserDashboard> createState() => _UserDashboard();
}

class _UserDashboard extends State<UserDashboard> {
  int totalQuestions = 0;
  int correctAnswers = 0;
  int wrongAnswers = 0;
  int secondTotalQuestions = 0;
  int secondCorrectAnswers = 0;
  int secondWrongAnswers = 0;
  int threeTotalQuestions = 0;
  int threeCorrectAnswers = 0;
  int threeWrongAnswers = 0;
  int fourTotalQuestions = 0;
  int fourCorrectAnswers = 0;
  int fourWrongAnswers = 0;
  int fiveTotalQuestions = 0;
  int fiveCorrectAnswers = 0;
  int fiveWrongAnswers = 0;
  int sixTotalQuestions = 0;
  int sixCorrectAnswers = 0;
  int sixWrongAnswers = 0;
  int sevenTotalQuestions = 0;
  int sevenCorrectAnswers = 0;
  int sevenWrongAnswers = 0;
  int eightTotalQuestions = 0;
  int eightCorrectAnswers = 0;
  int eightWrongAnswers = 0;
  int nineTotalQuestions = 0;
  int nineCorrectAnswers = 0;
  int nineWrongAnswers = 0;
  int tenTotalQuestions = 0;
  int tenCorrectAnswers = 0;
  int tenWrongAnswers = 0;
  int elevenTotalQuestions = 0;
  int elevenCorrectAnswers = 0;
  int elevenWrongAnswers = 0;
  int twelveTotalQuestions = 0;
  int twelveCorrectAnswers = 0;
  int twelveWrongAnswers = 0;
  int thirteenTotalQuestions = 0;
  int thirteenCorrectAnswers = 0;
  int thirteenWrongAnswers = 0;
  int fourteenTotalQuestions = 0;
  int fourteenCorrectAnswers = 0;
  int fourteenWrongAnswers = 0;
  int fifteenTotalQuestions = 0;
  int fifteenCorrectAnswers = 0;
  int fifteenWrongAnswers = 0;
  int sixteenTotalQuestions = 0;
  int sixteenCorrectAnswers = 0;
  int sixteenWrongAnswers = 0;
  int seventeenTotalQuestions = 0;
  int seventeenCorrectAnswers = 0;
  int seventeenWrongAnswers = 0;
  int eighteenTotalQuestions = 0;
  int eighteenCorrectAnswers = 0;
  int eighteenWrongAnswers = 0;
  int nineteenTotalQuestions = 0;
  int nineteenCorrectAnswers = 0;
  int nineteenWrongAnswers = 0;
  int twentyTotalQuestions = 0;
  int twentyCorrectAnswers = 0;
  int twentyWrongAnswers = 0;
  int twentyoneTotalQuestions = 0;
  int twentyoneCorrectAnswers = 0;
  int twentyoneWrongAnswers = 0;
  int twentytwoTotalQuestions = 0;
  int twentytwoCorrectAnswers = 0;
  int twentytwoWrongAnswers = 0;
  int twentythreeTotalQuestions = 0;
  int twentythreeCorrectAnswers = 0;
  int twentythreeWrongAnswers = 0;
  int twentyfourTotalQuestions = 0;
  int twentyfourCorrectAnswers = 0;
  int twentyfourWrongAnswers = 0;
  double passingScore = 80.0;
  bool isTestMode = false;
  List<Map<String, dynamic>> testResults = [];
  bool isLoading = false;  // Loading state for managing the UI
  String message = '';  // Message to show if the user has taken the exam

  @override
  void initState() {
    super.initState();
    fetchStatistics();
  }

  // Fetch statistics from Firestore
  Future<void> fetchStatistics() async {  
  try {
    final snapshot1 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputOneCollection')
        .get();
    final totalQuestionsOne = snapshot1.docs.length;

    final snapshot2 = await FirebaseFirestore.instance
        .collection('WrongAnswerTestCollection')
        .get();
    final wrongAnswersOne = snapshot2.docs.length;

    final snapshot3 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputTwoCollection')
        .get();
    final totalQuestionsTwo = snapshot3.docs.length;

    final snapshot4 = await FirebaseFirestore.instance
        .collection('WrongAnswerTestTwoCollection')
        .get();
    final wrongAnswersTwo = snapshot4.docs.length;

    final snapshot5 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputThreeCollection')
        .get();
    final totalQuestionsThree = snapshot5.docs.length;

    final snapshot6 = await FirebaseFirestore.instance
        .collection('WrongAnswerTestThreeCollection')
        .get();
    final wrongAnswersThree = snapshot6.docs.length;

    final snapshot7 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputFourCollection')
        .get();
    final totalQuestionsFour = snapshot7.docs.length;

    final snapshot8 = await FirebaseFirestore.instance
        .collection('WrongAnswerTestFourCollection')
        .get();
    final wrongAnswersFour = snapshot8.docs.length;

     final snapshot9 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputFiveCollection')
        .get();
    final totalQuestionsFive = snapshot9.docs.length;

    final snapshot10 = await FirebaseFirestore.instance
        .collection('WrongAnswerTestFiveCollection')
        .get();
    final wrongAnswersFive = snapshot10.docs.length;

     final snapshot11 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputSixCollection')
        .get();
    final totalQuestionsSix = snapshot11.docs.length;

    final snapshot12 = await FirebaseFirestore.instance
        .collection('WrongAnswerTestSixCollection')
        .get();
    final wrongAnswersSix = snapshot12.docs.length;

     final snapshot13 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputSevenCollection')
        .get();
    final totalQuestionsSeven = snapshot13.docs.length;

    final snapshot14 = await FirebaseFirestore.instance
        .collection('WrongAnswerTestSevenCollection')
        .get();
    final wrongAnswersSeven = snapshot14.docs.length;

     final snapshot15 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputEightCollection')
        .get();
    final totalQuestionsEight = snapshot15.docs.length;

    final snapshot16 = await FirebaseFirestore.instance
        .collection('WrongAnswerTestEightCollection')
        .get();
    final wrongAnswersEight = snapshot16.docs.length;

    final snapshot17 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputNineCollection')
        .get();
    final totalQuestionsNine = snapshot17.docs.length;

    final snapshot18 = await FirebaseFirestore.instance
        .collection('WrongAnswerTestNineCollection')
        .get();
    final wrongAnswersNine = snapshot18.docs.length;

    final snapshot19 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputTenCollection')
        .get();
    final totalQuestionsTen = snapshot19.docs.length;

    final snapshot20 = await FirebaseFirestore.instance
        .collection('WrongAnswerTestTenCollection')
        .get();
    final wrongAnswersTen = snapshot20.docs.length;

    final snapshot21 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputElevenCollection')
        .get();
    final totalQuestionsEleven = snapshot21.docs.length;

    final snapshot22 = await FirebaseFirestore.instance
        .collection('WrongAnswerTestElevenCollection')
        .get();
    final wrongAnswersEleven = snapshot22.docs.length;

    final snapshot23 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputTwelveCollection')
        .get();
    final totalQuestionsTwelve = snapshot23.docs.length;

    final snapshot24 = await FirebaseFirestore.instance
        .collection('WrongAnswerTestTwelveCollection')
        .get();
    final wrongAnswersTwelve = snapshot24.docs.length;

    final snapshot25 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputThirteenCollection')
        .get();
    final totalQuestionsThirteen = snapshot25.docs.length;

    final snapshot26 = await FirebaseFirestore.instance
        .collection('WrongAnswerTestThirteenCollection')
        .get();
    final wrongAnswersThirteen = snapshot26.docs.length;

    final snapshot27 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputFourteenCollection')
        .get();
    final totalQuestionsFourteen = snapshot27.docs.length;

    final snapshot28 = await FirebaseFirestore.instance
        .collection('WrongAnswerTestFourteenCollection')
        .get();
    final wrongAnswersFourteen = snapshot28.docs.length;

    final snapshot29 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputFifteenCollection')
        .get();
    final totalQuestionsFifteen = snapshot29.docs.length;

    final snapshot30 = await FirebaseFirestore.instance
        .collection('WrongAnswerTestFifteenCollection')
        .get();
    final wrongAnswersFifteen = snapshot30.docs.length;

    final snapshot31 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputSixteenCollection')
        .get();
    final totalQuestionsSixteen = snapshot31.docs.length;

    final snapshot32 = await FirebaseFirestore.instance
        .collection('WrongAnswerTestSixteenCollection')
        .get();
    final wrongAnswersSixteen = snapshot32.docs.length;

    final snapshot33 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputSeventeenCollection')
        .get();
    final totalQuestionsSeventeen = snapshot33.docs.length;

    final snapshot34 = await FirebaseFirestore.instance
        .collection('WrongAnswerTestSeventeenCollection')
        .get();
    final wrongAnswersSeventeen = snapshot34.docs.length;

    final snapshot35 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputEighteenCollection')
        .get();
    final totalQuestionsEighteen = snapshot35.docs.length;

    final snapshot36 = await FirebaseFirestore.instance
        .collection('WrongAnswerTestEighteenCollection')
        .get();
    final wrongAnswersEighteen = snapshot36.docs.length;

    final snapshot37 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputNineteenCollection')
        .get();
    final totalQuestionsNineteen = snapshot37.docs.length;

    final snapshot38 = await FirebaseFirestore.instance
        .collection('WrongAnswerTestNineteenCollection')
        .get();
    final wrongAnswersNineteen = snapshot38.docs.length;

    final snapshot39 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputTwentyCollection')
        .get();
    final totalQuestionsTwenty = snapshot39.docs.length;

    final snapshot40 = await FirebaseFirestore.instance
        .collection('WrongAnswerTestTwentyCollection')
        .get();
    final wrongAnswersTwenty = snapshot40.docs.length;

    final snapshot41 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputTwentyOneCollection')
        .get();
    final totalQuestionsTwentyOne = snapshot41.docs.length;

    final snapshot42 = await FirebaseFirestore.instance
        .collection('WrongAnswerTestTwentyOneCollection')
        .get();
    final wrongAnswersTwentyOne = snapshot42.docs.length;

    final snapshot43 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputTwentyTwoCollection')
        .get();
    final totalQuestionsTwentyTwo = snapshot43.docs.length;

    final snapshot44 = await FirebaseFirestore.instance
        .collection('WrongAnswerTestTwentyTwoCollection')
        .get();
    final wrongAnswersTwentyTwo = snapshot44.docs.length;

    final snapshot45 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputTwentyThreeCollection')
        .get();
    final totalQuestionsTwentyThree = snapshot45.docs.length;

    final snapshot46 = await FirebaseFirestore.instance
        .collection('WrongAnswerTestTwentyThreeCollection')
        .get();
    final wrongAnswersTwentyThree = snapshot46.docs.length;

    final snapshot47 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputTwentyFourCollection')
        .get();
    final totalQuestionsTwentyFour = snapshot47.docs.length;

    final snapshot48 = await FirebaseFirestore.instance
        .collection('WrongAnswerTestTwentyFourCollection')
        .get();
    final wrongAnswersTwentyFour = snapshot48.docs.length;

    setState(() {
      totalQuestions = totalQuestionsOne; // For Нэр томьёо
      correctAnswers = totalQuestionsOne - wrongAnswersOne;
      wrongAnswers = wrongAnswersOne;

      secondTotalQuestions = totalQuestionsTwo;
      secondCorrectAnswers = totalQuestionsTwo - wrongAnswersTwo;
      secondWrongAnswers = wrongAnswersTwo;
      
      threeTotalQuestions = totalQuestionsThree;
      threeCorrectAnswers = totalQuestionsThree - wrongAnswersThree;
      threeWrongAnswers = wrongAnswersThree;

      fourTotalQuestions = totalQuestionsFour;
      fourCorrectAnswers = totalQuestionsFour - wrongAnswersFour;
      fourWrongAnswers = wrongAnswersFour;

      fiveTotalQuestions = totalQuestionsFive;
      fiveCorrectAnswers = totalQuestionsFive - wrongAnswersFive;
      fiveWrongAnswers = wrongAnswersFive;

      sixTotalQuestions = totalQuestionsSix;
      sixCorrectAnswers = totalQuestionsSix - wrongAnswersSix;
      sixWrongAnswers = wrongAnswersSix;

      sevenTotalQuestions = totalQuestionsSeven;
      sevenCorrectAnswers = totalQuestionsSeven - wrongAnswersSeven;
      sevenWrongAnswers = wrongAnswersSeven;

      eightTotalQuestions = totalQuestionsEight;
      eightCorrectAnswers = totalQuestionsEight - wrongAnswersEight;
      eightWrongAnswers = wrongAnswersEight;

      nineTotalQuestions = totalQuestionsNine;
      nineCorrectAnswers = totalQuestionsNine - wrongAnswersNine;
      nineWrongAnswers = wrongAnswersNine;

      tenTotalQuestions = totalQuestionsTen;
      tenCorrectAnswers = totalQuestionsTen - wrongAnswersTen;
      tenWrongAnswers = wrongAnswersTen;

      elevenTotalQuestions = totalQuestionsEleven;
      elevenCorrectAnswers = totalQuestionsEleven - wrongAnswersEleven;
      elevenWrongAnswers = wrongAnswersTwo;

      twelveTotalQuestions = totalQuestionsTwelve;
      twelveCorrectAnswers = totalQuestionsTwelve - wrongAnswersTwelve;
      twelveWrongAnswers = wrongAnswersTwelve;

      thirteenTotalQuestions = totalQuestionsThirteen;
      thirteenCorrectAnswers = totalQuestionsThirteen - wrongAnswersThirteen;
      thirteenWrongAnswers = wrongAnswersThirteen;

      fourteenTotalQuestions = totalQuestionsFourteen;
      fourteenCorrectAnswers = totalQuestionsFourteen - wrongAnswersFourteen;
      fourteenWrongAnswers = wrongAnswersFourteen;

      fifteenTotalQuestions = totalQuestionsFifteen;
      fifteenCorrectAnswers = totalQuestionsFifteen - wrongAnswersFifteen;
      fifteenWrongAnswers = wrongAnswersFifteen;

      sixteenTotalQuestions = totalQuestionsSixteen;
      sixteenCorrectAnswers = totalQuestionsSixteen - wrongAnswersSixteen;
      sixteenWrongAnswers = wrongAnswersSixteen;

      seventeenTotalQuestions = totalQuestionsSeventeen;
      seventeenCorrectAnswers = totalQuestionsSeventeen - wrongAnswersSeventeen;
      seventeenWrongAnswers = wrongAnswersSeventeen;

      eighteenTotalQuestions = totalQuestionsEighteen;
      eighteenCorrectAnswers = totalQuestionsEighteen - wrongAnswersEighteen;
      eighteenWrongAnswers = wrongAnswersEighteen;

      nineteenTotalQuestions = totalQuestionsNineteen;
      nineteenCorrectAnswers = totalQuestionsNineteen - wrongAnswersNineteen;
      nineteenWrongAnswers = wrongAnswersNineteen;

      twentyTotalQuestions = totalQuestionsTwenty;
      twentyCorrectAnswers = totalQuestionsTwenty - wrongAnswersTwenty;
      twentyWrongAnswers = wrongAnswersTwenty;

      twentyoneTotalQuestions = totalQuestionsTwentyOne;
      twentyoneCorrectAnswers = totalQuestionsTwentyOne - wrongAnswersTwentyOne;
      twentyoneWrongAnswers = wrongAnswersTwentyOne;

      twentytwoTotalQuestions = totalQuestionsTwentyTwo;
      twentytwoCorrectAnswers = totalQuestionsTwentyTwo - wrongAnswersTwentyTwo;
      twentytwoWrongAnswers = wrongAnswersTwentyTwo;

      twentythreeTotalQuestions = totalQuestionsTwentyThree;
      twentythreeCorrectAnswers = totalQuestionsTwentyThree - wrongAnswersTwentyThree;
      twentythreeWrongAnswers = wrongAnswersTwentyThree;

      twentyfourTotalQuestions = totalQuestionsTwentyFour;
      twentyfourCorrectAnswers = totalQuestionsTwentyFour - wrongAnswersTwentyFour;
      twentyfourWrongAnswers = wrongAnswersTwentyFour;

    });
  } catch (e) {
    debugPrint('Error fetching statistics: $e');
  }
}

  double getPerformancePercentage() {
    if (totalQuestions == 0) return 0.0;
    return (correctAnswers / totalQuestions) * 100;
  }

    double getPerformancePercentage1() {
    if (secondTotalQuestions == 0) return 0.0;
    return (secondCorrectAnswers / secondTotalQuestions) * 100;
  }

    double getPerformancePercentage2() {
    if (threeTotalQuestions == 0) return 0.0;
    return (threeCorrectAnswers / threeTotalQuestions) * 100;
  }

    double getPerformancePercentage3() {
    if (fourTotalQuestions == 0) return 0.0;
    return (fourCorrectAnswers / fourTotalQuestions) * 100;
  }

    double getPerformancePercentage4() {
    if (fiveTotalQuestions == 0) return 0.0;
    return (fiveCorrectAnswers / fiveTotalQuestions) * 100;
  }

    double getPerformancePercentage5() {
    if (sixteenTotalQuestions == 0) return 0.0;
    return (sixCorrectAnswers / sixteenTotalQuestions) * 100;
  }

    double getPerformancePercentage6() {
    if (sevenTotalQuestions == 0) return 0.0;
    return (sevenCorrectAnswers / sevenTotalQuestions) * 100;
  }

    double getPerformancePercentage7() {
    if (eightTotalQuestions == 0) return 0.0;
    return (eightCorrectAnswers / eightTotalQuestions) * 100;
  }

    double getPerformancePercentage8() {
    if (nineTotalQuestions == 0) return 0.0;
    return (nineCorrectAnswers / nineTotalQuestions) * 100;
  }

    double getPerformancePercentage9() {
    if (tenTotalQuestions == 0) return 0.0;
    return (tenCorrectAnswers / tenTotalQuestions) * 100;
  }

    double getPerformancePercentage10() {
    if (elevenTotalQuestions == 0) return 0.0;
    return (elevenCorrectAnswers / elevenTotalQuestions) * 100;
  }

    double getPerformancePercentage11() {
    if (twelveTotalQuestions == 0) return 0.0;
    return (twelveCorrectAnswers / twelveTotalQuestions) * 100;
  }

    double getPerformancePercentage12() {
    if (thirteenTotalQuestions == 0) return 0.0;
    return (thirteenCorrectAnswers / thirteenTotalQuestions) * 100;
  }

    double getPerformancePercentage13() {
    if (fourteenTotalQuestions == 0) return 0.0;
    return (fourCorrectAnswers / fourTotalQuestions) * 100;
  }

    double getPerformancePercentage14() {
    if (fifteenTotalQuestions == 0) return 0.0;
    return (fifteenCorrectAnswers / fifteenTotalQuestions) * 100;
  }

    double getPerformancePercentage15() {
    if (sixTotalQuestions == 0) return 0.0;
    return (sixCorrectAnswers / sixteenTotalQuestions) * 100;
  }

    double getPerformancePercentage16() {
    if (seventeenTotalQuestions == 0) return 0.0;
    return (seventeenCorrectAnswers / sevenTotalQuestions) * 100;
  }

    double getPerformancePercentage17() {
    if (eightTotalQuestions == 0) return 0.0;
    return (eightCorrectAnswers / eightTotalQuestions) * 100;
  }

    double getPerformancePercentage18() {
    if (nineTotalQuestions == 0) return 0.0;
    return (nineteenCorrectAnswers / nineteenTotalQuestions) * 100;
  }

    double getPerformancePercentage19() {
    if (twentyTotalQuestions == 0) return 0.0;
    return (twentyCorrectAnswers / twentyTotalQuestions) * 100;
  }

    double getPerformancePercentage20() {
    if (twentyoneTotalQuestions == 0) return 0.0;
    return (twentyCorrectAnswers / twentyoneTotalQuestions) * 100;
  }

    double getPerformancePercentage21() {
    if (twentytwoTotalQuestions == 0) return 0.0;
    return (twentytwoCorrectAnswers / twentytwoTotalQuestions) * 100;
  }

    double getPerformancePercentage22() {
    if (twentytwoTotalQuestions == 0) return 0.0;
    return (twentytwoCorrectAnswers / twentytwoTotalQuestions) * 100;
  }

    double getPerformancePercentage23() {
    if (twentythreeTotalQuestions == 0) return 0.0;
    return (twentyfourCorrectAnswers / twentythreeTotalQuestions) * 100;
  }

  // Fetch test results from Firestore using the User UID
  Future<void> fetchTestResults() async {
    setState(() {
      isLoading = true;
    });

    final userUID = FirebaseAuth.instance.currentUser?.uid;

    if (userUID != null) {
      try {
        // Query Firestore with the current user UID
        final snapshot = await FirebaseFirestore.instance
            .collection('saveExamResult')
            .where('userUID', isEqualTo: userUID) // Use UID to filter the data
            .get();

        // If no results are found for the user
        if (snapshot.docs.isEmpty) {
          setState(() {
            message = 'Шалгалт өгөөгүй';  // Show message if no results are found
          });
        } else {
          setState(() {
            testResults = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
            message = '';  // Clear message if results are found
          });
        }
      } catch (e) {
        debugPrint('Error fetching test results: $e');
      } finally {
        setState(() {
          isLoading = false;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    double performancePercentage = getPerformancePercentage();
    String emoji = wrongAnswers > 2 ? "😔" : "🎉"; // Emoji based on wrong answers

    return Scaffold(
      appBar: AppBar(
    
        backgroundColor: Colors.blue[100],
        iconTheme: const IconThemeData(color: Colors.black),
        bottom: PreferredSize(
          preferredSize: const Size.fromHeight(3),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                TextButton(
                  onPressed: () {
                    setState(() {
                      isTestMode = false;
                    });
                  },
                  child: const Text(
                    'Дасгал',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isTestMode = true;
                    });
                    fetchTestResults();
                  },
                  child: const Text(
                    'Шалгалт',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : (isTestMode ? _buildTestResults() : _buildPracticeContent(emoji)),
            // Display message if no exam result is found
            message.isNotEmpty
                ? Center(
                    child: Text(
                      message,
                      style: TextStyle(color: Colors.black, fontSize: 15), // Center the message
                    ),
                  )
                : const SizedBox(),  // Empty sized box when there's no message
          ],
        ),
      ),
    );
  }

  // Display the practice content
  Widget _buildPracticeContent(String emoji) {
    return Column(
      children: [
        _buildCategoryCard(
          'Нэр томьёоны тодорхойлолт',
          totalQuestions,
          correctAnswers,
          wrongAnswers,
          getPerformancePercentage(),
          emoji,
          assetImage: 'assets/1.png',
        ),
        _buildCategoryCard(
          'Механикжсан тээврийн хэрэгслий ангилал',
            secondTotalQuestions ,
            secondCorrectAnswers ,
            secondWrongAnswers,
          getPerformancePercentage1(),
          emoji,
          assetImage: 'assets/2.png',
        ),
         _buildCategoryCard(
          'Жолоочийн үүрэг',
          threeTotalQuestions,
          threeCorrectAnswers,
          threeWrongAnswers,
          getPerformancePercentage2(),
          emoji,
          assetImage: 'assets/3.png',
        ),
        _buildCategoryCard(
          '''Тусгай дуут болон гэрлэн дохио
ажилуулсан тээврийн хэрэгслийн
хөдөлгөөн''',
            fourTotalQuestions ,
            fourCorrectAnswers ,
            fourWrongAnswers,
          getPerformancePercentage3(),
          emoji,
          assetImage: 'assets/4.png',
        ),
         _buildCategoryCard(
          'Замын тэмдэг',
            fiveTotalQuestions ,
            fiveCorrectAnswers ,
            fiveWrongAnswers,
          getPerformancePercentage4(),
          emoji,
          assetImage: 'assets/5.png',
        ),
        _buildCategoryCard(
          'Замын тэмдэглэл',
            sixTotalQuestions ,
            sixCorrectAnswers ,
            sixWrongAnswers,
          getPerformancePercentage5(),
          emoji,
          assetImage: 'assets/6.png',
        ),
         _buildCategoryCard(
          'Замын хөдөлгөөн зохицуулах дохио',
            sevenTotalQuestions ,
            sevenCorrectAnswers ,
            sevenWrongAnswers,
          getPerformancePercentage6(),
          emoji,
          assetImage: 'assets/7.webp',
        ),
        _buildCategoryCard(
          'Анхааруулах дохио ба таних тэмдэг',
            eightTotalQuestions ,
            eightCorrectAnswers ,
            eightWrongAnswers,
          getPerformancePercentage7(),
          emoji,
          assetImage: 'assets/8.webp',
        ),
         _buildCategoryCard(
          'Хөдөлгөөн эхлэх болон чиг өөрчлөх',
           nineCorrectAnswers ,
            nineCorrectAnswers ,
            nineWrongAnswers,
          getPerformancePercentage8(),
          emoji,
          assetImage: 'assets/9.webp',
        ),
        _buildCategoryCard(
          'Тээврийн хэрэгсэл байрлан явах',
            tenTotalQuestions ,
            tenCorrectAnswers ,
            tenWrongAnswers,
          getPerformancePercentage9(),
          emoji,
          assetImage: 'assets/10.webp',
        ),
         _buildCategoryCard(
          'Тээврийн хэрэгслийн хурд',
        elevenTotalQuestions ,
            elevenCorrectAnswers ,
            elevenWrongAnswers,
          getPerformancePercentage10(),
          emoji,
          assetImage: 'assets/11.webp',
        ),
         _buildCategoryCard(
          'Гүйцэж түрүүлэх ба гүйцэх',
        twelveTotalQuestions ,
            twelveCorrectAnswers ,
            twelveWrongAnswers,
          getPerformancePercentage11(),
          emoji,
          assetImage: 'assets/12.webp',
        ),
        _buildCategoryCard(
          'Түр ба удаан зогсох',
            thirteenTotalQuestions ,
            thirteenCorrectAnswers ,
            thirteenWrongAnswers,
          getPerformancePercentage12(),
          emoji,
          assetImage: 'assets/13.webp',
        ),
         _buildCategoryCard(
          'Уулзвар нэвтрэх',
          fourteenTotalQuestions ,
            fourteenCorrectAnswers ,
            fourteenWrongAnswers,
          getPerformancePercentage13(),
          emoji,
          assetImage: 'assets/14.webp',
        ),
        _buildCategoryCard(
          'Явган хүний гарц нэвтрэх',
            fifteenTotalQuestions ,
            fifteenCorrectAnswers ,
            fifteenWrongAnswers,
          getPerformancePercentage14(),
          emoji,
          assetImage: 'assets/15.webp',
        ),
         _buildCategoryCard(
          'Төмөр замын гарам нэвтрэх',
    sixteenTotalQuestions ,
            sixteenCorrectAnswers ,
            sixteenWrongAnswers,
          getPerformancePercentage15(),
          emoji,
          assetImage: 'assets/16.webp',
        ),
        _buildCategoryCard(
          'Гадна талын гэрэлтүүлэх хэрэгсэл',
            seventeenTotalQuestions ,
            seventeenCorrectAnswers ,
            seventeenWrongAnswers,
          getPerformancePercentage16(),
          emoji,
          assetImage: 'assets/17.webp',
        ),
         _buildCategoryCard(
          'Хорооллын доторх хөдөлгөөн',
            eighteenTotalQuestions ,
            eighteenCorrectAnswers ,
            eighteenWrongAnswers,
          getPerformancePercentage17(),
          emoji,
          assetImage: 'assets/18.webp',
        ),
        _buildCategoryCard(
          'Тууш замын хөдөлгөөн',
            nineteenTotalQuestions ,
            nineteenCorrectAnswers ,
            nineteenWrongAnswers,
          getPerformancePercentage18(),
          emoji,
          assetImage: 'assets/19.webp',
        ),
         _buildCategoryCard(
          'Механикжсан тээврийн хэрэгслийг чирэх',
          twentyTotalQuestions ,
            twentyCorrectAnswers ,
            twentyWrongAnswers,
          getPerformancePercentage19(),
          emoji,
          assetImage: 'assets/20.webp',
        ),
        _buildCategoryCard(
          'Хүн ба ачаа тээвэрлэх',
            twentyoneTotalQuestions ,
            twentyoneCorrectAnswers ,
            twentyoneWrongAnswers,
          getPerformancePercentage20(),
          emoji,
          assetImage: 'assets/21.webp',
        ),
         _buildCategoryCard(
          'Тээврийн хэрэгслийн эвдрэл, гэмтэл, зөрчил',
          twentytwoTotalQuestions ,
            twentytwoCorrectAnswers ,
            twentytwoWrongAnswers,
          getPerformancePercentage21(),
          emoji,
          assetImage: 'assets/22.webp',
        ),
        _buildCategoryCard(
          'Тээврийн хэрэгслийг аюулгүй холоодох онол',
            twentythreeTotalQuestions ,
            twentythreeCorrectAnswers ,
            twentythreeWrongAnswers,
          getPerformancePercentage22(),
          emoji,
          assetImage: 'assets/23.webp',
        ),
         _buildCategoryCard(
          'Эмнэлгийн анхны тусламж',
            twentyfourTotalQuestions ,
            twentyfourCorrectAnswers ,
            twentyfourWrongAnswers,
          getPerformancePercentage23(),
          emoji,
          assetImage: 'assets/24.webp',
        ),
      ],
    );
  }

  // Display test results in list format
  Widget _buildTestResults() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 1),
        ListView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: testResults.length,
          itemBuilder: (context, index) {
            final result = testResults[index];
            final timestamp = (result['timestamp'] as Timestamp?)?.toDate();
            final wrong = result['wrongAnswers'] ?? 0;

            return Card(
              elevation: 3,
              margin: const EdgeInsets.only(bottom: 16),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(12),
              ),
              color: Colors.blue[50],
              child: Padding(
                padding: const EdgeInsets.all(5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Handle the condition for wrong answers
                    Center(
                      child: Text(
                        wrong > 2 ? "Тэнцээгүй" : "Тэнцсэн", // Proper condition
                        style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: wrong > 2 ? Colors.red : Colors.green, // Color change based on condition
                        ),
                      ),
                    ),
                    const SizedBox(height: 3),
                    Text(
                      'Шалгалт өгсөн огноо: ${timestamp?.toLocal().toString().split('.')[0] ?? 'Тодорхойгүй'}',
                      style: const TextStyle(),
                    ),
                    const SizedBox(height: 2),
                    Text('Алдсан асуулт: $wrong'),
                    const SizedBox(height: 2),
                  ],  
                ),
              ),
            );
          },
        ),
        const SizedBox(height: 2),
      ],
    );
  }

  // Build a card for each category
  Widget _buildCategoryCard(
    String categoryName,
    int totalQuestions,
    int correctAnswers,
    int wrongAnswers,
    double performancePercentage,
    String emoji, {
    String? assetImage, // Optional image parameter
  }) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      color: Colors.blue[100],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                // Display the image if assetImage is provided
                if (assetImage != null)
                  Image.asset(
                    assetImage,
                    width: 36, // Adjust size as needed
                    height: 36,
                  ),
                const SizedBox(width: 8),
                // Adjusted Text widget to prevent overflow and reduce size
                Flexible(
                  child: Text(
                    categoryName,
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    overflow: TextOverflow.ellipsis, 
                    maxLines: 3, 
                  ),
                ),
              ],
            ),
            const SizedBox(height: 0),
            // Displaying statistics in a Row layout
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoText('Нийт асуулт', totalQuestions, Colors.white),
                _buildInfoText('Зөв хариулт', correctAnswers, Colors.green),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      isLoading = true;
                    });

                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => WrongAnswerDetailPageOne(),
                      ),
                    ).then((_) {
                      setState(() {
                        isLoading = false;
                      });
                    });
                  },
                  child: _buildInfoText('Алдсан асуулт', wrongAnswers, Colors.red),
                ),
              ],
            ),
            const SizedBox(height: 2),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: performancePercentage >= passingScore
                    ? Colors.green
                    : Colors.red,
                minimumSize: Size(double.infinity, 30),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Text(
                'Амжилт: ${performancePercentage.toStringAsFixed(2)}%',
                style: const TextStyle(
                  color: Colors.white,
                  fontSize: 14,
                ),
              ),  
            ),
            const SizedBox(height: 2),
            LinearProgressIndicator(
              value: performancePercentage / 100,
              color: performancePercentage >= passingScore
                  ? Colors.green
                  : Colors.red,
              backgroundColor: Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoText(String label, int value, Color valueColor) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          label,
          style: const TextStyle(fontSize: 12, color: Colors.black54),
        ),
        const SizedBox(height: 4),
        Text(
          '$value',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
            color: valueColor,
          ),
        ),
      ],
    );
  }
} 