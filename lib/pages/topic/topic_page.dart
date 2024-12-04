import 'package:flutter/material.dart';
import 'package:learn_flutter/core/core.dart';
import 'package:learn_flutter/models/quiz_model.dart';
import 'package:learn_flutter/models/topic_model.dart';

class TopicPage extends StatelessWidget {
  final QuizModel quiz;

  const TopicPage({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          quiz.label,
          style: AppTextStyles.subTitle,
        ),
        backgroundColor: AppColors.primary,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(16),
        itemCount: quiz.topics!.length,
        itemBuilder: (context, index) {
          final TopicModel topic = quiz.topics![index];
          return Card(
            margin: const EdgeInsets.only(bottom: 16),
            child: ListTile(
              title: Text(
                topic.title,
                style: AppTextStyles.body,
              ),
              onTap: () {
                // Aqui você pode implementar a navegação para uma página específica do tópico.
                print('Abrindo tópico: ${topic.title}');
              },
            ),
          );
        },
      ),
    );
  }
}
