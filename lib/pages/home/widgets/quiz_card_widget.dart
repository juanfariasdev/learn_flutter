import 'package:flutter/material.dart';
import 'package:learn_flutter/core/app_colors.dart';
import 'package:learn_flutter/core/app_text_styles.dart';

class QuizCardWidget extends StatelessWidget {
  final String label;
  final int progress;
  final IconData icon;
  final int totalProgress;

  const QuizCardWidget({
    super.key,
    required this.label,
    this.progress = 0,
    this.totalProgress = 0,
    this.icon = Icons.abc_outlined,
  });

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        double minWidth = 160;
        double spacing = 10;

        // Calcular quantos itens cabem na largura disponível
        int maxItensRow = (constraints.maxWidth / (spacing + minWidth)).floor();
        spacing = (spacing * (maxItensRow - 1));
        double maxWidth = ((constraints.maxWidth - spacing) / maxItensRow);

        // Garantir que o maxWidth seja maior que minWidth
        maxWidth = maxWidth > minWidth ? maxWidth : minWidth;

        return ConstrainedBox(
          constraints: BoxConstraints(
            minHeight: 177,
            maxHeight: 177,
            minWidth: minWidth,
            maxWidth: maxWidth,
          ),
          child: DecoratedBox(
            decoration: BoxDecoration(
              border:
                  Border.fromBorderSide(BorderSide(color: AppColors.border)),
              color: AppColors.white,
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: const EdgeInsets.all(15),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Icon(
                    icon,
                    size: 40,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: Text(
                      label,
                      style: AppTextStyles.heading18,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 40, // Um tamanho fixo para o texto
                        child: Text(
                          "$progress/$totalProgress",
                          style: AppTextStyles.body11,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      Flexible(
                        child: LinearProgressIndicator(
                          value: totalProgress == 0
                              ? 1
                              : (progress / totalProgress).toDouble(),
                          backgroundColor: AppColors.chartSecondary,
                          valueColor:
                              AlwaysStoppedAnimation(AppColors.chartPrimary),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
