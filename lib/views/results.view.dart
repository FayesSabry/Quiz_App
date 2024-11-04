import 'package:flutter/material.dart';
import 'package:quiz_app/data/question.dart';
import 'package:quiz_app/question_summery/question_summery.dart';
import 'package:quiz_app/widgets/coustom_text.dart';
import 'package:quiz_app/widgets/quiz.dart';

class ResultsView extends StatelessWidget {
  const ResultsView({super.key, required this.chosenAnswers});
  final List<String> chosenAnswers;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (int i = 0; i < chosenAnswers.length; i++) {
      summary.add(
        {
          'question_index': i,
          'question': questions[i].text,
          'correct_answer': questions[i].answers[0],
          'user_answer': chosenAnswers[i],
        },
      );
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCourrectQuestion = summaryData.where((data) {
      return data['user_answer'] == data['correct_answer'];
    }).length;
    return SizedBox(
      width: double.infinity,
      child: Container(
        margin: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            CoustomText(
              text:
                  'You answered $numCourrectQuestion out of $numTotalQuestions questions correctly!',
              color: Colors.white,
              fSize: 20,
            ),
            const SizedBox(
              height: 30,
            ),
            QuestionsSummary(summaryData),
            // QuestionSummery(summaryData: summaryData),
            const SizedBox(
              height: 30,
            ),
            OutlinedButton.icon(
              icon: const Icon(Icons.refresh),
              onPressed: () {
                Navigator.push(context, MaterialPageRoute(builder: (contxt) {
                  return const Quiz();
                }));
              },
              style: OutlinedButton.styleFrom(
                foregroundColor: Colors.white,
                fixedSize: const Size(300, 50),
              ),
              label: const CoustomText(
                text: 'Restart the quiz',
                color: Colors.white,
                fSize: 25,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
