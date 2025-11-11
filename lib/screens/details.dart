import 'package:flutter/material.dart';
import '../models/exam.dart';

class ExamDetailScreen extends StatelessWidget {
  final Exam exam;

  const ExamDetailScreen({Key? key, required this.exam}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final now = DateTime.now();
    final difference = exam.dateTime.difference(now).inDays;
    final isPast = exam.dateTime.isBefore(now);

    return Scaffold(
      appBar: AppBar(
        title: Text(exam.name),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              exam.name,
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.calendar_today, size: 18),
                const SizedBox(width: 8),
                Text(
                  "${exam.dateTime.day}.${exam.dateTime.month}.${exam.dateTime.year} "
                      "${exam.dateTime.hour}:${exam.dateTime.minute.toString().padLeft(2, '0')}",
                  style: const TextStyle(fontSize: 16),
                ),
              ],
            ),
            const SizedBox(height: 12),
            Row(
              children: [
                const Icon(Icons.room, size: 18),
                const SizedBox(width: 8),
                Text(exam.rooms.join(", "), style: const TextStyle(fontSize: 16)),
              ],
            ),
            const SizedBox(height: 20),
            Center(
              child: Text(
                isPast
                    ? "Испитот е завршен "
                    : "Остануваат $difference дена до испитот ",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                  color: isPast ? Colors.redAccent : Colors.green[700],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
