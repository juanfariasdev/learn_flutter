import 'dart:convert';

class AnswerModel {
  final String label; // Texto da alternativa
  final bool isRight; // Indica se a alternativa é correta

  AnswerModel({
    required this.label,
    this.isRight = false,
  });

  Map<String, dynamic> toMap() {
    return {
      'label': label,
      'isRight': isRight,
    };
  }

  factory AnswerModel.fromMap(Map<String, dynamic> map) {
    return AnswerModel(
      label: map['label'] as String,
      isRight: map['isRight'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory AnswerModel.fromJson(String source) =>
      AnswerModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
