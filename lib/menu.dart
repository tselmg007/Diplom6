import 'package:flutter/material.dart';
import 'package:traffic/Pages/UserExercise/UserExerciseOne.dart';
import 'package:traffic/Pages/UserHomeScreen.dart';
import 'package:traffic/Pages/UserTakeExam.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerDetailPageOne.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerListPage.dart';

class MobailPage extends StatefulWidget {
  const MobailPage({Key? key}) : super(key: key);

  @override
  _PageSwitcherState createState() => _PageSwitcherState();
}

class _PageSwitcherState extends State<MobailPage> {
  int _currentIndex = 0;

  // Define your color variable here
  Color bottomNavBarSelectedColor = Colors.blue;

  final List<Widget> _pages = [
    UserHomeScreenPage(),
    UserTakeExam(),
    WrongAnswerListPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.shifting, // Set the type to shifting
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: bottomNavBarSelectedColor, // Use the variable here
        unselectedItemColor: Colors.grey,
        selectedLabelStyle: TextStyle(
          color: bottomNavBarSelectedColor, // Set selected label color
          fontWeight: FontWeight.bold, // Make the selected label bold
        ),
        unselectedLabelStyle: TextStyle(
          color: Colors.grey,
        ),
        selectedFontSize: 16.0, // Set the font size for the selected item
        unselectedFontSize: 14.0, // Set the font size for the unselected items
        items: [
          BottomNavigationBarItem(
            icon: Icon(
              Icons.question_answer,
              color: Colors.black,
            ),
            label: "Тест",
            backgroundColor: Colors.white, // Set background color for the item
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.theater_comedy_sharp,
              color: Colors.black,
            ),
            label: "Шалгалт",
            backgroundColor: Colors.white, // Set background color for the item
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.error_sharp,
              color: Colors.black,
            ),
            label: "Алдсан тест",
            backgroundColor: Colors.white, // Set background color for the item
          ),
        ],
      ),
    );
  }
}
