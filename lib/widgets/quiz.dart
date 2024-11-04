import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/views/question_view.dart';
import 'package:quiz_app/views/results.view.dart';
import 'package:quiz_app/views/start_view.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() => _QuizState();
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeView = 'start-view';

  void switchView() {
    setState(() {
      activeView = 'question-view';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);
    if (selectedAnswers.length == questions.length) {
      setState(
        () {
          //selectedAnswers = [];
          activeView = 'results-view';
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    Widget viewWidget = StartView(switchView);
    if (activeView == 'question-view') {
      viewWidget = QuestionView(
        onSelectAnswers: chooseAnswer,
      );
    }
    if (activeView == 'results-view') {
      viewWidget = ResultsView(
        chosenAnswers: selectedAnswers,
      );
    }
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 78, 19, 151),
                Color.fromARGB(255, 107, 15, 168),
              ],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
          ),
          child: viewWidget,
        ),
      ),
    );
  }
}
