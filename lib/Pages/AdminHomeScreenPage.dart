import 'package:flutter/material.dart';
import 'package:traffic/Pages/AdminQuestionList/AdminQuizOneListPage.dart';
import 'package:traffic/Pages/AdminQuestionList/AdminQuizTwoListPage.dart';
import 'package:traffic/Pages/AdminQuestionList/AdminQuizThreeListPage.dart';
import 'package:traffic/Pages/AdminQuestionList/AdminQuizFourListPage.dart';
import 'package:traffic/Pages/AdminQuestionList/AdminQuizFiveListPage.dart';
import 'package:traffic/Pages/AdminQuestionList/AdminQuizSixListPage.dart';
import 'package:traffic/Pages/AdminQuestionList/AdminQuizSevenListPage.dart';
import 'package:traffic/Pages/AdminQuestionList/AdminQuizEightListPage.dart';
import 'package:traffic/Pages/AdminQuestionList/AdminQuizNineListPage.dart';
import 'package:traffic/Pages/AdminQuestionList/AdminQuizTenListPage.dart';
import 'package:traffic/Pages/AdminQuestionList/AdminQuizElevenListPage.dart';
import 'package:traffic/Pages/AdminQuestionList/AdminQuizTwelveListPage.dart';
import 'package:traffic/Pages/AdminQuestionList/AdminQuizThirteenListPage.dart';
import 'package:traffic/Pages/AdminQuestionList/AdminQuizFourteenListPage.dart';
import 'package:traffic/Pages/AdminQuestionList/AdminQuizFifteenListPage.dart';
import 'package:traffic/Pages/AdminQuestionList/AdminQuizSixteenListPage.dart';
import 'package:traffic/Pages/AdminQuestionList/AdminQuizSeventeenListPage.dart';
import 'package:traffic/Pages/AdminQuestionList/AdminQuizEighteenListPage.dart';
import 'package:traffic/Pages/AdminQuestionList/AdminQuizNineteenListPage.dart';
import 'package:traffic/Pages/AdminQuestionList/AdminQuizTwentyListPage.dart';
import 'package:traffic/Pages/AdminQuestionList/AdminQuizTwentyOneListPage.dart';
import 'package:traffic/Pages/AdminQuestionList/AdminQuizTwentyTwoListPage.dart';
import 'package:traffic/Pages/AdminQuestionList/AdminQuizTwentyThreeListPage.dart';
import 'package:traffic/Pages/AdminQuestionList/AdminQuizTwentyFourListPage.dart';
import 'package:traffic/Pages/SignIn/AdminSignInOnePage.dart';
import 'package:traffic/Pages/SignIn/AdminSignInTwoPage.dart';
import 'package:traffic/Pages/SignIn/AdminSignInThreePage.dart';
import 'package:traffic/Pages/SignIn/AdminSignInFourPage.dart';
import 'package:traffic/Pages/SignIn/AdminSignInFivePage.dart';
import 'package:traffic/Pages/SignIn/AdminSignInSixPage.dart';
import 'package:traffic/Pages/SignIn/AdminSignInSevenPage.dart';
import 'package:traffic/Pages/SignIn/AdminSignInEightPage.dart';
import 'package:traffic/Pages/SignIn/AdminSignInNinePage.dart';
import 'package:traffic/Pages/SignIn/AdminSignInTenPage.dart';
import 'package:traffic/Pages/SignIn/AdminSignInElevenPage.dart';
import 'package:traffic/Pages/SignIn/AdminSignInTwelvePage.dart';
import 'package:traffic/Pages/SignIn/AdminSignInThirteenPage.dart';
import 'package:traffic/Pages/SignIn/AdminSignInFourteenPage.dart';
import 'package:traffic/Pages/SignIn/AdminSignInFifteenPage.dart';
import 'package:traffic/Pages/SignIn/AdminSignInSixteenPage.dart';
import 'package:traffic/Pages/SignIn/AdminSignInSeventeenPage.dart';
import 'package:traffic/Pages/SignIn/AdminSignInEighteenPage.dart';
import 'package:traffic/Pages/SignIn/AdminSignInNineteenPage.dart';
import 'package:traffic/Pages/SignIn/AdminSignInTwentyPage.dart';
import 'package:traffic/Pages/SignIn/AdminSignInTwentyOnePage.dart';
import 'package:traffic/Pages/SignIn/AdminSignInTwentyTwoPage.dart';
import 'package:traffic/Pages/SignIn/AdminSignInTwentyThreePage.dart';
import 'package:traffic/Pages/SignIn/AdminSignInTwentyFourPage.dart';

class AdminHomeScreenPage extends StatefulWidget {
  const AdminHomeScreenPage({Key? key}) : super(key: key);

  @override
  State<AdminHomeScreenPage> createState() => _AnswerPageState();
}

class _AnswerPageState extends State<AdminHomeScreenPage> {
  final List<Widget> index = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        centerTitle: true,
        // leading: MenuWidget(),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              "Дэд бүлэг асуултууд",
              textAlign: TextAlign.left,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15,
              ),
            ),
            SizedBox(height: 10),
           ElevatedButton(
  onPressed: () {
    // Button click navigation
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdminSignInOnePage(), // Admin Quiz Page
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white, // White background for this button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2, // Adds shadow to give a slight raised effect
  ),
  child: Padding(
    padding: const EdgeInsets.all(7),
    child: Row(
      children: [
        // Icon for the button
        Image.asset('assets/1.png', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Нэр томьёоны тодорхойлолт-20",
          style: TextStyle(
            color: Colors.black, // Text color for white button
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Spacer(),
        // Next icon at the end of the button
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),

SizedBox(height: 8), // Space between buttons

ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdminQuizListOnePage(), // Quiz List Page
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue[100], // Dark background for this button
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
    elevation: 2, // Adds shadow to give a slight raised effect
  ),
  child: Padding(
    padding: const EdgeInsets.all(7),
    child: Row(
      children: [
        SizedBox(width: 10),
        Text(
          "Нэр томьёоны тодорхойлолтын жагсаалт",
          style: TextStyle(
            color: Colors.white, // White text for dark button
            fontWeight: FontWeight.bold,
            fontSize: 12,
          ),
        ),
        Spacer(),
        Image.asset('assets/list.png', width: 24, height: 24),
      ],
    ),
  ),
),
            SizedBox(height: 8),
          ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdminSignInTwoPage(),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10), // Outer padding
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Зургийн орон зай
        Image.asset('assets/2.png', width: 36, height: 36),

        SizedBox(width: 10),

        // Текстэнд Expanded + Padding
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              "Механикжсан тээврийн хэрэгслийн-20\nангилал",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis, // Урт текст таслана
            ),
          ),
        ),

        // Icon
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),

            SizedBox(height: 8),
           ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdminQuizTwoListPage(), // Quiz List Page
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue[100],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
    child: Row(
      children: [
        // Text-ийг Expanded ашиглаж мөр дүүргэх
        Expanded(
          child: Text(
            "Механикжсан тээврийн хэрэгслийн жагсаалт",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        SizedBox(width: 10),

        // Icon
        Image.asset('assets/list.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminSignInThreePage(), // Use the correct class name
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    Image.asset('assets/3.png', width: 36, height: 36),
                    SizedBox(width: 10),
                    Text(
                      "Жолоочийн үүрэг-30",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(), // Add Spacer to push elements to the left
                    Image.asset('assets/next.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
             ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminQuizThreeListPage(), // Quiz List Page
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      "Жолоочийн үүрэг жагсаалт",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    Image.asset('assets/list.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),  
             SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminSignInFourPage(), // Use the correct class name
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    Image.asset('assets/4.png', width: 36, height: 36),
                    SizedBox(width: 10),
                    Text(
                      """Тусгай дуут болон гэрлэн дохио
ажилуулсан тээврийн хэрэгслийн
хөдөлгөөн-10""",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(), // Add Spacer to push elements to the left
                    Image.asset('assets/next.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
                         ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminQuizFourListPage(), // Quiz List Page
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                       """Тусгай дуут болон гэрлэн дохио
ажилуулсан тээврийн хэрэгслийн
хөдөлгөөн жагсаалт""",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    Image.asset('assets/list.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),  
             SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminSignInFivePage(), // Use the correct class name
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    Image.asset('assets/5.png', width: 36, height: 36),
                    SizedBox(width: 10),
                    Text(
                      "Замын тэмдэг-120",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(), // Add Spacer to push elements to the left
                    Image.asset('assets/next.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
                         ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminQuizFiveListPage(), // Quiz List Page
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      "Замын тэмдэг жагсаалт",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    Image.asset('assets/list.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),  
             SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminSignInSixPage(), // Use the correct class name
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    Image.asset('assets/6.png', width: 36, height: 36),
                    SizedBox(width: 10),
                    Text(
                      "Замын тэмдэглэл-40",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(), // Add Spacer to push elements to the left
                    Image.asset('assets/next.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8,),
                         ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminQuizSixListPage(), // Quiz List Page
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      "Замын тэмдэглэл жагсаалт",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    Image.asset('assets/list.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),  
             SizedBox(height: 8),
            ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdminSignInSevenPage(),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10), // Outer padding
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Зургийн орон зай
        Image.asset('assets/7.webp', width: 36, height: 36),

        SizedBox(width: 10),

        // Текстэнд Expanded + Padding
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              "Замын хөдөлгөөн зохицуулах дохио-40",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis, // Урт текст таслана
            ),
          ),
        ),

        // Icon
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8,),
              ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdminQuizSevenListPage(), // Quiz List Page
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue[100],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
    child: Row(
      children: [
        // Text-ийг Expanded ашиглаж мөр дүүргэх
        Expanded(
          child: Text(
            "Замын хөдөлгөөн зохицуулах дохио жагсаалт",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        SizedBox(width: 10),

        // Icon
        Image.asset('assets/list.png', width: 24, height: 24),
      ],
    ),
  ),
),
            SizedBox(height: 8),
          ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdminSignInEightPage(),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10), // Outer padding
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Зургийн орон зай
        Image.asset('assets/8.webp', width: 36, height: 36),

        SizedBox(width: 10),

        // Текстэнд Expanded + Padding
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              "Анхааруулах дохио ба таних дохио-40\nангилал",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis, // Урт текст таслана
            ),
          ),
        ),

        // Icon
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8,),
ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdminQuizEightListPage(), // Quiz List Page
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue[100],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
    child: Row(
      children: [
        // Text-ийг Expanded ашиглаж мөр дүүргэх
        Expanded(
          child: Text(
            "Анхааруулах дохио ба таних дохио жагсаалт",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        SizedBox(width: 10),

        // Icon
        Image.asset('assets/list.png', width: 24, height: 24),
      ],
    ),
  ),
),

            SizedBox(height: 8),
            ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdminSignInNinePage(),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10), // Outer padding
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Зургийн орон зай
        Image.asset('assets/9.webp', width: 36, height: 36),

        SizedBox(width: 10),

        // Текстэнд Expanded + Padding
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              "Хөдөлгөөн эхлэх болон чиг өөрчлөх-80",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis, // Урт текст таслана
            ),
          ),
        ),

        // Icon
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8,),
                        ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdminQuizNineListPage(), // Quiz List Page
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue[100],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
    child: Row(
      children: [
        // Text-ийг Expanded ашиглаж мөр дүүргэх
        Expanded(
          child: Text(
            "Хөдөлгөөн эхлэх болон чиг өөрчлөх жагсаалт",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        SizedBox(width: 10),

        // Icon
        Image.asset('assets/list.png', width: 24, height: 24),
      ],
    ),
  ),
),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminSignInTenPage(), // Use the correct class name
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    Image.asset('assets/10.webp', width: 36, height: 36),
                    SizedBox(width: 10),
                    Text(
                      "Тээврийн хэрэгсэл байрлан явах-80",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(), // Add Spacer to push elements to the left
                    Image.asset('assets/next.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
                         ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminQuizTenListPage(), // Quiz List Page
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      "Тээврийн хэрэгсэл байрлан явах жагсаалт",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    Image.asset('assets/list.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),  
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AdminSignInElevenPage(), // Use the correct class name
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    Image.asset('assets/11.webp', width: 36, height: 36),
                    SizedBox(width: 10),
                    Text(
                      "Тээврийн хэрэгслийн хурд-20",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(), // Add Spacer to push elements to the left
                    Image.asset('assets/next.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
                         ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminQuizElevenListPage(), // Quiz List Page
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      "Тээврийн хэрэгслийн хурд жагсаалт",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    Image.asset('assets/list.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),  
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AdminSignInTwelvePage(), // Use the correct class name
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    Image.asset('assets/12.webp', width: 36, height: 36),
                    SizedBox(width: 10),
                    Text(
                      "Гүйцэж түрүүлэх ба гүйцэх-20",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(), // Add Spacer to push elements to the left
                    Image.asset('assets/next.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
                         ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminQuizTwelveListPage(), // Quiz List Page
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      "Гүйцэж түрүүлэх ба гүйцэх жагсаалт",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    Image.asset('assets/list.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),  
             SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AdminSignInThirteenPage(), // Use the correct class name
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    Image.asset('assets/13.webp', width: 36, height: 36),
                    SizedBox(width: 10),
                    Text(
                      "Түр ба удаан зогсох-80",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(), // Add Spacer to push elements to the left
                    Image.asset('assets/next.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
                         ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminQuizThirteenListPage(), // Quiz List Page
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      "Түр ба удаан зогсох жагсаалт",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    Image.asset('assets/list.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),  
             SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AdminSignInFourteenPage(), // Use the correct class name
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    Image.asset('assets/14.webp', width: 36, height: 36),
                    SizedBox(width: 10),
                    Text(
                      "Уулзвар нэвтрэх-70",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(), // Add Spacer to push elements to the left
                    Image.asset('assets/next.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
                         ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminQuizFourteenListPage(), // Quiz List Page
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      "Уулзвар нэвтрэх жагсаалт",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    Image.asset('assets/list.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),  
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AdminSignInFifteenPage(), // Use the correct class name
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    Image.asset('assets/15.webp', width: 36, height: 36),
                    SizedBox(width: 10),
                    Text(
                      "Явган хүний гарц нэвтрэх-10",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(), // Add Spacer to push elements to the left
                    Image.asset('assets/next.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
                         ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminQuizFifteenListPage(), // Quiz List Page
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      "Явган хүний гарц нэвтрэх жагсаалт",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    Image.asset('assets/list.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),  
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AdminSignInSixteenPage(), // Use the correct class name
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    Image.asset('assets/16.webp', width: 36, height: 36),
                    SizedBox(width: 10),
                    Text(
                      "Төмөр замын гарам нэвтрэх-20",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(), // Add Spacer to push elements to the left
                    Image.asset('assets/next.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
                         ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminQuizSixteenListPage(), // Quiz List Page
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      "Төмөр замын гарам нэвтрэх жагсаалт",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    Image.asset('assets/list.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),  
             SizedBox(height: 8),
           ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdminSignInSeventeenPage(),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10), // Outer padding
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Зургийн орон зай
        Image.asset('assets/17.webp', width: 36, height: 36),

        SizedBox(width: 10),

        // Текстэнд Expanded + Padding
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              "Гадна талын гэрэлтүүлэх хэрэгслийг хэрэглэх-10",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis, // Урт текст таслана
            ),
          ),
        ),

        // Icon
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8,),
                         ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdminQuizSeventeenListPage(), // Quiz List Page
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue[100],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
    child: Row(
      children: [
        // Text-ийг Expanded ашиглаж мөр дүүргэх
        Expanded(
          child: Text(
            "Гадна талын гэрэлтүүлэх хэрэгслийг хэрэглэх жагсаалт",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: 10),

        // Icon
        Image.asset('assets/list.png', width: 24, height: 24),
      ],
    ),
  ),
),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AdminSignInEighteenPage(), // Use the correct class name
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    Image.asset('assets/18.webp', width: 36, height: 36),
                    SizedBox(width: 10),
                    Text(
                      "Хорооллын дотор хөдөлгөөн-10",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(), // Add Spacer to push elements to the left
                    Image.asset('assets/next.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),
                         ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminQuizEighteenListPage(), // Quiz List Page
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      "Хорооллын дотор хөдөлгөөн жагсаалт",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    Image.asset('assets/list.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),  
             SizedBox(height: 8),
               SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AdminSignInNineteenPage(), // Use the correct class name
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    Image.asset('assets/19.webp', width: 36, height: 36),
                    SizedBox(width: 10),
                    Text(
                      "Тууш замын хөдөлгөөн",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(), // Add Spacer to push elements to the left
                    Image.asset('assets/next.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),
                         ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminQuizNineteenListPage(), // Quiz List Page
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      "Тууш замын хөдөлгөөн жагсаалт",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    Image.asset('assets/list.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),  
           ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdminSignInTwentyPage(),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10), // Outer padding
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Зургийн орон зай
        Image.asset('assets/20.webp', width: 36, height: 36),

        SizedBox(width: 10),

        // Текстэнд Expanded + Padding
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              "Механикжсан тээврийн хэрэгслийг чирэх-10",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis, // Урт текст таслана
            ),
          ),
        ),

        // Icon
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 8,),
                        ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdminQuizTwentyListPage(), // Quiz List Page
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue[100],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
    child: Row(
      children: [
        // Text-ийг Expanded ашиглаж мөр дүүргэх
        Expanded(
          child: Text(
            "Механикжсан тээврийн хэрэгслийг жагсаалт",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        SizedBox(width: 10),

        // Icon
        Image.asset('assets/list.png', width: 24, height: 24),
      ],
    ),
  ),
),

            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AdminSignInTwentyOnePage(), // Use the correct class name
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(7),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    Image.asset('assets/18.webp', width: 36, height: 36),
                    SizedBox(width: 10),
                    Text(
                      "Хүн ба ачаа тээвэрлэх-20",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(), // Add Spacer to push elements to the left
                    Image.asset('assets/next.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),
                         ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminQuizTwentyOneListPage(), // Quiz List Page
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      "Хүн ба ачаа тээвэрлэх жагсаалт",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    Image.asset('assets/list.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),  
             
SizedBox(height: 8,),
            ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdminSignInTwentyTwoPage(),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10), // Outer padding
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Зургийн орон зай
        Image.asset('assets/22.webp', width: 36, height: 36),

        SizedBox(width: 10),

        // Текстэнд Expanded + Padding
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              "Тээврийн хэрэгслийн эвдрэл, гэмтэл, зөрчил-20",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis, // Урт текст таслана
            ),
          ),
        ),

        // Icon
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 10,),
                     ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdminQuizTwentyTwoListPage(), // Quiz List Page
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue[100],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
    child: Row(
      children: [
        // Text-ийг Expanded ашиглаж мөр дүүргэх
        Expanded(
          child: Text(
            "Тээврийн хэрэгслийн эвдрэл, гэмтэл, зөрчил жагсаалт",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),
        SizedBox(width: 10),
        Image.asset('assets/list.png', width: 24, height: 24),
      ],
    ),
  ),
),
            SizedBox(height: 8),
            ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdminSignInTwentyThreePage(),
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.white,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 7, horizontal: 10), // Outer padding
    child: Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        // Зургийн орон зай
        Image.asset('assets/23.webp', width: 36, height: 36),

        SizedBox(width: 10),

        // Текстэнд Expanded + Padding
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              "Тээврийн хэрэгслийг аюулгүй холоодох онол-10",
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 12,
              ),
              maxLines: 2,
              overflow: TextOverflow.ellipsis, // Урт текст таслана
            ),
          ),
        ),

        // Icon
        Image.asset('assets/next.png', width: 24, height: 24),
      ],
    ),
  ),
),
SizedBox(height: 10,),
                        ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => AdminQuizTwentyThreeListPage(), // Quiz List Page
      ),
    );
  },
  style: ElevatedButton.styleFrom(
    backgroundColor: Colors.blue[100],
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  ),
  child: Padding(
    padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
    child: Row(
      children: [
        // Text-ийг Expanded ашиглаж мөр дүүргэх
        Expanded(
          child: Text(
            "Тээврийн хэрэгслийг аюулгүй холоодох жагсаалт",
            style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold,
              fontSize: 12,
            ),
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
          ),
        ),

        SizedBox(width: 10),

        // Icon
        Image.asset('assets/list.png', width: 24, height: 24),
      ],
    ),
  ),
),
            SizedBox(height: 8),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) =>
                        AdminSignInTwentyFourPage(), // Use the correct class name
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    Image.asset('assets/24.webp', width: 36, height: 36),
                    SizedBox(width: 10),
                    Text(
                      "Эмнэлгийн анхны тусламж-10",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(), // Add Spacer to push elements to the left
                    Image.asset('assets/next.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),
            SizedBox(height: 8),
                         ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminQuizTwentyFourListPage(), // Quiz List Page
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue[100],
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    SizedBox(width: 10),
                    Text(
                      "Эмнэлгийн анхны тусламж жагсаалт",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    Spacer(),
                    Image.asset('assets/list.png', width: 24, height: 24),
                  ],
                ),
              ),
            ),  
             SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}


