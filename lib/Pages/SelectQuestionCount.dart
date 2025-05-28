import 'package:flutter/material.dart';

class DynamicQuestionSelectDialog extends StatefulWidget {
  final int totalQuestions;

  const DynamicQuestionSelectDialog({
    Key? key,
    required this.totalQuestions,
  }) : super(key: key);

  @override
  State<DynamicQuestionSelectDialog> createState() =>
      _DynamicQuestionSelectDialogState();
}

class _DynamicQuestionSelectDialogState
    extends State<DynamicQuestionSelectDialog> {
  List<Map<String, int>> ranges = [];
  List<Map<String, int>> selectedRanges = [];

  @override
  void initState() {
    super.initState();

    // ✅ If 10 or fewer questions, only show "All Questions"
    if (widget.totalQuestions <= 10) {
      ranges = [
        {'start': 1, 'end': widget.totalQuestions}
      ];
    } else {
      ranges = generateRanges();

      // 🟢 Add "All" as the first range
      ranges.insert(0, {'start': 1, 'end': widget.totalQuestions});
    }
  }

  List<Map<String, int>> generateRanges() {
  List<Map<String, int>> result = [];
  int step = widget.totalQuestions <= 40 ? 10 : 20;
  int currentStart = 1;

  while (currentStart <= widget.totalQuestions) {
    int end = currentStart + step - 1;
    if (end > widget.totalQuestions) end = widget.totalQuestions;

    // ❌ Хэрвээ ганцхан асуулт үлдэж байвал (all багц байхад хэрэггүй)
    if (widget.totalQuestions > 10 && end == widget.totalQuestions && end == currentStart) {
      break;
    }

    result.add({'start': currentStart, 'end': end});
    currentStart = end + 1;
  }

  return result;
}


  bool isSelected(Map<String, int> range) {
    return selectedRanges.any((r) =>
        r['start'] == range['start'] && r['end'] == range['end']);
  }

  void toggleRange(Map<String, int> range) {
    setState(() {
      if (isSelected(range)) {
        selectedRanges.removeWhere((r) =>
            r['start'] == range['start'] && r['end'] == range['end']);
      } else {
        // If "All Questions" is selected, clear others
        if (range['start'] == 1 && range['end'] == widget.totalQuestions) {
          selectedRanges = [range];
        } else {
          // Remove "All Questions" if selecting others
          selectedRanges.removeWhere((r) =>
              r['start'] == 1 && r['end'] == widget.totalQuestions);
          selectedRanges.add(range);
        }
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            const Text(
              'Асуултын багц сонгох',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Wrap(
              spacing: 8,
              runSpacing: 8,
              children: ranges.map((range) {
                final selected = isSelected(range);
                final isAll = range['start'] == 1 &&
                    range['end'] == widget.totalQuestions;

                return GestureDetector(
                  onTap: () => toggleRange(range),
                  child: Container(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 16, vertical: 10),
                    decoration: BoxDecoration(
                      color: selected ? Colors.blue[100] : Colors.grey.shade100,
                      border: Border.all(
                          color: selected ? Colors.blue : Colors.grey),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      isAll
                          ? 'Бүх асуулт'
                          : '${range['start']} - ${range['end']}',
                      style: TextStyle(
                        fontWeight: FontWeight.w500,
                        color: selected ? Colors.blue[900] : Colors.grey[800],
                      ),
                    ),
                  ),
                );
              }).toList(),
            ),
            const SizedBox(height: 20),
            ElevatedButton.icon(
              icon: const Icon(Icons.play_arrow),
              label: const Text("Эхлүүлэх"),
              onPressed: () {
                if (selectedRanges.isEmpty) {
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text('Та багц сонгоно уу!'),
                  ));
                  return;
                }

                final start = selectedRanges.first['start']!;
                final end = selectedRanges.last['end']!;
                Navigator.pop(context, {'start': start, 'end': end});
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue,
                foregroundColor: Colors.white,
                padding:
                    const EdgeInsets.symmetric(vertical: 12, horizontal: 24),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
