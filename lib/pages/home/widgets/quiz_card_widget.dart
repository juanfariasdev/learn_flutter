import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:learn_flutter/core/app_colors.dart';
import 'package:learn_flutter/core/app_text_styles.dart';

class QuizCardWidget extends StatelessWidget {
  const QuizCardWidget({super.key});

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

        log("constraints.maxWidth: ${constraints.maxWidth}");
        log("maxItensRow: $maxItensRow");
        log("maxWidth: $maxWidth");
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
                  Container(
                    width: 40,
                    height: 40,
                    color: Colors.red,
                  ),
                  Text(
                    "Gerenciamento de estado",
                    style: AppTextStyles.heading18,
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          "3/10",
                          style: AppTextStyles.body11,
                        ),
                      ),
                      Expanded(
                        child: LinearProgressIndicator(
                          value: 0.3,
                          backgroundColor: AppColors.chartSecondary,
                          valueColor:
                              AlwaysStoppedAnimation(AppColors.chartPrimary),
                        ),
                      )
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
