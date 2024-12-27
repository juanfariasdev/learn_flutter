import 'package:flutter/material.dart';
import 'package:learn_flutter/core/core.dart';

class ChartWidget extends StatelessWidget {
  int value;
  ChartWidget({super.key, required this.value});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Stack(
        children: [
          Center(
            child: SizedBox(
              height: 70,
              width: 70,
              child: CircularProgressIndicator(
                strokeWidth: 8,
                value: value / 100,
                backgroundColor: AppColors.chartSecondary,
                valueColor: AlwaysStoppedAnimation(AppColors.chartPrimary),
              ),
            ),
          ),
          Center(
            child: Text(
              "$value%",
              style: AppTextStyles.heading,
            ),
          )
        ],
      ),
    );
  }
}
