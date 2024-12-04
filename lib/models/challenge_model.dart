import 'package:learn_flutter/models/awnser_model.dart';

class ChallengeModel {
  final String title;
  final String description;
  final String? urlImage;
  final List<AwnserModel> questions;

  ChallengeModel({
    required this.title,
    required this.description,
    this.urlImage,
    required this.questions,
  });
}
