import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:learn_flutter/core/core.dart';

class NextButtonWidget extends StatelessWidget {
  final String label;
  final Color backgroundColor;
  final Color fontColor;
  final Color borderColor;
  final VoidCallback onTap;
  final bool isDisabled; // Novo parâmetro para controle de desabilitação

  const NextButtonWidget({
    super.key,
    required this.label,
    required this.backgroundColor,
    required this.fontColor,
    required this.borderColor,
    required this.onTap,
    this.isDisabled = false, // Por padrão, o botão não está desabilitado
  });

  const NextButtonWidget.green({
    super.key,
    required String label,
    required VoidCallback onTap,
    this.isDisabled = false, // Permitir desabilitar
  })  : backgroundColor = AppColors.darkGreen,
        fontColor = AppColors.white,
        borderColor = AppColors.green,
        onTap = onTap,
        label = label;

  const NextButtonWidget.purple({
    super.key,
    required String label,
    required VoidCallback onTap,
    this.isDisabled = false, // Permitir desabilitar
  })  : backgroundColor = AppColors.purple,
        fontColor = AppColors.white,
        borderColor = AppColors.green,
        onTap = onTap,
        label = label;

  const NextButtonWidget.white({
    super.key,
    required String label,
    required VoidCallback onTap,
    this.isDisabled = false, // Permitir desabilitar
  })  : backgroundColor = AppColors.white,
        fontColor = AppColors.grey,
        borderColor = AppColors.border,
        onTap = onTap,
        label = label;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 45,
      child: TextButton(
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(
            isDisabled
                ? Colors.grey.withOpacity(0.2)
                : backgroundColor, // Opacidade se desabilitado
          ),
          shape: WidgetStateProperty.all(RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          )),
          side: WidgetStateProperty.all(BorderSide(
            color: isDisabled
                ? Colors.grey.withOpacity(0.8)
                : borderColor, // Cor de borda para desabilitado
          )),
        ),
        onPressed: isDisabled
            ? null
            : onTap, // Desabilita o clique se `isDisabled` for true
        child: Text(
          label,
          style: GoogleFonts.notoSans(
            fontWeight: FontWeight.w600,
            fontSize: 13,
            color: isDisabled
                ? Colors.grey
                : fontColor, // Cor do texto se desabilitado
          ),
        ),
      ),
    );
  }
}
