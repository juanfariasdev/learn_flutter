import 'package:flutter/material.dart';
import 'package:learn_flutter/core/core.dart';

class AwnserWidget extends StatelessWidget {
  final String label;
  final bool isRight;
  final bool isSelected;

  const AwnserWidget({
    super.key,
    required this.label,
    this.isRight = false,
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(BorderSide(color: AppColors.border))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: AppTextStyles.body,
          ),
          SizedBox(
            width: 24,
            height: 24,
            child: Icon(
              isRight ? Icons.check : Icons.close,
              color: isSelected ? AppColors.white : AppColors.darkGreen,
            ),
          )
        ],
      ),
    );
  }
}
