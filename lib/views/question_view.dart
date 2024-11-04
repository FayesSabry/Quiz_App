import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:quiz_app/widgets/answer_button.dart';

import 'package:quiz_app/data/question.dart';

class QuestionView extends StatefulWidget {
  const QuestionView({super.key, required this.onSelectAnswers});
  final void Function(String answer) onSelectAnswers;

  @override
  State<QuestionView> createState() => _QuestionViewState();
}

class _QuestionViewState extends State<QuestionView> {
  var currentQuestionIndex = 0;
  void answerQuestion(String answer) {
    widget.onSelectAnswers(answer);
    setState(() {
      currentQuestionIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currebtQuestion = questions[currentQuestionIndex];
    return Container(
      margin: const EdgeInsets.all(40),
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currebtQuestion.text,
              style: GoogleFonts.lato(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            ...currebtQuestion.getShuffledAnswers().map(
              (answer) {
                return AnswerButton(
                  text: answer,
                  onTap: () {
                    answerQuestion(answer);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
