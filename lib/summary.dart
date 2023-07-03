import 'package:flutter/material.dart';

import 'models/quiz.model.dart';

class SummaryScreen extends StatelessWidget {
  SummaryScreen({required this.questions, required this.restartQuiz, super.key});

  List<Question> questions;
  final void Function() restartQuiz;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ...questions.map((e) => QuestionWithAnswer(e)),
          const SizedBox( height: 40),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                backgroundColor: Colors.blue.shade800
              ),
              onPressed: restartQuiz,
              child: const Text("Restart Quiz"),
            ),
          ),
        ],
      ),
    );
  }


}


class QuestionWithAnswer extends StatelessWidget {
  const QuestionWithAnswer(this.question, {super.key});

  final Question question;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(question.question, style: const TextStyle(fontSize: 20, color: Colors.white),),
          Text(question.answer,  style: const TextStyle(fontSize: 18, color: Colors.green),),
        ],
      ),
    );
  }
}

