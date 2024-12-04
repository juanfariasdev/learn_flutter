import 'package:flutter/material.dart';
import 'package:learn_flutter/models/question_model.dart';
import 'package:learn_flutter/pages/challenge/widgets/question_indicator_widget.dart';
import 'package:learn_flutter/pages/challenge/widgets/question_wigdet.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;

  const ChallengePage({super.key, required this.questions});

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  int currentQuestionIndex = 0; // Índice da questão atual

  void _nextQuestion() {
    if (currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        currentQuestionIndex++; // Avança para a próxima questão
      });
    } else {
      // Lógica para finalizar o desafio
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Você concluiu todas as perguntas!")),
      );
    }
  }

  void _skipQuestion() {
    // Pular a questão sem confirmar a resposta
    _nextQuestion();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(60),
        child: SafeArea(
          child: QuestionIndicatorWidget(
            currentIndex: currentQuestionIndex + 1,
            totalQuestions: widget.questions.length,
          ),
        ),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            QuestionWidget(
              question: widget.questions[currentQuestionIndex],
              onConfirm: _nextQuestion, // Avança ao confirmar
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: _skipQuestion,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.grey,
                      ),
                      child: Text("Pular"),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        // Chama a função de confirmar (só para referência)
                        _nextQuestion();
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.green,
                      ),
                      child: Text("Confirmar"),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
