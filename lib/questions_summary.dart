import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary({super.key, required this.summaryData});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        height: 400,
        child: SingleChildScrollView(
          child: Column(
            children: summaryData.map((s) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topCenter,
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(width: 0),
                      shape: BoxShape.circle,
                      color: s['is_correct'] as bool
                          ? const Color.fromARGB(255, 48, 167, 97)
                          : const Color.fromARGB(255, 180, 43, 43),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          ((s['question_index'] as int) + 1).toString(),
                          style: GoogleFonts.firaSans(
                            color: const Color.fromARGB(255, 224, 195, 228),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(s['question'] as String,
                            style: GoogleFonts.firaSans(
                              color: const Color.fromARGB(255, 224, 195, 228),
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(s['chosen_answer'] as String,
                            style: GoogleFonts.firaSans(
                              color: Color.fromARGB(255, 179, 171, 180),
                            )),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(s['correct_answer'] as String,
                            style: GoogleFonts.firaSans(
                              color: s['is_correct'] as bool
                                  ? const Color.fromARGB(255, 48, 167, 97)
                                  : const Color.fromARGB(255, 180, 43, 43),
                            )),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            }).toList(),
          ),
        ));
  }
}
