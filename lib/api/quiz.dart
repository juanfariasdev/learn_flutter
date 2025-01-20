import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learn_flutter/models/quiz_model.dart';

class QuizApi {
  Future<List<QuizModel>> getQuizzes() async {
    WidgetsFlutterBinding.ensureInitialized();
    final quizDataResponse =
        await http.get(Uri.parse("http://10.0.2.2:3000/api/quiz"));

    if (quizDataResponse.statusCode == 200) {
      // Garantir que a resposta esteja na codificação UTF-8
      final quizData = utf8.decode(
          quizDataResponse.bodyBytes); // Decodificando explicitamente com UTF-8
      final quizList = jsonDecode(quizData) as List<dynamic>;

      // Converta cada elemento para QuizModel e transforme o Iterable em uma lista.
      final List<QuizModel> list =
          quizList.map((e) => QuizModel.fromMap(e)).toList();

      return list;
    }

    // Retorne uma lista vazia em caso de falha
    return [];
  }
}
