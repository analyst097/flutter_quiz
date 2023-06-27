import 'package:flutter/material.dart';

import 'models/quiz.model.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  List<QnA> questions = [
    QnA(question: "What is Flutter?", options: ["Language", "Tool", "Framework", "None"], answer: ""),
    QnA(question: "What is Dart?", options: ["Language", "Tool", "Framework", "None"], answer: ""),
    QnA(question: "What is basic build block in Flutter?", options: ["Document", "Widget", "Function", "Object"], answer: ""),
    QnA(question: "What is Flutter is supported for which of the below platforms?", options: ["Android", "iOS", "Windows", "All"], answer: ""),
  ];

  int activeQuestionIndex = 0;

  nextQuestion() {
    setState(() {
      activeQuestionIndex = questions.length > activeQuestionIndex + 1 ? activeQuestionIndex + 1: activeQuestionIndex;
    });
  }

  optionList(){
    return questions[activeQuestionIndex].options.map((e) => Text(e));
  }

  @override
  Widget build(BuildContext context) {
    activeQuestionIndex = 0;

    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(questions[activeQuestionIndex].question, style: const TextStyle(fontSize: 20, color: Colors.white),),
        const SizedBox(height: 40,),
        ...optionList(),
        const SizedBox(height: 80,),
        ElevatedButton.icon(
            onPressed: nextQuestion,
            style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white
            ),
            icon: const Icon(Icons.arrow_right_alt),
            label: const Text("Next", style: TextStyle(fontSize: 15),)
        ),
      ],
    );
  }
}
