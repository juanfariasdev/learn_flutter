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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(widget.title, style: AppTextStyles.heading),
          Text(widget.description, style: AppTextStyles.body),
          SizedBox(height: 10),
          if (widget.urlImage != null && widget.urlImage!.isNotEmpty)
            Image.network(widget.urlImage!),
          SizedBox(height: 10),
          Wrap(
            crossAxisAlignment: WrapCrossAlignment.center,
            runSpacing: 4,
            children: widget.questions.map((item) {
              return AwnserWidget(
                isRight: item.isRight,
                isSelected: item.isSelected,
                label: item.label,
              );
            }).toList(),
          ),
        ],
      ),
    );
  }
}
