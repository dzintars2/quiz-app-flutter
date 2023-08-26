import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/questions_summary.dart';
import 'package:google_fonts/google_fonts.dart';

class ResultsScreen extends StatelessWidget {
  const ResultsScreen(
      {super.key, required this.chosenAnswers, required this.restartQuiz});

  final List<String> chosenAnswers;
  final void Function() restartQuiz;

  List<Map<String, Object>> getSummaryData() {
    final List<Map<String, Object>> summary = [];
    for (var i = 0; i < chosenAnswers.length; i++) {
      summary.add({
        'question_index': i,
        'question': questions[i].text,
        'correct_answer': questions[i].answers[0],
        'chosen_answer': chosenAnswers[i],
        'is_correct': questions[i].answers[0] == chosenAnswers[i]
      });
    }
    return summary;
  }

  @override
  Widget build(BuildContext context) {
    final summaryData = getSummaryData();
    final numTotalQuestions = questions.length;
    final numCorrectQuestions = summaryData.where((s) {
      return s['is_correct'] as bool;
    }).length;

    final message = numCorrectQuestions == numTotalQuestions
        ? 'Congratulations, you answered everything correctly!'
        : 'Correct answers $numCorrectQuestions from $numTotalQuestions';

    return SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: Container(
          margin: const EdgeInsets.all(40),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                message,
                textAlign: TextAlign.center,
                style: GoogleFonts.firaSans(
                  color: const Color.fromARGB(255, 224, 195, 228),
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30),
              QuestionsSummary(
                summaryData: summaryData,
              ),
              const SizedBox(height: 30),
              OutlinedButton.icon(
                onPressed: restartQuiz,
                style: OutlinedButton.styleFrom(
                    foregroundColor: const Color.fromARGB(255, 224, 195, 228)),
                icon: const Icon(Icons.refresh),
                label: Text(
                  'Restart Quiz',
                  style: GoogleFonts.firaSans(
                    color: const Color.fromARGB(255, 224, 195, 228),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
