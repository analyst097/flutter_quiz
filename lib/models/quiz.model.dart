import 'package:flutter/material.dart';

class Question{
  Question({required this.question, required this.options, this.answer = ""});

  String question;
  List<String> options;
  String answer;
}

class AnswerButton extends StatelessWidget {
  const AnswerButton({required this.answer, required this.onClick, super.key});

  final String answer;
  final void Function() onClick;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: ElevatedButton(
          onPressed: onClick,
          style: ElevatedButton.styleFrom(
            padding: const EdgeInsets.symmetric(
              vertical: 10,
              horizontal: 40
            ),
            backgroundColor: const Color.fromARGB(95, 21, 101, 192),
            foregroundColor: Colors.white,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(40),
            )
          ),
          child: Text(answer),
      ),
    );
  }
}
