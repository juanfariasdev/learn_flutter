import 'package:flutter/material.dart';
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
        child: QuizWigdet(
            title: "testesss",
            description: "esse é só um texte de texto",
            urlImage: "https://picsum.photos/1200/900",
            questions: [
              Awnser(label: "Resposta 1", isRight: true, isSelected: false),
              Awnser(label: "Resposta 2", isRight: false, isSelected: false),
              Awnser(label: "Resposta 3", isRight: false, isSelected: false),
              Awnser(label: "Resposta 4", isRight: false, isSelected: false),
            ]),
      ),
    );
  }
}
