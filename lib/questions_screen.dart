import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class Questionscreen extends StatefulWidget {
  const Questionscreen({
    super.key,
    required this.onSelectAnswer,
  });

  final void Function(String answer) onSelectAnswer;

  @override
  State<Questionscreen> createState() {
    return _QuestionsScreenState();
  }

  @override
  Widget build(context) {
    return const MaterialApp(
      home: Scaffold(
        body: Text('test text'),
      ),
    );
  }
}

class _QuestionsScreenState extends State<Questionscreen> {
  var currentQuestionIndex = 0;

  void answerQuestion(answer) {
    widget.onSelectAnswer(answer);
    setState(() {
      currentQuestionIndex += 1;
    });
  }

  @override
  Widget build(context) {
    final currentQuestion = questions[currentQuestionIndex];

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
                  currentQuestion.text,
                  textAlign: TextAlign.center,
                  style: GoogleFonts.firaSans(
                    color: const Color.fromARGB(255, 224, 195, 228),
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(height: 35),
                ...currentQuestion.getShuffledAnswers().map((answer) {
                  return AnswerButton(
                    answer,
                    () {
                      answerQuestion(answer);
                    },
                  );
                })
              ]),
        ));
  }
}
