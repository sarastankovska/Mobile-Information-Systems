import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamCard extends StatelessWidget {
  final Exam exam;
  final VoidCallback onTap;

  const ExamCard({Key? key, required this.exam, required this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    bool isPast = exam.dateTime.isBefore(DateTime.now());

    return Card(
      color: isPast ? Colors.grey[300] : Colors.blue[100],
      child: ListTile(
        onTap: onTap,
        title: Text(
          exam.name,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: isPast ? Colors.black54 : Colors.black,
          ),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 4),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 16),
                const SizedBox(width: 4),
                Text(
                  "${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year} "
                      "${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')}",
                ),
              ],
            ),
            Row(
              children: [
                const Icon(Icons.room, size: 16),
                const SizedBox(width: 4),
                Text(exam.rooms.join(", ")),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
