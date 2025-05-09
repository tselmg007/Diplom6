import 'package:flutter/material.dart';
import 'package:traffic/Pages/FlashCard/RedFlashCard.dart';
import 'package:traffic/Pages/FlashCard/OrangeFlashCard.dart';
import 'package:traffic/Pages/FlashCard/YellowFlashCard.dart';
import 'package:traffic/Pages/FlashCard/ComplicatedQuestion.dart';
import 'package:traffic/Pages/FlashCard/SkipQuizPage.dart';

class FlashCardList extends StatelessWidget {
  final List<String> buttonTitles = [
    "Go to Red Flashcard",
    "Go to Orange Flashcard",
    "Go to Yellow Flashcard",
    "Go to Pink Flashcard",
    "Go to Gray Flashcard",
  ];

  final List<String> flashCardDescriptions = [
    "5 аас олон удаа алдсан асуулт",
    "4 болон 5 удаа алдсан асуулт",
    "3 удаа алдсан асуулт",
    "Алгассан асуулт",
    "Эргэлзээтэй check-лэсэн асуулт",
  ];

  final List<Color> cardColors = [
    Colors.red,
    Colors.orange,
    Colors.yellow,
    Colors.pink,
    Colors.grey,
  ];

  void _navigateToFlashCard(BuildContext context, String color) {
    if (color == 'Red') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => RedFlashCard()));
    } else if (color == 'Orange') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => OrangeFlashCard()));
    } else if (color == 'Yellow') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => YellowFlashCard()));
    } else if (color == 'Pink') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => ComplicatedQuestion()));
    } else if (color == 'Gray') {
      Navigator.push(context, MaterialPageRoute(builder: (_) => SkipQuizPage()));
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Center(
            child: ListView.builder(
              shrinkWrap: true,
              itemCount: buttonTitles.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                  child: ElevatedButton(
                    onPressed: () {
                      final color = buttonTitles[index].split(' ')[2];
                      _navigateToFlashCard(context, color);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: cardColors[index],
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      padding: EdgeInsets.symmetric(vertical: 12, horizontal: 20),
                      elevation: 5,
                    ),
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          Image.asset(
                            'assets/1111.jpg',
                            fit: BoxFit.cover,
                            color: Colors.black.withOpacity(0.3),
                            colorBlendMode: BlendMode.darken,
                          ),
                          Center(
                            child: Text(
                              buttonTitles[index],
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontSize: 18,
                                color: Colors.white,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Positioned(
            bottom: 20,
            right: 10,
            child: Container(
              padding: EdgeInsets.all(6),
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.9),
                borderRadius: BorderRadius.circular(8),
                boxShadow: [
                  BoxShadow(color: Colors.black26, blurRadius: 4),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: List.generate(cardColors.length, (index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Container(
                          width: 16,
                          height: 16,
                          color: cardColors[index],
                        ),
                        SizedBox(width: 6),
                        Text(
                          flashCardDescriptions[index],
                          style: TextStyle(fontSize: 12, fontWeight: FontWeight.w500),
                        ),
                      ],
                    ),
                  );
                }),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
