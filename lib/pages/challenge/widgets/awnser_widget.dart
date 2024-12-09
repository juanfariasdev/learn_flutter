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

  @override
  Widget build(BuildContext context) {
    // Definindo as cores, bordas, estilos de texto e ícones baseados nos estados
    Color color = isConfirmed
        ? (isSelected
            ? (isRight ? AppColors.lightGreen : AppColors.lightRed)
            : AppColors.white)
        : (isSelected
            ? const Color.fromARGB(255, 245, 245, 245)
            : AppColors.white);

    Color borderColor = isConfirmed
        ? (isSelected
            ? (isRight ? AppColors.green : AppColors.red)
            : AppColors.border)
        : (isSelected ? AppColors.grey : AppColors.border);

    TextStyle textStyle = isConfirmed
        ? (isSelected
            ? (isRight
                ? AppTextStyles.bodyDarkGreen
                : AppTextStyles.bodyDarkRed)
            : AppTextStyles.body)
        : (isSelected ? AppTextStyles.bodyBold : AppTextStyles.body);

    IconData? icon = isConfirmed && isSelected
        ? (isRight ? Icons.check : Icons.close)
        : null;

    return GestureDetector(
      onTap: isConfirmed
          ? null
          : onTap, // Só permite seleção se não foi confirmado
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
        decoration: BoxDecoration(
          color: color,
          borderRadius: BorderRadius.circular(10),
          border: Border.fromBorderSide(BorderSide(color: borderColor)),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              label,
              style: textStyle,
            ),
            if (icon !=
                null) // Mostra o ícone só se a "prova" estiver confirmada e selecionada
              Container(
                width: 24,
                height: 24,
                decoration: BoxDecoration(
                  color: isRight ? AppColors.green : AppColors.red,
                  borderRadius: BorderRadius.circular(500),
                ),
                child: Icon(
                  icon,
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
