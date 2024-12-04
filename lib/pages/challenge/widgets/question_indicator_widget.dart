import 'package:flutter/material.dart';
import 'package:learn_flutter/core/core.dart';
import 'package:learn_flutter/pages/widgets/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  final int currentIndex;
  final int totalQuestions;
  const QuestionIndicatorWidget(
      {super.key, required this.currentIndex, required this.totalQuestions});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Questão $currentIndex",
                style: AppTextStyles.body,
              ),
              Text(
                "de $totalQuestions",
                style: AppTextStyles.body,
              )
            ],
          ),
          SizedBox(height: 16),
          ProgressIndicatorWidget(
              progress: currentIndex, totalProgress: totalQuestions)
        ],
      ),
    );
  }
}
