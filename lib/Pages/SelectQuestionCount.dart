import 'package:flutter/material.dart';

class DynamicQuestionSelectDialog extends StatelessWidget {
  final int totalQuestions;

  const DynamicQuestionSelectDialog({Key? key, required this.totalQuestions}) : super(key: key);

  List<int> generateOptions() {
    int step = (totalQuestions / 4).floor();
    return [
      step,
      step * 2,
      step * 3,
      totalQuestions,
    ];
  }

  @override
  Widget build(BuildContext context) {
    final options = generateOptions();

    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'Сонгох асуултын тоо',
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 10),
            // Display options as buttons
            for (var count in options)
              Column(
                children: [
                  ElevatedButton(
                    onPressed: () => Navigator.pop(context, count), // Return selected count
                    style: ElevatedButton.styleFrom(
                      minimumSize: Size(double.infinity, 50),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                      backgroundColor: Colors.white,
                    ),
                    child: Text('$count асуулт'),
                  ),
                  SizedBox(height: 5),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
