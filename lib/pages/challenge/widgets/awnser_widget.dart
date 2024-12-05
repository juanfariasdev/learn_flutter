// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:learn_flutter/core/core.dart';

class AwnserWidget extends StatelessWidget {
  final String label; // Texto da alternativa
  final bool isRight; // Define se a alternativa está correta
  final bool isSelected; // Define se a alternativa foi selecionada
  final bool isConfirmed; // Define se a "prova" foi confirmada
  final VoidCallback onTap; // Função chamada ao clicar na alternativa

  const AwnserWidget({
    super.key,
    required this.label,
    this.isRight = false,
    this.isSelected = false,
    this.isConfirmed = false,
    required this.onTap,
  });

  // Cores dinâmicas com base nos estados
  Color get _SelectedColorCard {
    if (isConfirmed) {
      return isRight ? AppColors.lightGreen : AppColors.lightRed;
    }
    return isSelected ? AppColors.lightGrey : AppColors.white;
  }

  Color get _SelectedBorderCard {
    if (isConfirmed) {
      return isRight ? AppColors.green : AppColors.red;
    }
    return isSelected ? AppColors.grey : AppColors.border;
  }

  TextStyle get _SelectedTextStyle {
    if (isConfirmed) {
      return isRight ? AppTextStyles.bodyDarkGreen : AppTextStyles.bodyDarkRed;
    }
    return isSelected ? AppTextStyles.bodyBold : AppTextStyles.body;
  }

  IconData? get _SelectedIcon {
    if (isConfirmed) {
      return isRight ? Icons.check : Icons.close;
    }
    return null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: isConfirmed
          ? null
          : onTap, // Só permite seleção se não foi confirmado
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: _SelectedColorCard,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(BorderSide(color: _SelectedBorderCard)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: _SelectedTextStyle,
            ),
            if (isConfirmed) // Mostra o ícone só se a "prova" estiver confirmada
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: isConfirmed
                      ? (isRight ? AppColors.green : AppColors.red)
                      : AppColors.white,
                  borderRadius: BorderRadius.circular(500),
                ),
                child: Icon(
                  _SelectedIcon,
                  size: 16,
                  color: AppColors.white,
                ),
              ),
          ],
        ),
      ),
    );
  }
}
