import 'package:flutter/material.dart';
import 'package:learn_flutter/core/app_routes.dart';
import 'package:learn_flutter/models/awnser_model.dart';
import 'package:learn_flutter/models/question_model.dart';
import 'package:learn_flutter/pages/widgets/next_button_widget.dart';

class ConfirmationPage extends StatelessWidget {
  final List<QuestionModel> questions;
  final List<AnswerModel?> answers;

  const ConfirmationPage({
    super.key,
    required this.questions,
    required this.answers,
  });

  void _showConfirmationDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Confirmar Respostas"),
          content: Text("Você deseja salvar suas respostas?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Respostas salvas com sucesso!")),
                );
              },
              child: Text("Sim"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("Não"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Suas Respostas"),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(10),
        child: Column(
          children: [
            ...questions.asMap().entries.map((entry) {
              int index = entry.key;
              QuestionModel question = entry.value;
              bool isAnswered = answers[index] != null;
              return Column(
                children: [
                  ListTile(
                    title: Text(question.title),
                    subtitle: isAnswered
                        ? Text("Respondido: ${answers[index]!.label}")
                        : Text("Não Respondido",
                            style: TextStyle(color: Colors.red)),
                    tileColor: isAnswered ? Colors.green[50] : Colors.red[50],
                    onTap: () {
                      if (!isAnswered) {
                        Navigator.pushNamed(
                          context,
                          AppRoutes.challenge,
                          arguments: {
                            'questions': questions,
                            'answers': answers,
                            'currentQuestionIndex': index
                          }, // Passa o tópico selecionado
                        );
                      }
                    },
                  ),
                  SizedBox(
                    height: 10,
                  ),
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
