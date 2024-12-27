import 'dart:convert';

import 'package:learn_flutter/models/question_model.dart';

class TopicModel {
  final String title;
  final List<QuestionModel> challenges;

  TopicModel({
    required this.title,
    required this.challenges,
  });

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'challenges': challenges.map((x) => x.toMap()).toList(),
    };
  }

  factory TopicModel.fromMap(Map<String, dynamic> map) {
    return TopicModel(
      title: map['title'] as String,
      challenges: List<QuestionModel>.from(map['challenges']
              ?.map((x) => QuestionModel.fromMap(x as Map<String, dynamic>))
          as Iterable),
    );
  }

  String toJson() => json.encode(toMap());

  factory TopicModel.fromJson(String source) =>
      TopicModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
