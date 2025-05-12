import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageOne.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageTwo.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageThree.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageFour.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageFive.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageSix.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageSeven.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageEight.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageNine.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageTen.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageEleven.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageTwelve.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageThirteen.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageFourteen.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageFifteen.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageSixteen.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageSeventeen.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageEighteen.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageNineteen.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageTwenty.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageTwentyOne.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageTwentyTwo.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageTwentyThree.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageTwentyFour.dart';

class UserDashboard extends StatefulWidget {
  const UserDashboard({super.key});

  @override
  State<UserDashboard> createState() => _UserDashboardState();
}

class _UserDashboardState extends State<UserDashboard> {
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

  bool isLoading = false;
  bool isTestMode = false;
  bool isTestModeFetched = false;

  String message = '';
  List<Map<String, dynamic>> testResults = [];

  final double passingScore = 60.0;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fetchStatistics();
  }

  Future<void> fetchStatistics() async {
    setState(() {
      isLoading = true;
    });

    try {
      final futures = await Future.wait([
        FirebaseFirestore.instance.collection('SmartTrafficInputOneCollection').get(),
        FirebaseFirestore.instance.collection('WrongAnswerTestCollection').where('userUID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputTwoCollection').get(),
        FirebaseFirestore.instance.collection('WrongAnswerTestTwoCollection').where('userUID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputThreeCollection').get(),
        FirebaseFirestore.instance.collection('WrongAnswerTestThreeCollection').where('userUID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputFourCollection').get(),
        FirebaseFirestore.instance.collection('WrongAnswerTestFourCollection').where('userUID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputFiveCollection').get(),
        FirebaseFirestore.instance.collection('WrongAnswerTestFiveCollection').where('userUID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputSixCollection').get(),
        FirebaseFirestore.instance.collection('WrongAnswerTestSixCollection').where('userUID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputSevenCollection').get(),
        FirebaseFirestore.instance.collection('WrongAnswerTestSevenCollection').where('userUID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputEightCollection').get(),
        FirebaseFirestore.instance.collection('WrongAnswerTestEightCollection').where('userUID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputNineCollection').get(),
        FirebaseFirestore.instance.collection('WrongAnswerTestNineCollection').where('userUID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputTenCollection').get(),
        FirebaseFirestore.instance.collection('WrongAnswerTestTenCollection').where('userUID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputElevenCollection').get(),
        FirebaseFirestore.instance.collection('WrongAnswerTestElevenCollection').where('userUID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputTwelveCollection').get(),
        FirebaseFirestore.instance.collection('WrongAnswerTestTwelveCollection').where('userUID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputThirteenCollection').get(),
        FirebaseFirestore.instance.collection('WrongAnswerTestThirteenCollection').where('userUID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputFourteenCollection').get(),
        FirebaseFirestore.instance.collection('WrongAnswerTestFourteenCollection').where('userUID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputFifteenCollection').get(),
        FirebaseFirestore.instance.collection('WrongAnswerTestFifteenCollection').where('userUID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputSixteenCollection').get(),
        FirebaseFirestore.instance.collection('WrongAnswerTestSixteenCollection').where('userUID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputSeventeenCollection').get(),
        FirebaseFirestore.instance.collection('WrongAnswerTestSeventeenCollection').where('userUID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputEighteenCollection').get(),
        FirebaseFirestore.instance.collection('WrongAnswerTestEighteenCollection').where('userUID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputNineteenCollection').get(),
        FirebaseFirestore.instance.collection('WrongAnswerTestNineteenCollection').where('userUID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputTwentyCollection').get(),
        FirebaseFirestore.instance.collection('WrongAnswerTestTwentyCollection').where('userUID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputTwentyOneCollection').get(),
        FirebaseFirestore.instance.collection('WrongAnswerTestTwentyOneCollection').where('userUID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputTwentyTwoCollection').get(),
        FirebaseFirestore.instance.collection('WrongAnswerTestTwentyTwoCollection').where('userUID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputTwentyThreeCollection').get(),
        FirebaseFirestore.instance.collection('WrongAnswerTestTwentyThreeCollection').where('userUID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get(),
        FirebaseFirestore.instance.collection('SmartTrafficInputTwentyFourCollection').get(),
        FirebaseFirestore.instance.collection('WrongAnswerTestTwentyFourCollection').where('userUID', isEqualTo: FirebaseAuth.instance.currentUser?.uid).get(),
      ]);

      setState(() {
        totalQuestions = futures[0].docs.length;
        correctAnswers = totalQuestions - futures[1].docs.length;
        wrongAnswers = futures[1].docs.length;

        secondTotalQuestions = futures[2].docs.length;
        secondCorrectAnswers = secondTotalQuestions - futures[3].docs.length;
        secondWrongAnswers = futures[3].docs.length;

        threeTotalQuestions = futures[4].docs.length;
        threeCorrectAnswers = threeTotalQuestions - futures[5].docs.length;
        threeWrongAnswers = futures[5].docs.length;

        fourTotalQuestions = futures[6].docs.length;
        fourCorrectAnswers = fourTotalQuestions - futures[7].docs.length;
        fourWrongAnswers = futures[7].docs.length;

        fiveTotalQuestions = futures[8].docs.length;
        fiveCorrectAnswers = fiveTotalQuestions - futures[9].docs.length;
        fiveWrongAnswers = futures[9].docs.length;

        sixTotalQuestions = futures[10].docs.length;
        sixCorrectAnswers = sixTotalQuestions - futures[11].docs.length;
        sixWrongAnswers = futures[11].docs.length;

        sevenTotalQuestions = futures[12].docs.length;
        sevenCorrectAnswers = sevenTotalQuestions - futures[13].docs.length;
        sevenWrongAnswers = futures[13].docs.length;

        eightTotalQuestions = futures[14].docs.length;
        eightCorrectAnswers = eightTotalQuestions - futures[15].docs.length;
        eightWrongAnswers = futures[15].docs.length;

        nineTotalQuestions = futures[16].docs.length;
        nineCorrectAnswers = nineTotalQuestions - futures[17].docs.length;
        wrongAnswers = futures[17].docs.length;

        tenTotalQuestions = futures[18].docs.length;
        tenCorrectAnswers = tenTotalQuestions - futures[19].docs.length;
        tenWrongAnswers = futures[19].docs.length;

        elevenTotalQuestions = futures[20].docs.length;
        elevenCorrectAnswers = elevenTotalQuestions - futures[21].docs.length;
        elevenWrongAnswers = futures[21].docs.length;

        twelveTotalQuestions = futures[22].docs.length;
        twelveCorrectAnswers = twelveTotalQuestions - futures[23].docs.length;
        twelveWrongAnswers = futures[23].docs.length;

        thirteenTotalQuestions = futures[24].docs.length;
        thirteenCorrectAnswers = thirteenTotalQuestions - futures[25].docs.length;
        thirteenWrongAnswers = futures[25].docs.length;

        fourteenTotalQuestions = futures[26].docs.length;
        fourteenCorrectAnswers = fourteenTotalQuestions - futures[27].docs.length;
        fourteenWrongAnswers = futures[27].docs.length;

        fifteenTotalQuestions = futures[28].docs.length;
        fifteenCorrectAnswers = fifteenTotalQuestions - futures[29].docs.length;
        fifteenWrongAnswers = futures[29].docs.length;

        sixteenTotalQuestions = futures[30].docs.length;
        sixteenCorrectAnswers = sixteenTotalQuestions - futures[31].docs.length;
        sixteenWrongAnswers = futures[31].docs.length;

        seventeenTotalQuestions = futures[32].docs.length;
        seventeenCorrectAnswers = seventeenTotalQuestions - futures[33].docs.length;
        seventeenWrongAnswers = futures[33].docs.length;

        eighteenTotalQuestions = futures[34].docs.length;
        eighteenCorrectAnswers = eighteenTotalQuestions - futures[35].docs.length;
        eighteenWrongAnswers = futures[35].docs.length;

        nineteenTotalQuestions = futures[36].docs.length;
        nineteenCorrectAnswers = nineteenTotalQuestions - futures[37].docs.length;
        nineteenWrongAnswers = futures[37].docs.length;

        twentyTotalQuestions = futures[38].docs.length;
        twentyCorrectAnswers = twentyTotalQuestions - futures[39].docs.length;
        twentyWrongAnswers = futures[39].docs.length;

        twentyoneTotalQuestions = futures[40].docs.length;
        twentyoneCorrectAnswers = twentyoneTotalQuestions - futures[41].docs.length;
        twentyWrongAnswers= futures[41].docs.length;

        twentytwoTotalQuestions = futures[42].docs.length;
        secondCorrectAnswers = twentytwoTotalQuestions - futures[43].docs.length;
        twentytwoWrongAnswers = futures[43].docs.length;

        twentythreeTotalQuestions = futures[44].docs.length;
        twentythreeCorrectAnswers = twentythreeTotalQuestions - futures[45].docs.length;
        twentythreeWrongAnswers = futures[45].docs.length;

        twentyfourTotalQuestions = futures[46].docs.length;
        twentyfourCorrectAnswers = twentyfourTotalQuestions - futures[47].docs.length;
        twentyfourWrongAnswers = futures[47].docs.length;
      });
    } catch (e) {
      debugPrint('Error fetching statistics: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
    }
  }

  Future<void> fetchTestResults() async {
    if (isTestModeFetched) return;

    setState(() => isLoading = true);
    final userUID = FirebaseAuth.instance.currentUser?.uid;

    if (userUID != null) {
      try {
        final snapshot = await FirebaseFirestore.instance
            .collection('saveExamResult')
            .where('userUID', isEqualTo: userUID)
            .get();

        setState(() {
          if (snapshot.docs.isEmpty) {
            message = 'Шалгалт өгөөгүй';
            testResults = [];
          } else {
            message = '';
            testResults = snapshot.docs.map((doc) => doc.data() as Map<String, dynamic>).toList();
          }
          isTestModeFetched = true;
        });
      } catch (e) {
        debugPrint('Error fetching test results: $e');
      } finally {
        setState(() => isLoading = false);
      }
    } else {
      setState(() => isLoading = false);
    }
  }

  double getPercentage(int total, int correct) =>
      total == 0 ? 0.0 : (correct / total) * 100;

  @override
  Widget build(BuildContext context) {
    final emoji = wrongAnswers > 2 ? "😔" : "🎉";

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
                    if (!isTestMode) return;
                    setState(() => isTestMode = false);
                  },
                  child: const Text('Дасгал',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
                ),
                TextButton(
                  onPressed: () {
                    if (isTestMode) return;
                    setState(() {
                      isTestMode = true;
                      if (!isTestModeFetched) fetchTestResults();
                    });
                  },
                  child: const Text('Шалгалт',
                      style: TextStyle(
                          fontSize: 16, fontWeight: FontWeight.bold, color: Colors.black)),
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
            if (isLoading)
              const Center(child: CircularProgressIndicator())
            else
              isTestMode
                  ? _buildTestResults()
                  : _buildPracticeContent(emoji),
            if (isTestMode && message.isNotEmpty)
              Center(child: Text(message, style: const TextStyle(color: Colors.black, fontSize: 15))),
          ],
        ),
      ),
    );
  }

  Widget _buildPracticeContent(String emoji) {
    return Column(
      children: [
        _buildCategoryCard('Нэр томьёоны тодорхойлолт', totalQuestions, correctAnswers, wrongAnswers,
            getPercentage(totalQuestions, correctAnswers), emoji, assetImage: 'assets/1.png'),
        _buildCategoryCard('Механикжсан тээврийн хэрэгслийн ангилал', secondTotalQuestions,
            secondCorrectAnswers, secondWrongAnswers, getPercentage(secondTotalQuestions, secondCorrectAnswers), emoji, assetImage: 'assets/2.png'),
        _buildCategoryCard('Жолоочийн үүрэг', threeTotalQuestions, threeCorrectAnswers,
            threeWrongAnswers, getPercentage(threeTotalQuestions, threeCorrectAnswers), emoji, assetImage: 'assets/3.png'),
        _buildCategoryCard(
            '''Тусгай дуут болон гэрлэн дохио\nажилуулсан тээврийн хэрэгслийн\nхөдөлгөөн''',
            fourTotalQuestions,
            fourCorrectAnswers,
            fourWrongAnswers,
            getPercentage(fourTotalQuestions, fourCorrectAnswers),
            emoji,
            assetImage: 'assets/4.png'),
             _buildCategoryCard('Замын тэмдэг', fiveTotalQuestions, fiveCorrectAnswers, fiveWrongAnswers,
            getPercentage(fiveTotalQuestions, fiveCorrectAnswers), emoji, assetImage: 'assets/5.png'),
        _buildCategoryCard('Замын тэмдэглэл', sixTotalQuestions,
            sixCorrectAnswers, sixWrongAnswers, getPercentage(sixTotalQuestions, sixCorrectAnswers), emoji, assetImage: 'assets/6.png'),
        _buildCategoryCard('Замын хөдөлгөөн зохицуулах дохио', sevenTotalQuestions, sevenCorrectAnswers,
            sevenWrongAnswers, getPercentage(sevenTotalQuestions, sevenCorrectAnswers), emoji, assetImage: 'assets/7.webp'),
        _buildCategoryCard(
            'Анхааруулах дохио ба таних дохио',
            eightTotalQuestions,
            eightCorrectAnswers,
            eightWrongAnswers,
            getPercentage(eightTotalQuestions, eightCorrectAnswers),
            emoji,
            assetImage: 'assets/8.webp'),
             _buildCategoryCard('Хөдөлгөөн эхлэх болон чиг өөрчлөх', nineTotalQuestions, nineCorrectAnswers, nineWrongAnswers,
            getPercentage(nineTotalQuestions, nineteenCorrectAnswers), emoji, assetImage: 'assets/9.webp'),
        _buildCategoryCard('Тээврийн хэрэгсэл байрлан явах', tenTotalQuestions,
            tenCorrectAnswers, tenWrongAnswers, getPercentage(tenTotalQuestions, tenCorrectAnswers), emoji, assetImage: 'assets/10.webp'),
        _buildCategoryCard('Тээврийн хэрэгслийн хурд', elevenTotalQuestions, elevenCorrectAnswers,
            elevenWrongAnswers, getPercentage(elevenTotalQuestions, elevenCorrectAnswers), emoji, assetImage: 'assets/11.webp'),
        _buildCategoryCard(
            'Гүйцэж түрүүлэх ба гүйцэх',
            twelveTotalQuestions,
            twelveCorrectAnswers,
            twelveWrongAnswers,
            getPercentage(twelveTotalQuestions, twelveCorrectAnswers),
            emoji,
            assetImage: 'assets/12.webp'),
             _buildCategoryCard('Түр ба удаан зогсох', thirteenTotalQuestions, thirteenCorrectAnswers, thirteenWrongAnswers,
            getPercentage(thirteenTotalQuestions, thirteenCorrectAnswers), emoji, assetImage: 'assets/13.webp'),
        _buildCategoryCard('Уулзвар нэвтрэх', fourTotalQuestions,
            fourteenCorrectAnswers, fourteenWrongAnswers, getPercentage(fourteenTotalQuestions, fourteenCorrectAnswers), emoji, assetImage: 'assets/14.webp'),
        _buildCategoryCard('Явган хүний гарц нэвтрэх', fifteenTotalQuestions, fifteenCorrectAnswers,
            fifteenWrongAnswers, getPercentage(fifteenTotalQuestions, fifteenCorrectAnswers), emoji, assetImage: 'assets/15.webp'),
        _buildCategoryCard(
            'Төмөр замын гарам нэвтрэх',
            sixteenTotalQuestions,
            sixteenCorrectAnswers,
            sixWrongAnswers,
            getPercentage(sixTotalQuestions, sixCorrectAnswers),
            emoji,
            assetImage: 'assets/16.webp'),
             _buildCategoryCard('Гадна талын гэрэлтүүлэх хэрэгсэл', seventeenTotalQuestions, seventeenCorrectAnswers, seventeenWrongAnswers,
            getPercentage(seventeenTotalQuestions, seventeenCorrectAnswers), emoji, assetImage: 'assets/17.webp'),
        _buildCategoryCard('Хорооллын дотор хөдөлгөөн', eighteenTotalQuestions,
            eighteenCorrectAnswers, eighteenWrongAnswers, getPercentage(eighteenTotalQuestions, eighteenCorrectAnswers), emoji, assetImage: 'assets/18.webp'),
        _buildCategoryCard('Тууш замын хөдөлгөөн', nineteenTotalQuestions, nineteenCorrectAnswers,
            nineteenWrongAnswers, getPercentage(nineteenTotalQuestions, nineteenCorrectAnswers), emoji, assetImage: 'assets/19.webp'),
        _buildCategoryCard(
            'Механикжсан тээврийн хэрэгслийг чирэх',
            twentyTotalQuestions,
            twentyCorrectAnswers,
            twentyWrongAnswers,
            getPercentage(twentyTotalQuestions, twentyCorrectAnswers),
            emoji,
            assetImage: 'assets/20.webp'),
             _buildCategoryCard('Хүн ба ачаа тээвэрлэх', twentyoneTotalQuestions, twentyoneCorrectAnswers, twentyoneWrongAnswers,
            getPercentage(twentyoneTotalQuestions, twentyoneCorrectAnswers), emoji, assetImage: 'assets/21.webp'),
        _buildCategoryCard('Тээврийн хэрэгслийн эвдрэл, гэмтэл, зөрчил', twentytwoTotalQuestions,
            twentytwoCorrectAnswers, twentytwoWrongAnswers, getPercentage(twentytwoTotalQuestions, twentytwoCorrectAnswers), emoji, assetImage: 'assets/22.webp'),
        _buildCategoryCard('Тээврийн хэрэгслийг аюулгүй холоодох онол', twentythreeTotalQuestions, twentythreeCorrectAnswers,
            twentythreeWrongAnswers, getPercentage(twentythreeTotalQuestions, twentythreeCorrectAnswers), emoji, assetImage: 'assets/23.webp'),
        _buildCategoryCard(
            'Эмнэлгийн анхны тусламж',
            twentyfourTotalQuestions,
            twentyfourCorrectAnswers,
            twentyfourWrongAnswers,
            getPercentage(twentyfourTotalQuestions, twentyfourCorrectAnswers),
            emoji,
            assetImage: 'assets/24.webp'),
      ],
    );
  }

  Widget _buildTestResults() {
    return ListView.builder(
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
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
          color: Colors.blue[50],
          child: Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Center(
                  child: Text(
                    wrong > 2 ? "Тэнцээгүй" : "Тэнцсэн",
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: wrong > 2 ? Colors.red : Colors.green),
                  ),
                ),
                const SizedBox(height: 4),
                Text('Шалгалт өгсөн огноо: ${timestamp?.toLocal().toString().split('.')[0] ?? 'Тодорхойгүй'}'),
                const SizedBox(height: 2),
                Text('Алдсан асуулт: $wrong'),
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildCategoryCard(String title, int total, int correct, int wrong, double percent, String emoji, {String? assetImage}) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.only(bottom: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      color: Colors.blue[100],
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                if (assetImage != null)
                  Image.asset(assetImage, width: 36, height: 36),
                const SizedBox(width: 8),
                Flexible(
                  child: Text(title, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold, color: Colors.black), maxLines: 3, overflow: TextOverflow.ellipsis),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildInfoText('Нийт асуулт', total, Colors.white),
                _buildInfoText('Зөв хариулт', correct, Colors.green),
                GestureDetector(
                  onTap: () {
                    setState(() => isLoading = true);
                    Widget destinationPage;
                    switch (title) {
                      case 'Нэр томьёоны тодорхойлолт':
                        destinationPage = const WrongAnswerDetailPageOne();
                        break;
                      case 'Механикжсан тээврийн хэрэгслийн ангилал':
                        destinationPage = const WrongAnswerDetailPageTwo();
                        break;
                      case 'Жолоочийн үүрэг':
                        destinationPage = const WrongAnswerDetailPageThree();
                        break;
                      case '''Тусгай дуут болон гэрлэн дохио\nажилуулсан тээврийн хэрэгслийн\nхөдөлгөөн''':
                        destinationPage = const WrongAnswerDetailPageFour();
                        break;
                          case 'Замын тэмдэг':
                        destinationPage = const WrongAnswerDetailPageFive();
                        break;
                      case 'Замын тэмдэглэл':
                        destinationPage = const WrongAnswerDetailPageSix();
                        break;
                      case 'Замын хөдөлгөөн зохицуулах дохио':
                        destinationPage = const WrongAnswerDetailPageSeven();
                        break;
                      case 'Анхааруулах дохио ба таних дохио':
                        destinationPage = const WrongAnswerDetailPageEight();
                        break;
                          case 'Хөдөлгөөн эхлэх болон чиг өөрчлөх':
                        destinationPage = const WrongAnswerDetailPageNine();
                        break;
                      case 'Тээврийн хэрэгсэл байрлан явах':
                        destinationPage = const WrongAnswerDetailPageTen();
                        break;
                      case 'Тээврийн хэрэгслийн хурд':
                        destinationPage = const WrongAnswerDetailPageEleven();
                        break;
                      case 'Гүйцэж түрүүлэх ба гүйцэх':
                        destinationPage = const WrongAnswerDetailPageTwelve();
                        break;
                          case 'Түр ба удаан зогсох':
                        destinationPage = const WrongAnswerDetailPageThirteen();
                        break;
                      case 'Уулзвар нэвтрэх':
                        destinationPage = const WrongAnswerDetailPageFourteen();
                        break;
                      case 'Явган хүний гарц нэвтрэх':
                        destinationPage = const WrongAnswerDetailPageFifteen();
                        break;
                      case 'Төмөр замын гарам нэвтрэх':
                        destinationPage = const WrongAnswerDetailPageSixteen();
                        break;
                          case 'Гадна талын гэрэлтүүлэх хэрэгсэл':
                        destinationPage = const WrongAnswerDetailPageSeventeen();
                        break;
                      case 'Хорооллын дотор хөдөлгөөн':
                        destinationPage = const WrongAnswerDetailPageEighteen();
                        break;
                      case 'Тууш замын хөдөлгөөн':
                        destinationPage = const WrongAnswerDetailPageNineteen();
                        break;
                      case 'Механикжсан тээврийн хэрэгслийг чирэх':
                        destinationPage = const WrongAnswerDetailPageTwenty();
                        break;
                          case 'Хүн ба ачаа тээвэрлэх':
                        destinationPage = const WrongAnswerDetailPageTwentyOne();
                        break;
                      case 'Тээврийн хэрэгслийн эвдрэл, гэмтэл, зөрчил':
                        destinationPage = const WrongAnswerDetailPageTwentyTwo();
                        break;
                      case 'Тээврийн хэрэгслийг аюулгүй холоодох онол':
                        destinationPage = const WrongAnswerDetailPageTwentyThree();
                        break;
                      case 'Эмнэлгийн анхны тусламж':
                        destinationPage = const WrongAnswerDetailPageTwentyFour();
                        break;
                      default:
                        destinationPage = const WrongAnswerDetailPageOne();
                    }
                    Navigator.push(context, MaterialPageRoute(builder: (_) => destinationPage)).then((_) {
                      setState(() => isLoading = false);
                    });
                  },
                  child: _buildInfoText('Алдсан асуулт', wrong, Colors.red),
                ),
              ],
            ),
            const SizedBox(height: 8),
            TextButton(
              onPressed: () {},
              style: TextButton.styleFrom(
                backgroundColor: percent >= passingScore ? Colors.green : Colors.red,
                minimumSize: const Size(double.infinity, 30),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
              ),
              child: Text('Амжилт: ${percent.toStringAsFixed(2)}%', style: const TextStyle(color: Colors.white, fontSize: 14)),
            ),
            const SizedBox(height: 4),
            LinearProgressIndicator(
              value: percent / 100,
              color: percent >= passingScore ? Colors.green : Colors.red,
              backgroundColor: Colors.grey[300],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfoText(String label, int value, Color color) {
    return Column(
      children: [
        Text(label, style: const TextStyle(fontSize: 12, color: Colors.black54)),
        const SizedBox(height: 4),
        Text('$value', style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: color)),
      ],
    );
  }
}
