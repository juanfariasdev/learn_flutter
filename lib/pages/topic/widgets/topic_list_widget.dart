import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:learn_flutter/core/app_routes.dart';
import 'package:learn_flutter/core/core.dart';
import 'package:learn_flutter/models/topic_model.dart';
import 'package:learn_flutter/pages/widgets/progress_indicator_widget.dart';

class TopicListWidget extends StatelessWidget {
  final TopicModel topic; // Recebe o TopicModel diretamente

  const TopicListWidget({
    super.key,
    required this.topic,
  });

  @override
  Widget build(BuildContext context) {
    final totalProgress = topic.challenges.length;
    final currentProgress = topic.challenges
        .where((question) =>
            question.selectedAnswer != null) // Exemplo: questões respondidas
        .length;

    return GestureDetector(
      onTap: () {
        print('Abrindo tópico: ${topic.title}');
        // Navegação para a ChallengePage
        Navigator.pushNamed(
          context,
          AppRoutes.challenge,
          arguments: {
            'questions': topic.challenges,
            'currentQuestionIndex': 0
          }, // Passa o tópico selecionado
        );
      },
      child: Container(
        decoration: BoxDecoration(
          border: Border.fromBorderSide(BorderSide(color: AppColors.border)),
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
                children: [
                  SizedBox(
                    width: 40,
                    child: Align(
                      alignment:
                          Alignment.centerLeft, // Alinha o ícone à esquerda
                      child: Icon(
                        Icons.check_box_outline_blank,
                        size: 20,
                      ),
                    ),
                  ),
                  Expanded(
                    child: AutoSizeText(
                      minFontSize: 16,
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                      topic.title,
                      style: AppTextStyles.body,
                    ),
                  ),
                ],
              ),
              Row(
                children: [
                  SizedBox(
                    width: 60, // Um tamanho fixo para o texto
                    child: AutoSizeText(
                      "$currentProgress/$totalProgress", // Exibindo o progresso atual e total
                      style: AppTextStyles.body11,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                  ProgressIndicatorWidget(
                    progress: currentProgress,
                    totalProgress: totalProgress,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
