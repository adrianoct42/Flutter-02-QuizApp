import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class QuestionsSummary extends StatelessWidget {
  const QuestionsSummary(this.summaryData, {super.key});

  final List<Map<String, Object>> summaryData;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 400,
      // SingleChildScrollView faz com que, caso o elemento passe de certo tamanho
      // ele então seja scrollable.
      child: SingleChildScrollView(
        child: Column(
          children: summaryData.map(
            (data) {
              return Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  // A keyword "as" faz uma conversão de dados, inicialmente o convertemos para
                  // int para que possa ser feito a SOMA.
                  // Mas depois retornamos tudo para String, pois o objeto Map criado acima
                  // Só aceita uma lita de chave-valor onde a chave é STRING.
                  Padding(
                    padding: const EdgeInsets.only(right: 30, bottom: 30),
                    child: Container(
                      width: 38,
                      height: 38,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          border: Border.all(width: 2),
                          shape: BoxShape.circle,
                          color: data['correct_answer'] == data['user_answer']
                              ? Colors.blue
                              : Colors.red),
                      child: Text(
                        ((data['question_index'] as int) + 1).toString(),
                        style: GoogleFonts.lato(
                          color: Colors.black,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  // Expanded() é um widget para limitar o tamanho de algum widget.
                  // Abaixo, expanded não permitirá que COLUMN abaixo seja extrapolado pelo
                  // que foi determinado pelo widget pai acima, no caso o Row().
                  Expanded(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          data['question'] as String,
                          style: GoogleFonts.lato(
                            color: Colors.white,
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          data['user_answer'] as String,
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 217, 0, 255),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          data['correct_answer'] as String,
                          style: GoogleFonts.lato(
                            color: const Color.fromARGB(255, 0, 255, 85),
                            fontSize: 14,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        const SizedBox(
                          height: 35,
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          ).toList(),
        ),
      ),
    );
  }
}
