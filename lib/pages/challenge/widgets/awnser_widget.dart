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

  Color get _SelectedColorRight =>
      isRight ? AppColors.darkGreen : AppColors.darkRed;

  Color get _SelectedBorderRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _SelectedColorCardRight =>
      isRight ? AppColors.lightGreen : AppColors.lightRed;

  Color get _SelectedBorderCardRight =>
      isRight ? AppColors.green : AppColors.red;

  TextStyle get _SelectedTextStyleRight =>
      isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;

  IconData get _SelectedIconRight => isRight ? Icons.check : Icons.close;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 16, vertical: 16),
      decoration: BoxDecoration(
          color: isSelected ? _SelectedColorCardRight : AppColors.white,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(BorderSide(
              color:
                  isSelected ? _SelectedBorderCardRight : AppColors.border))),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            label,
            style: isSelected ? _SelectedTextStyleRight : AppTextStyles.body,
          ),
          Container(
            width: 24,
            height: 24,
            decoration: BoxDecoration(
              color: isSelected ? _SelectedColorRight : AppColors.white,
              borderRadius: BorderRadius.circular(500),
              border: Border.fromBorderSide(BorderSide(
                  color: isSelected ? _SelectedBorderRight : AppColors.white)),
            ),
            child: isSelected
                ? Icon(
                    _SelectedIconRight,
                    size: 16,
                    color: isSelected ? AppColors.white : AppColors.darkGreen,
                  )
                : null,
          )
        ],
      ),
    );
  }
}
