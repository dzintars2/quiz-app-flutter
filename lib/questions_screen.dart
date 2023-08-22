import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';

class Questionscreen extends StatefulWidget {
  const Questionscreen({super.key});

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
  @override
  Widget build(context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text(
              'The question...',
              style: TextStyle(
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 35),
            AnswerButton('Answer #1', () {}),
            AnswerButton('Answer #2', () {}),
            AnswerButton('Answer #3', () {}),
            AnswerButton('Answer #4', () {}),
          ]),
    );
  }
}
