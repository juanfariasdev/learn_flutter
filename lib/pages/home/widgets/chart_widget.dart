import 'package:flutter/material.dart';
import 'package:learn_flutter/core/core.dart';

class ChartWidget extends StatelessWidget {
  const ChartWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.maxFinite,
      height: double.maxFinite,
      child: Stack(
        children: [
          const Center(
            child: SizedBox(
              height: 70,
              width: 70,
              child: CircularProgressIndicator(
                strokeWidth: 8,
                value: 0.75,
                backgroundColor: AppColors.chartSecondary,
                valueColor: AlwaysStoppedAnimation(AppColors.chartPrimary),
              ),
            ),
          ),
          Center(
            child: Text(
              "75%",
              style: AppTextStyles.heading,
            ),
          )
        ],
      ),
    );
  }
}
