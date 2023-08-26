import 'package:flutter/material.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:quiz_app/splash_screen.dart';
import 'package:quiz_app/questions_screen.dart';
import 'package:quiz_app/results_screen.dart';

class Quiz extends StatefulWidget {
  const Quiz({super.key});

  @override
  State<Quiz> createState() {
    return _QuizState();
  }
}

class _QuizState extends State<Quiz> {
  List<String> selectedAnswers = [];
  var activeScreen = 'splash-screen';

  void switchScreen() {
    setState(() {
      activeScreen = 'quiz-screen';
    });
  }

  void chooseAnswer(String answer) {
    selectedAnswers.add(answer);

    if (selectedAnswers.length == questions.length) {
      setState(() {
        activeScreen = 'result-screen';
        //selectedAnswers.clear();
      });
    }
  }

  void restartQuiz() {
    setState(() {
      activeScreen = 'quiz-screen';
      selectedAnswers.clear();
    });
  }

  @override
  Widget build(context) {
    var screenWidget = activeScreen == 'splash-screen'
        ? SplashScreenContainer(switchScreen)
        : activeScreen == 'result-screen'
            ? ResultsScreen(
                chosenAnswers: selectedAnswers, restartQuiz: restartQuiz)
            : Questionscreen(
                onSelectAnswer: chooseAnswer,
              );

    return MaterialApp(
      home: Scaffold(
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Color.fromARGB(255, 110, 4, 136),
                Color.fromARGB(255, 86, 3, 107)
              ],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: screenWidget,
        ),
      ),
    );
  }
}
