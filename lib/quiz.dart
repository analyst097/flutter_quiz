import 'dart:core';

import 'package:dice/question.dart';
import 'package:flutter/material.dart';


class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State<QuizApp> createState() => _QuizAppState();
}

class _QuizAppState extends State<QuizApp> {

  Widget? activeScreen;

  @override
  void initState() {
    activeScreen = StartScreen(switchScreen);
    super.initState();
  }

  void switchScreen(Widget screen){
    setState(() {
      activeScreen = screen;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [
                    Colors.blue.shade800,
                    Colors.blue.shade600,
                  ],
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight
              )
          ),
          child: Center(child: activeScreen),
        ),
      ),
    );
  }
}


class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz ,{super.key});

  final Function startQuiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset('assets/images/quiz-logo.png', height: 250,),
        const SizedBox(height: 80,),
        const Text("Learn Flutter the fun way!", style: TextStyle(fontSize: 20, color: Colors.white),),
        const SizedBox(height: 30,),
        OutlinedButton.icon(
            onPressed: () { startQuiz(const QuestionScreen()); },
            style: OutlinedButton.styleFrom(
              foregroundColor: Colors.white
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text("Start Quiz", style: TextStyle(fontSize: 15),)
        ),
      ],
    );
  }
}
