import 'package:flutter/material.dart';

class StartScreen extends StatelessWidget {
  const StartScreen(this.startQuiz, {super.key});

  // Para usarmos um parâmetro recebido de outra função, precisamos
  // Declará-lo acima com o this, o nome pode ser a seu critério.
  // E abaixo devemos declarar O QUE É ESSE ARGUMENTO RECEBIDO.
  // No caso, é uma final void Function()
  final void Function() startQuiz;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Image.asset(
            'assets/images/quiz-logo.png',
            width: 300,
            // O primeiro valor do fromARGB() é a TRANSPARÊNCIA.
            color: const Color.fromARGB(125, 255, 255, 255),
          ),
          const SizedBox(height: 80), // Serve puramente como um PADDING.
          const Text(
            'Learn Flutter the fun way! :)',
            style: TextStyle(color: Colors.white, fontSize: 24),
          ),
          const SizedBox(height: 80), // Novamente, PADDING.
          OutlinedButton.icon(
            onPressed: () {
              startQuiz();
            },
            style: OutlinedButton.styleFrom(foregroundColor: Colors.white),
            label: const Text('Start Quiz'),
            icon: const Icon(Icons.arrow_right_alt),
          )
        ],
      ),
    );
  }
}
