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
}
