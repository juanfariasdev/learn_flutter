import 'dart:convert';

import 'package:learn_flutter/models/awnser_model.dart';

class QuestionModel {
  final String title; // Título da pergunta
  final String description; // Descrição da pergunta
  final String? urlImage; // URL opcional para imagem
  final List<AnswerModel> answers; // Lista de alternativas
  AnswerModel? selectedAnswer; // Alternativa selecionada pelo usuário

  QuestionModel({
    required this.title,
    required this.description,
    this.urlImage,
    required this.answers,
    this.selectedAnswer,
  });
  // Método para verificar se a resposta selecionada está correta
  bool get isCorrect => selectedAnswer?.isRight ?? false;

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'description': description,
      'urlImage': urlImage,
      'answers': answers.map((x) => x.toMap()).toList(),
      'selectedAnswer': selectedAnswer?.toMap(),
    };
  }

  factory QuestionModel.fromMap(Map<String, dynamic> map) {
    return QuestionModel(
      title: map['title'] as String,
      description: map['description'] as String,
      urlImage: map['urlImage'] as String?,
      answers: List<AnswerModel>.from(map['answers']
              ?.map((x) => AnswerModel.fromMap(x as Map<String, dynamic>))
          as Iterable),
      selectedAnswer: map['selectedAnswer'] == null
          ? null
          : AnswerModel.fromMap(map['selectedAnswer'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory QuestionModel.fromJson(String source) =>
      QuestionModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
