import 'package:flutter/material.dart';
import '../models/exam.dart';
import '../widgets/exam_card.dart';
import 'details.dart';

List<Exam> exams = [
  Exam(name: "Мобилни информациски системи", dateTime: DateTime(2025, 11, 01, 10, 0), rooms: ["215"]),
  Exam(name: "Вовед во науката за податоци", dateTime: DateTime(2025, 11, 02, 14, 0), rooms: ["138","215","117"]),
  Exam(name: "Дискретна математика", dateTime: DateTime(2025, 11, 03, 14, 0), rooms: ["138","215","117"]),
  Exam(name: "Структурно програмирање", dateTime: DateTime(2025, 11, 04, 11, 0), rooms: ["138","215","117"]),
  Exam(name: "Напредно програмирање", dateTime: DateTime(2025, 12, 20, 20, 0), rooms: ["138","215","117"]),
  Exam(name: "Дизајн  на образовен софтвер", dateTime: DateTime(2025, 12, 16, 14, 0), rooms: ["138","215","117"]),
  Exam(name: "Бази на податоци", dateTime: DateTime(2025, 12, 13, 08, 0), rooms: ["138","215","117"]),
  Exam(name: "Веб програмирање", dateTime: DateTime(2025, 12, 16, 14, 0), rooms: ["138","215","117"]),
  Exam(name: "Напреден Веб Дизајн", dateTime: DateTime(2025, 12, 16, 14, 0), rooms: ["138","215","117"]),
  Exam(name: "Менаџмент информациски системи", dateTime: DateTime(2025, 12, 16, 14, 0), rooms: ["138","215","117"]),
];

class HomeScreen extends StatelessWidget {
  final String indexNumber = "223011";

  @override
  Widget build(BuildContext context) {
    exams.sort((a, b) => a.dateTime.compareTo(b.dateTime));

    return Scaffold(
      appBar: AppBar(
        title: Text("Распоред за испити - $indexNumber"),
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8),
        itemCount: exams.length + 1,
        itemBuilder: (context, index) {
          if (index < exams.length) {
            return ExamCard(
              exam: exams[index],
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ExamDetailScreen(exam: exams[index]),
                  ),
                );
              },
            );
          } else {
            return Padding(
              padding: const EdgeInsets.symmetric(vertical: 12),
              child: Center(
                child: Chip(
                  label: Text("Вкупно испити: ${exams.length}"),
                ),
              ),
            );
          }
        },
      ),
    );
  }
}
