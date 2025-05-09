import 'package:flutter/material.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageEight.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageEighteen.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageEleven.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageFifteen.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageFive.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageFour.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageFourteen.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageNine.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageNineteen.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageOne.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageSeven.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageSeventeen.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageSix.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageSixteen.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageTen.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageThirteen.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageThree.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageTwelve.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageTwenty.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageTwentyFour.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageTwentyOne.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageTwentyThree.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageTwentyTwo.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageTwo.dart';

class WrongAnswerListPage extends StatelessWidget {
  const WrongAnswerListPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          "Алдсан тестүүд",
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 15,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(  // Added this for scrolling functionality
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const WrongAnswerDetailPageOne(),
                  ),
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                elevation: 2,
              ),
              child: Padding(
                padding: const EdgeInsets.all(7),
                child: Row(
                  children: [
                    Image.asset('assets/1.png', width: 36, height: 36),
                    const SizedBox(width: 10),
                    const Text(
                      "Нэр томьёоны тодорхойлолт",
                      style: TextStyle(
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontSize: 12,
                      ),
                    ),
                    const Spacer(),
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
        builder: (context) => WrongAnswerDetailPageTwo(),
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
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              "Механикжсан тээврийн хэрэгслийн ангилал",
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
    // Button click navigation
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WrongAnswerDetailPageThree(), // Admin Quiz Page
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
        Image.asset('assets/3.png', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Жолоочийн үүрэг",
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
SizedBox(height: 8,),
ElevatedButton(
  onPressed: () {
    // Button click navigation
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WrongAnswerDetailPageFour(), // Admin Quiz Page
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
        Image.asset('assets/4.png', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
              """Тусгай дуут болон гэрлэн дохио
ажилуулсан тээврийн хэрэгслийн
хөдөлгөөн""",
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
SizedBox(height: 8,),
ElevatedButton(
  onPressed: () {
    // Button click navigation
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WrongAnswerDetailPageFive(), // Admin Quiz Page
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
        Image.asset('assets/5.png', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Замын тэмдэг",
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
SizedBox(height: 8,),
ElevatedButton(
  onPressed: () {
    // Button click navigation
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WrongAnswerDetailPageSix(), // Admin Quiz Page
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
        Image.asset('assets/6.png', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Замын тэмдэглэл",
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
SizedBox(height: 8,),
ElevatedButton(
  onPressed: () {
    // Button click navigation
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WrongAnswerDetailPageSeven(), // Admin Quiz Page
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
        Image.asset('assets/7.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Замын хөдөлгөөн зохицуулах дохио",
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
SizedBox(height: 8,),
ElevatedButton(
  onPressed: () {
    // Button click navigation
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WrongAnswerDetailPageEight(), // Admin Quiz Page
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
        Image.asset('assets/8.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Анхааруулах дохио ба таних тэмдэг",
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
SizedBox(height: 8,),
ElevatedButton(
  onPressed: () {
    // Button click navigation
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WrongAnswerDetailPageNine(), // Admin Quiz Page
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
        Image.asset('assets/9.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Хөдөлгөөн эхлэх болон чиг өөрчлөх",
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
SizedBox(height: 8,),
ElevatedButton(
  onPressed: () {
    // Button click navigation
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WrongAnswerDetailPageTen(), // Admin Quiz Page
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
        Image.asset('assets/10.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Тээврийн хэрэгсэл байрлан явах",
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
SizedBox(height: 8,),
ElevatedButton(
  onPressed: () {
    // Button click navigation
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WrongAnswerDetailPageEleven(), // Admin Quiz Page
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
        Image.asset('assets/11.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Тээврийн хэрэгслийн хурд",
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
SizedBox(height: 8,),
ElevatedButton(
  onPressed: () {
    // Button click navigation
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WrongAnswerDetailPageTwelve(), // Admin Quiz Page
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
        Image.asset('assets/12.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Гүйцэж түрүүлэх ба гүйцэх",
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
SizedBox(height: 8,),
ElevatedButton(
  onPressed: () {
    // Button click navigation
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WrongAnswerDetailPageThirteen(), // Admin Quiz Page
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
        Image.asset('assets/13.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Түр ба удаан зогсох",
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
SizedBox(height: 8,),
ElevatedButton(
  onPressed: () {
    // Button click navigation
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WrongAnswerDetailPageFourteen(), // Admin Quiz Page
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
        Image.asset('assets/14.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Уулзвар нэвтрэх",
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
SizedBox(height: 8,),
ElevatedButton(
  onPressed: () {
    // Button click navigation
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WrongAnswerDetailPageFifteen(), // Admin Quiz Page
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
        Image.asset('assets/15.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Явган хүний гарц нэвтрэх",
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
SizedBox(height: 8,),
ElevatedButton(
  onPressed: () {
    // Button click navigation
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WrongAnswerDetailPageSixteen(), // Admin Quiz Page
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
        Image.asset('assets/16.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Төмөр замын гарам нэвтрэх",
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
SizedBox(height: 8,),
 ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WrongAnswerDetailPageSeventeen(),
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
        Image.asset('assets/15.webp', width: 36, height: 36),

        SizedBox(width: 10),

        // Текстэнд Expanded + Padding
        Expanded(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 4.0),
            child: Text(
              "Гадна талын гэрэлтүүлэх хэрэгсэл",
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
    // Button click navigation
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WrongAnswerDetailPageEighteen(), // Admin Quiz Page
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
        Image.asset('assets/18.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Хорооллын доторх хөдөлгөөн",
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
SizedBox(height: 8,),
ElevatedButton(
  onPressed: () {
    // Button click navigation
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WrongAnswerDetailPageNineteen(), // Admin Quiz Page
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
        Image.asset('assets/19.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Тууш замын хөдөлгөөн",
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
SizedBox(height: 8,),
 ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WrongAnswerDetailPageTwenty(),
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
              "Механикжсан тээврийн хэрэгслийг чирэх",
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
    // Button click navigation
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WrongAnswerDetailPageTwentyOne(), // Admin Quiz Page
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
        Image.asset('assets/21.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Хүн ба ачаа тээвэрлэх",
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
SizedBox(height: 8,),
   ElevatedButton(
  onPressed: () {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WrongAnswerDetailPageTwentyTwo(),
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
              "Тээврийн хэрэгслийн эвдрэл, гэмтэл, зөрчил",
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
        builder: (context) => WrongAnswerDetailPageTwentyThree(),
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
              "Тээврийн хэрэгслийг аюулгүй холоодох онол",
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
    // Button click navigation
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => WrongAnswerDetailPageTwentyFour(), // Admin Quiz Page
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
        Image.asset('assets/24.webp', width: 36, height: 36),
        SizedBox(width: 10),
        Text(
          "Эмнэлгийн анхны тусламж",
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
            // Add the rest of the ElevatedButton widgets here
            SizedBox(height: 8),
          ],
        ),
      ),
    );
  }
}
