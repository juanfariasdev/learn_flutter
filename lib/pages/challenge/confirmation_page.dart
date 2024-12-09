import 'package:flutter/material.dart';
import 'package:learn_flutter/core/app_routes.dart';
import 'package:learn_flutter/core/core.dart';
import 'package:learn_flutter/models/awnser_model.dart';
import 'package:learn_flutter/models/question_model.dart';
import 'package:learn_flutter/pages/challenge/widgets/awnser_widget.dart';
import 'package:learn_flutter/pages/widgets/next_button_widget.dart';

class ConfirmationPage extends StatefulWidget {
  final List<QuestionModel> questions;
  final List<AnswerModel?> answers;

  const ConfirmationPage({
    super.key,
    required this.questions,
    required this.answers,
  });

  @override
  _ConfirmationPageState createState() => _ConfirmationPageState();
}

class _ConfirmationPageState extends State<ConfirmationPage> {
  bool _isConfirmed = false;

  void _toggleConfirmation() {
    setState(() {
      _isConfirmed = !_isConfirmed;
    });
  }

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Confirmar Respostas", style: AppTextStyles.heading16),
          content: Text("Você deseja salvar suas respostas?",
              style: AppTextStyles.body),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Respostas salvas com sucesso!")),
                );
                _toggleConfirmation();
              },
              child: Text("Sim", style: AppTextStyles.bodyDarkGreen),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Não", style: AppTextStyles.bodyDarkRed),
            ),
          ],
        );
      },
    );
  }

  Color _getBackgroundColorAfterConfirmation(bool isCorrect, bool isSelected) {
    if (isSelected) {
      return isCorrect ? AppColors.lightGreen : AppColors.lightRed;
    }
    return AppColors.white;
  }

  Color _getBorderColorBeforeConfirmation(bool isAnswered) {
    return isAnswered ? AppColors.border : AppColors.red;
  }

  Color _getBorderColorAfterConfirmation(bool isCorrect, bool isSelected) {
    return isSelected && isCorrect ? AppColors.green : AppColors.red;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Suas Respostas", style: AppTextStyles.titleBold),
        backgroundColor: AppColors.primary,
        foregroundColor: AppColors.white,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(AppConfig.mobilePadding),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Confira suas respostas abaixo:",
                style: AppTextStyles.heading16),
            SizedBox(height: 10),
            ...widget.questions.asMap().entries.map((entry) {
              int index = entry.key;
              QuestionModel question = entry.value;
              AnswerModel? answer = widget.answers[index];
              bool isCorrect = answer?.isRight ?? false;
              bool isAnswered = answer != null;

              return Column(
                children: [
                  Card(
                    color: _isConfirmed
                        ? _getBackgroundColorAfterConfirmation(
                            isCorrect, answer == answer)
                        : AppColors.white,
                    elevation: 1,
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(7),
                        side: BorderSide(
                            color: _isConfirmed
                                ? _getBorderColorAfterConfirmation(
                                    isCorrect, answer == answer)
                                : _getBorderColorBeforeConfirmation(isAnswered),
                            width: 1)),
                    margin: EdgeInsets.only(bottom: 5),
                    child: ListTile(
                      contentPadding:
                          EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                      leading: Icon(
                        isAnswered
                            ? Icons.check_circle_outline
                            : Icons.warning_outlined,
                        color: isAnswered ? AppColors.black : Colors.red,
                        size: 24,
                      ),
                      title: Text(
                        question.title,
                        style: TextStyle(
                            color: AppColors.black,
                            fontWeight: FontWeight.w500,
                            fontSize: 16),
                      ),
                      subtitle: Text(
                        isAnswered
                            ? "Respondido: ${answer.label}"
                            : _isConfirmed
                                ? "Não Respondido!"
                                : "Clique aqui para responder",
                        style: TextStyle(
                            color: isAnswered ? AppColors.black : Colors.red,
                            fontSize: 13),
                      ),
                      onTap: () {
                        if (!isAnswered) {
                          Navigator.pushReplacementNamed(
                            context,
                            AppRoutes.challenge,
                            arguments: {
                              'questions': widget.questions,
                              'answers': widget.answers,
                              'currentQuestionIndex': index,
                            },
                          );
                        }
                      },
                    ),
                  ),
                  // Exibição das alternativas
                  if (isAnswered)
                    ...question.answers.map((answerOption) {
                      bool isCorrect = answerOption ==
                          question.answers
                              .firstWhere((answer) => answer.isRight);
                      bool isSelected = answer == answerOption;

                      return Column(
                        children: [
                          AwnserWidget(
                            label: answerOption.label,
                            onTap: () {},
                            isSelected: isSelected,
                            isRight: isCorrect,
                            isConfirmed: _isConfirmed,
                          ),
                          SizedBox(height: 5),
                        ],
                      );
                    }),
                  SizedBox(height: 10),
                ],
              );
            }),
            NextButtonWidget.green(
              label: "Confirmar",
              onTap: () => _showConfirmationDialog(context),
            ),
          ],
        ),
      ),
    );
  }
}
