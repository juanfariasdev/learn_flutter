import 'package:learn_flutter/models/question_model.dart';

class TopicModel {
  final String title;
  final List<QuestionModel> challenges;

  TopicModel({
    required this.title,
    required this.challenges,
  });
}
