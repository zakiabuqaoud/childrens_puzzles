import 'package:flutter/material.dart';
import 'package:multi_quiz_s_t_tt9/pages/home_page.dart';
import 'package:multi_quiz_s_t_tt9/pages/questions_page.dart';
import 'package:multi_quiz_s_t_tt9/pages/start_quiz.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        "/": (context)=> HomePage(),
        QuestionsPage.routeName: (context) => const QuestionsPage(),
        StartQuiz.routeName: (context) => const StartQuiz(),
      },
    );
  }
}
