import 'package:flutter/material.dart';
import 'package:learn_flutter/models/topic_model.dart';
import 'package:learn_flutter/pages/home/widgets/level_button_widget.dart';

class QuizModel {
  final String label;
  final int progress;
  final IconData icon;
  final Level level;
  final List<TopicModel> topics;

  QuizModel({
    required this.label,
    this.progress = 0,
    this.icon = Icons.abc_outlined,
    this.level = Level.facil,
    required this.topics,
  });
}
