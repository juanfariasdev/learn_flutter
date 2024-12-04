import 'package:learn_flutter/models/challenge_model.dart';

class TopicModel {
  final String title;
  final List<ChallengeModel> challenges;

  TopicModel({
    required this.title,
    required this.challenges,
  });
}
