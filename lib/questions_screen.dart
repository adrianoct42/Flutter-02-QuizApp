import 'package:flutter/material.dart';
import 'package:quiz_app/answer_button.dart';
import 'package:quiz_app/data/questions.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsScreen extends StatefulWidget {
  const QuestionsScreen(this.onSelectAnswer, {super.key});

  final void Function(String answer) onSelectAnswer;

  @override
  State<QuestionsScreen> createState() => _QuestionsScreenState();
}

class _QuestionsScreenState extends State<QuestionsScreen> {
  var currentQuestionsIndex = 0;

  void answerQuestion(String selectedAnswer) {
    // Usamos o termo widget."algumaCoisa" para usarmos algo
    // que foi recebido de parâmetro na classe acima!
    widget.onSelectAnswer(selectedAnswer);
    setState(() {
      currentQuestionsIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentQuestion = questions[currentQuestionsIndex];

    return SizedBox(
      width: double.infinity, // Use o MÁXIMO DE WIDTH possível!
      child: Container(
        margin: const EdgeInsets.all(20),
        child: Column(
          // Deixa os elementos da Column todos alinhados VERTICALMENTE.
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              currentQuestion.text,
              style: GoogleFonts.lato(
                color: Colors.yellow,
                fontSize: 24,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 30,
            ),
            // ------------------------------------------------------
            // Children não aceita receber uma LISTA INTEIRA.
            // Então precisamos enviar INDIVIDUALMENTE OS ELEMENTOS DA LISTA
            // Para sua renderização. Conseguimos fazer isso
            // Com a ajuda do operador "...", ou spreading operator.
            ...currentQuestion.getShuffledAnswers().map(
              (item) {
                return AnswerButton(
                  item,
                  () {
                    answerQuestion(item);
                  },
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
