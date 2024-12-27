import 'package:flutter/material.dart';
import 'package:learn_flutter/models/quiz_model.dart';

import 'json.dart'; // Seu arquivo json.dart

class QuizApi {
  Future<List<QuizModel>> getQuizzes() async {
    WidgetsFlutterBinding.ensureInitialized();
    final quizData = await getItems('database/quiz.json');
    final list = quizData.map((e) => QuizModel.fromMap(e)).toList();
    return list;
  }
}
