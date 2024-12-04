import 'package:learn_flutter/models/awnser_model.dart';

class QuestionModel {
  final String title; // Título da pergunta
  final String description; // Descrição ou texto explicativo da pergunta
  final String? urlImage; // URL opcional para uma imagem associada à pergunta
  final List<AnswerModel> answers; // Lista de alternativas para a pergunta

  QuestionModel({
    required this.title,
    required this.description,
    this.urlImage,
    required this.answers,
  });
}
