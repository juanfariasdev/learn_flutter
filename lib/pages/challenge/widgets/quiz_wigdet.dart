import 'package:flutter/material.dart';
import 'package:learn_flutter/core/app_text_styles.dart';
import 'package:learn_flutter/pages/challenge/widgets/awnser_widget.dart';

class Awnser {
  final String label;
  final bool isRight;
  final bool isSelected;

  Awnser({
    required this.label,
    this.isRight = false,
    this.isSelected = false,
  });
}

class QuizWigdet extends StatefulWidget {
  final String title;
  final String description;
  final String? urlImage;
  final List<Awnser> questions;

  const QuizWigdet(
      {super.key,
      required this.title,
      required this.description,
      this.urlImage,
      required this.questions});

  @override
  _QuizWigdetState createState() => _QuizWigdetState();
}

class _QuizWigdetState extends State<QuizWigdet> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: [
          Text(widget.title, style: AppTextStyles.heading),
          Text(widget.description, style: AppTextStyles.body),
          if (widget.urlImage != null && widget.urlImage!.isNotEmpty)
            Image.network(widget.urlImage!),
          SizedBox(height: 24),
          ListView.builder(
            shrinkWrap:
                true, // Opção alternativa caso queira apenas ocupar o espaço necessário
            itemCount: widget.questions.length,
            itemBuilder: (context, index) {
              return AwnserWidget(
                isRight: widget.questions[index].isRight,
                isSelected: widget.questions[index].isSelected,
                label: widget.questions[index].label,
              );
            },
          )
        ],
      ),
    );
  }
}
