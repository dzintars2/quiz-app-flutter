import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashScreenContainer extends StatelessWidget {
  const SplashScreenContainer(this.startQuiz, {super.key});

  final void Function() startQuiz;

  @override
  Widget build(context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 250,
            color: const Color.fromARGB(
                150, 255, 255, 255), //makes image transparent
          ),
          const SizedBox(height: 60),
          Text(
            'Learn Flutter the fun way!',
            style: GoogleFonts.firaSans(
              color: const Color.fromARGB(255, 224, 195, 228),
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          const SizedBox(height: 60),
          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(
                foregroundColor: const Color.fromARGB(255, 224, 195, 228)),
            icon: const Icon(Icons.arrow_right_alt),
            label: Text(
              'Start Quiz',
              style: GoogleFonts.firaSans(
                color: const Color.fromARGB(255, 224, 195, 228),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
