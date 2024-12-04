import 'package:flutter/material.dart';
import 'package:learn_flutter/models/awnser_model.dart';
import 'package:learn_flutter/pages/challenge/widgets/question_indicator_widget.dart';
import 'package:learn_flutter/pages/challenge/widgets/quiz_wigdet.dart';

class ChallengePage extends StatefulWidget {
  const ChallengePage({super.key});

  @override
  _ChallengePageState createState() => _ChallengePageState();
}

class _ChallengePageState extends State<ChallengePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
          preferredSize: Size.fromHeight(60),
          child: SafeArea(child: QuestionIndicatorWidget())),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        padding: EdgeInsets.all(10),
        child: QuizWigdet(
            title: "testesss",
            description: "esse é só um texte de texto",
            urlImage: "https://picsum.photos/1200/900",
            questions: [
              AwnserModel(label: "Resposta 1", isRight: true, isSelected: true),
              AwnserModel(
                  label: "Resposta 2", isRight: false, isSelected: false),
              AwnserModel(
                  label: "Resposta 3", isRight: false, isSelected: false),
              AwnserModel(
                  label: "Resposta 4", isRight: false, isSelected: true),
            ]),
      ),
    );
  }
}
