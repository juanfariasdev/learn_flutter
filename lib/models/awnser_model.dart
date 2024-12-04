class AnswerModel {
  final String label;
  final bool isRight;
  final bool isSelected;

  AnswerModel({
    required this.label,
    this.isRight = false,
    this.isSelected = false,
  });
}
