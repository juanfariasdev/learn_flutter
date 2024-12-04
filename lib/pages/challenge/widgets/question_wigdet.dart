import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:learn_flutter/core/core.dart';
import 'package:learn_flutter/models/awnser_model.dart';
import 'package:learn_flutter/models/question_model.dart';
import 'package:learn_flutter/pages/challenge/widgets/awnser_widget.dart';
import 'package:photo_view/photo_view.dart';

class QuestionWidget extends StatefulWidget {
  final QuestionModel question;
  final Function(AnswerModel?)
      onAnswerSelected; // Função callback para selecionar a resposta
  final bool isConfirmed;

  const QuestionWidget({
    super.key,
    required this.question,
    required this.onAnswerSelected, // Passa a função de seleção de resposta
    required this.isConfirmed, // Passa o estado de confirmação
  });

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  AnswerModel? selectedAnswer; // Resposta selecionada pelo usuário

  void _selectAnswer(AnswerModel answer) {
    if (!widget.isConfirmed) {
      setState(() {
        selectedAnswer = answer;
      });
      widget.onAnswerSelected(
          answer); // Chama a função de callback para informar o pai
    }
  }

  void _openImageWithBlur() {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (BuildContext context) {
        return Dialog(
          insetPadding: EdgeInsets.all(0),
          backgroundColor: Colors.transparent,
          child: Stack(
            children: [
              Positioned.fill(
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                  child: Container(
                    color: Colors.black.withOpacity(0.5),
                  ),
                ),
              ),
              Column(
                children: [
                  Align(
                    alignment: Alignment.topRight,
                    child: IconButton(
                      icon: Icon(Icons.close, color: Colors.white),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                  ),
                  Expanded(
                    child: PhotoView(
                      backgroundDecoration:
                          BoxDecoration(color: Colors.transparent),
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
              onTap: _openImageWithBlur,
              child: Image.network(
                widget.question.urlImage!,
                width: double.infinity,
                fit: BoxFit.cover,
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
                  isConfirmed:
                      widget.isConfirmed, // Passa o estado de confirmação
                  onTap: () {},
                ),
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
