import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/core/core.dart';
import 'package:learn_flutter/pages/widgets/progress_indicator_widget.dart';

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
            minHeight: 150,
            maxHeight: 150,
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
                    size: 36,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(bottom: 10),
                    child: AutoSizeText(
                      minFontSize: 14,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      label,
                      style: AppTextStyles.heading16,
                    ),
                  ),
                  Row(
                    children: [
                      SizedBox(
                        width: 40, // Um tamanho fixo para o texto
                        child: AutoSizeText(
                          "$progress/$totalProgress",
                          style: AppTextStyles.body11,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                      ProgressIndicatorWidget(
                          progress: progress, totalProgress: totalProgress)
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
