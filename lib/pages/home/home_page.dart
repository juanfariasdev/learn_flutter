import 'package:flutter/material.dart';
import 'package:learn_flutter/core/core.dart';
import 'package:learn_flutter/models/quiz_model.dart';
import 'package:learn_flutter/pages/home/home_controller.dart';
import 'package:learn_flutter/pages/home/home_state.dart';
import 'package:learn_flutter/pages/home/widgets/app_bar_widget.dart';
import 'package:learn_flutter/pages/home/widgets/level_button_widget.dart';
import 'package:learn_flutter/pages/home/widgets/quiz_card_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();

  @override
  void initState() {
    super.initState();
    controller.getUser();
    controller.getQuizzes();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBarWidget(
        user: controller.user!,
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Wrap(
                  spacing: 5,
                  children: [
                    LevelButtonWidget(level: Level.facil),
                    LevelButtonWidget(level: Level.medio),
                    LevelButtonWidget(level: Level.dificil),
                    LevelButtonWidget(level: Level.perito),
                  ],
                ),
              ),
            ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: AppConfig.mobilePadding),
              child: Center(
                child: controller.quizState == ApiState.success
                    ? Wrap(
                        crossAxisAlignment: WrapCrossAlignment.center,
                        spacing: 10,
                        runSpacing: 10,
                        children: (controller.quizzes != null &&
                                controller.quizzes!.isNotEmpty)
                            ? controller.quizzes!
                                .map((item) => QuizCardWidget(
                                      quiz: QuizModel(
                                        label: item.label,
                                        icon: item.icon,
                                        progress: item.progress,
                                        level: item.level,
                                        topics: item.topics,
                                      ),
                                    ))
                                .toList()
                            : [],
                      )
                    : CircularProgressIndicator(
                        valueColor:
                            AlwaysStoppedAnimation<Color>(AppColors.darkGreen),
                      ),
              ),
            ),
            SizedBox(
              height: 20,
            )
          ],
        ),
      ),
    );
  }
}
