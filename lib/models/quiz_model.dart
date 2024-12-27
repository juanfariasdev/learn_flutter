import 'dart:convert';

import 'package:learn_flutter/models/topic_model.dart';
import 'package:learn_flutter/pages/home/widgets/level_button_widget.dart';

extension LevelStringExt on String {
  Level get levelParse => {
        "facil": Level.facil,
        "medio": Level.medio,
        "dificil": Level.dificil,
        "perito": Level.perito,
      }[this]!;
}

extension LevelExt on Level {
  String get levelParse => {
        Level.facil: "facil",
        Level.medio: "medio",
        Level.dificil: "dificil",
        Level.perito: "perito",
      }[this]!;
}

class QuizModel {
  final String id;
  final String label;
  final int progress;
  final String? icon;
  final Level level;
  final List<TopicModel> topics;

  QuizModel({
    this.id = "123",
    required this.label,
    this.progress = 0,
    required this.icon,
    required this.level,
    required this.topics,
  });

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'label': label,
      'progress': progress,
      'icon': icon,
      'level': level.levelParse,
      'topics': topics.map((x) => x.toMap()).toList(),
    };
  }

  factory QuizModel.fromMap(Map<String, dynamic> map) {
    return QuizModel(
      id: map['id'] ?? '111',
      label: map['label'] as String,
      progress: map['progress'] as int,
      icon: map['icon'], // Converter código do ícone de volta
      level: map['level'].toString().levelParse,
      topics: List<TopicModel>.from(map['topics']
          ?.map((x) => TopicModel.fromMap(x as Map<String, dynamic>))),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuizModel.fromJson(String source) =>
      QuizModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
