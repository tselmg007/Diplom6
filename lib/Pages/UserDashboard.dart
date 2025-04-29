import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart'; // Import FirebaseAuth
import 'package:traffic/Pages/BottomNavigationBarChange.dart';
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
  double passingScore = 80.0;
  bool isTestMode = false;
  List<Map<String, dynamic>> testResults = [];
  bool isLoading = false;  // Loading state for managing the UI
  String message = '';  // Message to show if the user has taken the exam

  @override
  void initState() {
    super.initState();
    // If data is already loaded, do not fetch again.
    if (totalQuestions == 0) {
      fetchStatistics();  // Fetch statistics only once
    }
  }

  // Fetch statistics from Firestore
  Future<void> fetchStatistics() async {
    try {
      setState(() {
        isLoading = true;
      });

      final snapshot1 = await FirebaseFirestore.instance
          .collection('SmartTrafficInputOneCollection')
          .get();
      final totalQuestionsFromSmartTraffic = snapshot1.docs.length;

      final snapshot2 = await FirebaseFirestore.instance
          .collection('WrongAnswerTestCollection')
          .get();
      final wrongAnswersCount = snapshot2.docs.length;

          final snapshot3 = await FirebaseFirestore.instance
        .collection('SmartTrafficInputTwoCollection')
        .get();
    final totalQuestionsTwo = snapshot3.docs.length;

    final snapshot4 = await FirebaseFirestore.instance
        .collection('WrongAnswerTestTwoCollection')
        .get();
    final wrongAnswersTwo = snapshot4.docs.length;

      setState(() {
        totalQuestions = totalQuestionsFromSmartTraffic;
        correctAnswers = totalQuestionsFromSmartTraffic - wrongAnswersCount;
        wrongAnswers = wrongAnswersCount;

           secondTotalQuestions = totalQuestionsTwo;
      secondCorrectAnswers = totalQuestionsTwo - wrongAnswersTwo;
      secondWrongAnswers = wrongAnswersTwo;
        


      });
    } catch (e) {
      debugPrint('Error fetching statistics: $e');
    } finally {
      setState(() {
        isLoading = false;
      });
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
        leading: isTestMode
            ? IconButton(
                icon: const Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(builder: (context) => const BottomNavigationBarChange()),
                  );
                },
              )
            : null,
        centerTitle: true,
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
            message.isNotEmpty ? Text(message, style: TextStyle(color: Colors.red, fontSize: 18)) : SizedBox(),
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
          secondTotalQuestions,
          secondCorrectAnswers,
          secondTotalQuestions,
          getPerformancePercentage1(),
          emoji,
          assetImage: 'assets/2.png',
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
                if (assetImage != null)
                  Image.asset(
                    assetImage,
                    width: 36,
                    height: 36,
                  ),
                const SizedBox(width: 8),
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
