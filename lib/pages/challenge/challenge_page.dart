import 'package:flutter/material.dart';
import 'package:learn_flutter/core/app_routes.dart';
import 'package:learn_flutter/models/awnser_model.dart';
import 'package:learn_flutter/models/question_model.dart';
import 'package:learn_flutter/pages/challenge/widgets/question_indicator_widget.dart';
import 'package:learn_flutter/pages/challenge/widgets/question_wigdet.dart';
import 'package:learn_flutter/pages/widgets/next_button_widget.dart';

class ChallengePage extends StatefulWidget {
  final List<QuestionModel> questions;
  List<AnswerModel?>? answers; // Lista de respostas
  int currentQuestionIndex;

  ChallengePage({
    super.key,
    required this.questions,
    this.answers,
    this.currentQuestionIndex = 0,
  });

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  AnswerModel? selectedAnswer; // Resposta selecionada

  void _selectAnswer(AnswerModel answer) {
    setState(() {
      selectedAnswer = answer; // Atualiza a resposta selecionada
      widget.answers?[widget.currentQuestionIndex] =
          answer; // Atualiza a resposta na lista de respostas
    });
  }

  void _nextQuestion() {
    if (widget.currentQuestionIndex < widget.questions.length - 1) {
      setState(() {
        widget.currentQuestionIndex++;
        selectedAnswer = widget.answers?[widget.currentQuestionIndex];
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Você concluiu todas as perguntas!")),
      );
    }
  }

  void _previousQuestion() {
    if (widget.currentQuestionIndex > 0) {
      setState(() {
        widget.currentQuestionIndex--;
        selectedAnswer = widget.answers?[widget.currentQuestionIndex];
      });
    } else {
      // Notifica o usuário se já está na primeira questão
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Você já está na primeira pergunta!")),
      );
    }
  }

  // Função para ir para a tela de confirmação
  void _goToConfirmationPage() {
    Navigator.pushNamed(
      context,
      AppRoutes.confirmation,
      arguments: {
        'questions': widget.questions,
        'answers': widget.answers,
      },
    );
  }

  @override
  void initState() {
    super.initState();
    // Inicializa a lista de respostas com null
    widget.answers ??= List.filled(widget.questions.length, null);
    selectedAnswer = widget.answers?[widget.currentQuestionIndex];
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        // Se não for a primeira pergunta, volte para a questão anterior
        if (widget.currentQuestionIndex > 0) {
          _previousQuestion();
          return false; // Impede que a página seja fechada
        }
        return true; // Permite sair da página se estiver na primeira questão
      },
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SafeArea(
            child: QuestionIndicatorWidget(
              currentIndex: widget.currentQuestionIndex + 1,
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
                question: widget.questions[widget.currentQuestionIndex],
                onAnswerSelected: _selectAnswer,
                selectedAnswer: selectedAnswer,
                isConfirmed:
                    false, // Não estamos usando confirmação por enquanto
              ),
              SizedBox(height: 20),
              Row(
                children: [
                  // Botão Voltar (Desabilitado se for a primeira questão)
                  Expanded(
                    child: NextButtonWidget.white(
                      label: "Voltar",
                      onTap: _previousQuestion,
                      isDisabled: widget.currentQuestionIndex == 0,
                    ),
                  ),
                  SizedBox(width: 10),
                  // Botão de Pular / Próximo ou Confirmar
                  Expanded(
                    child: selectedAnswer == null &&
                            (widget.currentQuestionIndex <
                                widget.questions.length - 1)
                        ? NextButtonWidget.white(
                            label: "Pular",
                            onTap: _nextQuestion,
                          )
                        : NextButtonWidget.green(
                            label: (widget.currentQuestionIndex <
                                    widget.questions.length - 1)
                                ? "Próximo"
                                : "Confirmar",
                            onTap: (widget.currentQuestionIndex <
                                    widget.questions.length - 1)
                                ? _nextQuestion
                                : _goToConfirmationPage,
                          ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              // Botão Confirmar, mostrado apenas quando todas as perguntas forem respondidas
            ],
          ),
        ),
      ),
    );
  }
}
