import 'package:flutter/material.dart';
import 'package:learn_flutter/models/awnser_model.dart';
import 'package:learn_flutter/models/question_model.dart';
import 'package:learn_flutter/pages/challenge/widgets/question_indicator_widget.dart';
import 'package:learn_flutter/pages/challenge/widgets/question_wigdet.dart';
import 'package:learn_flutter/pages/widgets/next_button_widget.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;

  const ChallengePage({super.key, required this.questions});

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  int currentQuestionIndex = 0;
  AnswerModel? selectedAnswer; // Resposta selecionada

  void _selectAnswer(AnswerModel? answer) {
    setState(() {
      selectedAnswer = answer; // Atualiza a resposta selecionada
    });
  }

  void _nextQuestion() {
    if (currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        currentQuestionIndex++;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Você concluiu todas as perguntas!")),
      );
    }
  }

  void _previousQuestion() {
    if (currentQuestionIndex > 0) {
      setState(() {
        currentQuestionIndex--;
      });
    }
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
              onAnswerSelected: _selectAnswer,
              selectedAnswer: selectedAnswer,
              isConfirmed: false, // Não estamos usando confirmação por enquanto
            ),
            SizedBox(height: 20),
            Row(
              children: [
                // Botão Voltar (Desabilitado se for a primeira questão)
                Expanded(
                  child: NextButtonWidget.white(
                    label: "Voltar",
                    onTap: _previousQuestion,
                    isDisabled: currentQuestionIndex == 0,
                  ),
                ),
                SizedBox(width: 10),
                // Botão de Pular / Próximo
                Expanded(
                  child: selectedAnswer == null
                      ? NextButtonWidget.white(
                          label: "Pular",
                          onTap: _nextQuestion,
                        )
                      : NextButtonWidget.green(
                          label: "Próximo",
                          onTap: _nextQuestion,
                        ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
