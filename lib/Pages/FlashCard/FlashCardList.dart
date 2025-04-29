import 'package:flutter/material.dart';
import 'package:traffic/Pages/FlashCard/RedFlashCard.dart';
import 'package:traffic/Pages/FlashCard/OrangeFlashCard.dart';
import 'package:traffic/Pages/FlashCard/YellowFlashCard.dart';

class FlashCardList extends StatelessWidget {
  final List<String> buttonTitles = [
    "Go to Red Flashcard",
    "Go to Orange Flashcard",
    "Go to Yellow Flashcard",
  ];

  // Description text for each flashcard
  final List<String> flashCardDescriptions = [
    "Хэрэглэгч нэг асуултанд 3 удаа алдсан тохиолдолд шар карт руу асуулт нэмэгдэнэ.",
    "Хэрэглэгч нэг асуултанд 4 болон 5 удаа алдсан тохиолдолд улбар шар карт руу асуулт нэмэгдэнэ.",
    "Хэрэглэгч нэг асуултанд 5 аас олон удаа алдсан тохиолдолд улаан карт руу асуулт нэмэгдэнэ.",
  ];

  // Function to handle navigation to different flashcard pages
  void _navigateToFlashCard(BuildContext context, String color) {
    if (color == 'Yellow') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => YellowFlashCard()),  // Navigate to Yellow FlashCard page
      );
    } else if (color == 'Orange') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => OrangeFlashCard()),  // Navigate to Orange FlashCard page
      );
    } else if (color == 'Red') {
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => RedFlashCard()),  // Navigate to Red FlashCard page
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: List.generate(3, (index) {
          // Set different colors for each button
          Color buttonColor = index == 0
              ? Colors.yellow
              : index == 1
                  ? Colors.orange
                  : Colors.red;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              children: [
                ElevatedButton(
                  onPressed: () => _navigateToFlashCard(context, buttonTitles[index].split(' ')[2]), // Split the title to extract the color
                  style: ElevatedButton.styleFrom(
                    backgroundColor: buttonColor,  // Set the button's background color
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15),
                    ),
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    elevation: 5,
                  ),
                  child: Stack(
                    children: [
                      // Background image
                      Positioned.fill(
                        child: Image.asset(
                          'assets/1111.jpg', // Ensure this image path is correct
                          fit: BoxFit.cover,
                          color: Colors.black.withOpacity(0.3), // Apply a dark overlay to the image for text contrast
                          colorBlendMode: BlendMode.darken,
                        ),
                      ),
                      // Title on top of the image
                      Center(
                        child: Text(
                          buttonTitles[index],
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Colors.white,  // Make the text color white for contrast
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ],
                  ),
                ),
                // Description text below the button
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    flashCardDescriptions[index],
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.black.withOpacity(0.7),
                      fontWeight: FontWeight.bold,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
