class AnswerModel {
  final String label; // Texto da alternativa
  final bool isRight; // Indica se a alternativa é correta

  AnswerModel({
    required this.label,
    this.isRight = false,
  });
}
