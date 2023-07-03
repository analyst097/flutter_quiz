import 'package:dice/summary.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'models/quiz.model.dart';

class QuestionScreen extends StatefulWidget {
  const QuestionScreen({super.key});

  @override
  State<QuestionScreen> createState() => _QuestionScreenState();
}

class _QuestionScreenState extends State<QuestionScreen> {

  List<Question> questions = [
    Question(question: "What is Flutter?", options: ["Language", "Tool", "Framework", "None"], answer: ""),
    Question(question: "What is Dart?", options: ["Language", "Tool", "Framework", "None"], answer: ""),
    Question(question: "What is basic build block in Flutter?", options: ["Document", "Widget", "Function", "Object"], answer: ""),
    Question(question: "Flutter is supported for which of the below platforms?", options: ["Android", "iOS", "Windows", "All"], answer: ""),
  ];
  int activeQuestionIndex = 0;
  bool showSummaryScreen = false;

  nextQuestion() {
    setState(() {
      activeQuestionIndex = questions.length > activeQuestionIndex + 1 ? activeQuestionIndex + 1: activeQuestionIndex;
    });
  }

  prevQuestion() {
    setState(() {
      activeQuestionIndex = activeQuestionIndex > 0 ? activeQuestionIndex - 1: activeQuestionIndex;
    });
  }

  finishQuiz(){
    setState(() {
      showSummaryScreen = true;
    });
  }

  restartQuiz(){
    setState(() {
      activeQuestionIndex = 0;
      showSummaryScreen = false;
      questions = [
        Question(question: "What is Flutter?", options: ["Language", "Tool", "Framework", "None"], answer: ""),
        Question(question: "What is Dart?", options: ["Language", "Tool", "Framework", "None"], answer: ""),
        Question(question: "What is basic build block in Flutter?", options: ["Document", "Widget", "Function", "Object"], answer: ""),
        Question(question: "Flutter is supported for which of the below platforms?", options: ["Android", "iOS", "Windows", "All"], answer: ""),
      ];
    });
  }

  chooseAnswer(String opt){
    questions[activeQuestionIndex].answer = opt;
    nextQuestion();
  }

  optionList(){
    return questions[activeQuestionIndex].options.map((e) => AnswerButton(answer: e, onClick: () { chooseAnswer(e); },));
  }

  @override
  Widget build(BuildContext context) {
    if(showSummaryScreen){
      return SummaryScreen(questions: questions, restartQuiz: restartQuiz,);
    }
    return Container(
      margin: const EdgeInsets.all(25),
      child: Column(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            questions[activeQuestionIndex].question,
            style: GoogleFonts.lato(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold
            ),
          ),
          const SizedBox(height: 40,),
          ...optionList(),
          const SizedBox(height: 80,),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Visibility(
                visible: activeQuestionIndex > 0,
                child: OutlinedButton(
                    onPressed: prevQuestion,
                    style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white
                    ),
                    child: const Row(
                      children: [
                        Icon(Icons.keyboard_arrow_left),
                        Text("Prev", style: TextStyle(fontSize: 15),),
                      ],
                    )
                ),
              ),
              Visibility(
                child: OutlinedButton(
                    onPressed: () {
                      if(activeQuestionIndex < questions.length - 1){
                        nextQuestion();
                      } else {
                        finishQuiz();
                      }
                    },
                    style: OutlinedButton.styleFrom(
                        foregroundColor: Colors.white
                    ),
                    child: Row(
                      children: [
                        (activeQuestionIndex < questions.length - 1 ?
                        const Text("Next", style: TextStyle(fontSize: 15),) :
                        const Text("Finish", style: TextStyle(fontSize: 15))),
                        (activeQuestionIndex < questions.length - 1 ?
                        const Icon(Icons.keyboard_arrow_right) :
                        const Icon(Icons.done))
                      ],
                    )
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

