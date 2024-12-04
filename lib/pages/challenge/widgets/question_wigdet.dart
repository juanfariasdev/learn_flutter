import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learn_flutter/core/core.dart';
import 'package:learn_flutter/models/awnser_model.dart';
import 'package:learn_flutter/models/question_model.dart';
import 'package:learn_flutter/pages/challenge/widgets/awnser_widget.dart';
import 'package:learn_flutter/pages/widgets/next_button_widget.dart';
import 'package:photo_view/photo_view.dart';

class QuestionWidget extends StatefulWidget {
  final QuestionModel question;

  const QuestionWidget({super.key, required this.question});

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  bool isConfirmed = false; // Define se o usuário confirmou as respostas
  AnswerModel? selectedAnswer; // Resposta selecionada pelo usuário

  void _selectAnswer(AnswerModel answer) {
    if (!isConfirmed) {
      // Só permite a seleção se não estiver confirmado
      setState(() {
        selectedAnswer = answer;
      });
    }
  }

  void _confirmAnswer() {
    if (selectedAnswer != null) {
      // Confirma a seleção
      setState(() {
        isConfirmed = true;
        widget.question.selectedAnswer = selectedAnswer;
      });
    } else {
      // Opcional: Mostrar mensagem caso nenhuma alternativa esteja selecionada
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Selecione uma resposta antes de confirmar!")),
      );
    }
  }

  void _openImageWithBlur() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.all(0),
          backgroundColor:
              Colors.transparent, // Torna o fundo do diálogo transparente
          child: Stack(
            children: [
              // Aplicando o efeito de Blur no fundo
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(
                      sigmaX: 5.0, sigmaY: 5.0), // Intensidade do blur
                  child: Container(
                    color: Colors.black
                        .withOpacity(0.5), // Fundo com opacidade para o blur
                  ),
                ),
              ),
              // Exibindo a imagem com zoom
              Column(
                children: [
                  // Botão "X" para fechar o diálogo
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop(); // Fecha o diálogo
                      },
                    ),
                  ),
                  // Exibindo a imagem com zoom
                  Expanded(
                    child: PhotoView(
                      backgroundDecoration: BoxDecoration(
                        color: Colors
                            .transparent, // Removendo o fundo do PhotoView
                      ),
                      imageProvider: NetworkImage(widget.question.urlImage!),
                      minScale: PhotoViewComputedScale.contained,
                      maxScale: PhotoViewComputedScale.covered,
                    ),
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.question.title, style: AppTextStyles.heading),
          Text(widget.question.description, style: AppTextStyles.body),
          SizedBox(height: 10),
          if (widget.question.urlImage != null &&
              widget.question.urlImage!.isNotEmpty)
            GestureDetector(
              onTap:
                  _openImageWithBlur, // Ao clicar, abre a imagem com blur no fundo
              child: Image.network(
                widget.question.urlImage!,
                width: double.infinity, // A imagem agora ocupa toda a largura
                fit: BoxFit.cover, // Ajusta a imagem para cobrir toda a largura
              ),
            ),
          SizedBox(height: 10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 4,
            children: widget.question.answers.map((item) {
              return GestureDetector(
                onTap: () => _selectAnswer(item),
                child: AwnserWidget(
                  label: item.label,
                  isRight: item.isRight,
                  isSelected: selectedAnswer == item,
                  isConfirmed: isConfirmed,
                  onTap: () {},
                ),
              );
            }).toList(),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 10),
            child: Row(
              children: [
                Expanded(
                  child: NextButtonWidget.white(
                    label: "Pular",
                    onTap: () => {
                      // Lógica para pular a pergunta (opcional)
                    },
                  ),
                ),
                SizedBox(
                  width: 10,
                ),
                Expanded(
                  child: NextButtonWidget.green(
                    label: "Confirmar",
                    onTap: _confirmAnswer, // Confirma a seleção
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
