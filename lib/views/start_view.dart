import 'package:flutter/material.dart';
import 'package:quiz_app/widgets/coustom_text.dart';

class StartView extends StatelessWidget {
  const StartView(this.startquiz, {super.key});
  final void Function() startquiz;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Image(
          image: AssetImage('assets/images/quiz-logo.png'),
          width: 300,
          color: Color.fromARGB(150, 255, 255, 255),
        ),
        const SizedBox(
          height: 80,
        ),
        const CoustomText(
          text: 'Learn Flutter in the fun way!',
          color: Colors.white,
          fSize: 24,
        ),
        const SizedBox(
          height: 30,
        ),
        OutlinedButton.icon(
          icon: const Icon(Icons.arrow_right_alt),
          onPressed: startquiz,
          style: OutlinedButton.styleFrom(
            foregroundColor: Colors.white,
            fixedSize: const Size(200, 50),
          ),
          label: const CoustomText(
              text: 'Start Quiz', color: Colors.white, fSize: 20),
        )
      ],
    );
  }
}
