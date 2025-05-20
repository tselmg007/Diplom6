import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traffic/Pages/FlashCard/FlashCardList.dart';
import 'package:traffic/Pages/SignUpAndLogin/ProfilePage.dart';
import 'package:traffic/Pages/UserDashboard.dart';
import 'package:traffic/Pages/UserHomeScreen.dart';
import 'package:traffic/Pages/StartExamPage.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerListPage.dart';

class BottomNavigationBarChange extends StatefulWidget {
  const BottomNavigationBarChange({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarChange> createState() => _BottomNavigationBarChangeState();
}

class _BottomNavigationBarChangeState extends State<BottomNavigationBarChange> {
  int _currentIndex = 0;
  Color bottomNavBarSelectedColor = Colors.orange;

  late final List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _loadFooterColor();

    // 👇 Хуудаснуудыг initState дээр нэг удаа л үүсгэнэ
    _pages = [
   UserHomeScreenPage(),
   StartExamPage(),
  const WrongAnswerListPage(),
  const UserDashboard(),
   FlashCardList(),
   ProfilePage(),
];

  }

  Future<void> _loadFooterColor() async {
    final prefs = await SharedPreferences.getInstance();
    final int? colorValue = prefs.getInt('footerColor');
    setState(() {
      bottomNavBarSelectedColor = colorValue != null ? Color(colorValue) : Colors.orange;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
        index: _currentIndex,
        children: _pages,
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        type: BottomNavigationBarType.fixed,
        backgroundColor: bottomNavBarSelectedColor,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        selectedItemColor: Colors.white,
        unselectedItemColor: Colors.white70,
        selectedLabelStyle: const TextStyle(fontWeight: FontWeight.bold),
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.quiz),
            label: "Дасгал",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.explore),
            label: "Шалгалт",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.error_outline_sharp),
            label: "Алдсан",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.dashboard),
            label: "Дашбоард",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.sd_card_alert),
            label: "Флаш карт",
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person),
            label: "Профайл",
          ),
        ],
      ),
    );
  }
}
