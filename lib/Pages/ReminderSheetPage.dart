import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:traffic/Pages/BottomNavigationBarChange.dart'; // Make sure this path is correct

class ReminderSheetPage extends StatefulWidget {
  @override
  _ReminderSheetPageState createState() => _ReminderSheetPageState();
}

class _ReminderSheetPageState extends State<ReminderSheetPage> {
  bool rememberChoice = false;

  @override
  void initState() {
    super.initState();
    _checkTutorialStatus();
  }

  Future<void> _checkTutorialStatus() async {
    final prefs = await SharedPreferences.getInstance();
    bool showTutorial = prefs.getBool('show_tutorial') ?? true;

    if (showTutorial) {
      _showTutorialPage();
    } else {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => BottomNavigationBarChange()),
      );
    }
  }

  void _showTutorialPage() {
    showDialog(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return AlertDialog(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              title: Text(
                'Програмыг хэрхэн ашиглах вэ?',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              content: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ...[
                      '1. Дэд бүлгийн дагуу асуултын багц сонгож дасгал ажиллах.',
                      '2. 24 дэд бүлгээс санамсаргүй байдлаар 20 асуулт 20 минут шалгалт.',
                      '3. Дасгалын явцад алдсан асуултыг дэд бүлгээр ангилж харуулна.',
                      '4. Дасгал болон шалгалтын үр дүнг харуулна.',
                      '5. Алдааны тоо болон алгассан, эргэлзээтэй үлдээсэн асуултыг харуулна.',
                      '6. Хэрэглэгчийн хувийн мэдээллийг харуулна. Мэдээлэл өөрчлөх боломжтой.',
                      '7. “Сануулах” сонголтыг идэвхжүүлснээр дараагийн удаад энэхүү дэлгэцийг дахин харахгүй.',
                    ].map((text) => Padding(
                          padding: const EdgeInsets.symmetric(vertical: 6),
                          child: Text(
                            text,
                            style: TextStyle(height: 1.4, fontSize: 14),
                          ),
                        )),
                    SizedBox(height: 20),
                    Row(
                      children: [
                        Checkbox(
                          value: rememberChoice,
                          onChanged: (value) {
                            setState(() {
                              rememberChoice = value!;
                            });
                          },
                        ),
                        Expanded(
                          child: Text(
                            'Сануулах',
                            style: TextStyle(fontSize: 14),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              actions: [
                TextButton(
                  onPressed: () async {
                    final prefs = await SharedPreferences.getInstance();
                    if (rememberChoice) {
                      await prefs.setBool('show_tutorial', false);
                    }
                    Navigator.of(context).pop();
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => BottomNavigationBarChange(),
                      ),
                    );
                  },
                  child: Text(
                    'Үргэлжлүүлэх',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
              ],
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Text(
          'Welcome to the App!',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
