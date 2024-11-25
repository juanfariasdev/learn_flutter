import 'package:flutter/material.dart';
import 'package:learn_flutter/core/core.dart';
import 'package:learn_flutter/pages/widgets/progress_indicator_widget.dart';

class QuestionIndicatorWidget extends StatelessWidget {
  const QuestionIndicatorWidget({super.key});

  @override
  Widget build(BuildContext context) {
    int totalProgress = 10;
    int progress = 3;
    return Container(
      child: Padding(
        padding: const EdgeInsets.all(10),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Questão 3",
                  style: AppTextStyles.body,
                ),
                Text(
                  "de 10",
                  style: AppTextStyles.body,
                )
              ],
            ),
            SizedBox(height: 16),
            ProgressIndicatorWidget(
                progress: progress, totalProgress: totalProgress)
          ],
        ),
      ),
    );
  }
}
