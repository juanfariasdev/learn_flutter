import 'package:flutter/material.dart';
import 'package:learn_flutter/core/core.dart';

class ProgressIndicatorWidget extends StatelessWidget {
  int progress;
  int totalProgress;
  ProgressIndicatorWidget(
      {super.key, required this.progress, required this.totalProgress});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: LinearProgressIndicator(
        value: totalProgress == 0 ? 1 : (progress / totalProgress).toDouble(),
        backgroundColor: AppColors.chartSecondary,
        valueColor: AlwaysStoppedAnimation(AppColors.chartPrimary),
      ),
    );
  }
}
