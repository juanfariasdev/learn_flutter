import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/core/core.dart';
import 'package:learn_flutter/models/quiz_model.dart';
import 'package:learn_flutter/pages/home/widgets/level_button_widget.dart';
import 'package:learn_flutter/pages/topic/topic_page.dart';
import 'package:learn_flutter/pages/widgets/progress_indicator_widget.dart';

class QuizCardWidget extends StatelessWidget {
  final QuizModel quiz; // Recebe o QuizModel diretamente

  const QuizCardWidget({
    super.key,
    required this.quiz,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        // Navega para a TopicPage ao clicar

        if (quiz.topics != null && quiz.topics!.isNotEmpty) {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => TopicPage(
                quiz: quiz,
              ), // Passa o quiz selecionado
            ),
          );
        }
      },
      child: LayoutBuilder(
        builder: (context, constraints) {
          double minWidth = 160;
          double spacing = 10;

          // Calcular quantos itens cabem na largura disponível
          int maxItensRow =
              (constraints.maxWidth / (spacing + minWidth)).floor();
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Icon(
                          quiz.icon,
                          size: 36,
                        ),
                        LevelButtonWidget(level: quiz.level),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 10),
                      child: AutoSizeText(
                        minFontSize: 14,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        quiz.label,
                        style: AppTextStyles.heading16,
                      ),
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 40, // Um tamanho fixo para o texto
                          child: AutoSizeText(
                            "${quiz.progress}/${quiz.totalProgress}",
                            style: AppTextStyles.body11,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        ProgressIndicatorWidget(
                            progress: quiz.progress,
                            totalProgress: quiz.totalProgress)
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
