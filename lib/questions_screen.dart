import 'package:flutter/material.dart';

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
    return const Center(
      child: Column(mainAxisSize: MainAxisSize.min, children: [
        Text('test'),
      ]),
    );
  }
}
