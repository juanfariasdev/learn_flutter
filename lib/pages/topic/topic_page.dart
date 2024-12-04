import 'package:flutter/material.dart';
import 'package:learn_flutter/core/core.dart';
import 'package:learn_flutter/models/quiz_model.dart';
import 'package:learn_flutter/models/topic_model.dart';
import 'package:learn_flutter/pages/topic/widgets/topic_list_widget.dart';

class TopicPage extends StatelessWidget {
  final QuizModel quiz;

  const TopicPage({super.key, required this.quiz});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          quiz.label,
          style: AppTextStyles.title,
        ),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: ListView.builder(
        padding: EdgeInsets.symmetric(
            horizontal: AppConfig.mobilePadding,
            vertical: AppConfig.mobilePadding),
        itemCount: quiz.topics.length,
        itemBuilder: (context, index) {
          final TopicModel topic = quiz.topics[index];

          return Column(
            children: [
              TopicListWidget(
                topic: topic,
              ),
              SizedBox(height: 10),
            ],
          );
        },
      ),
    );
  }
}
