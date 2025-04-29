import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traffic/Pages/FlashCard/FlashCardList.dart';
import 'package:traffic/Pages/UserDashboard.dart';
import 'package:traffic/Pages/UserHomeScreen.dart';
import 'package:traffic/Pages/UserTakeExam.dart';
import 'package:traffic/Pages/WrongAnswerDetailPage/WrongAnswerListPage.dart';

class BottomNavigationBarChange extends StatefulWidget {
  const BottomNavigationBarChange({Key? key}) : super(key: key);

  @override
  State<BottomNavigationBarChange> createState() => _BottomNavigationBarChangeState();
}

class _BottomNavigationBarChangeState extends State<BottomNavigationBarChange> {
  int _currentIndex = 0;
  Color bottomNavBarSelectedColor = Colors.orange;

  final List<Widget> _pages = [
    UserHomeScreenPage(),
    const UserTakeExam(),
    const WrongAnswerListPage (),
    const UserDashboard (),
     FlashCardList (),
  ];

  @override
  void initState() {
    super.initState();
    _loadFooterColor();
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
      body: _pages[_currentIndex],
     bottomNavigationBar: BottomNavigationBar(
  currentIndex: _currentIndex,
  type: BottomNavigationBarType.fixed, // 👉 shifting биш, background нэг өнгөтэй болгодог
  backgroundColor: bottomNavBarSelectedColor, // 🔵 сонгосон өнгийг background болгож байна
  onTap: (index) {
    setState(() {
      _currentIndex = index;
    });
  },
  selectedItemColor: Colors.white,       // ✅ Text/ikon цагаан
  unselectedItemColor: Colors.white70,   // ✅ Unselected цагаандуу
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
      label: "FlashCard",
    ),
  ],
),

    );
  }
}
