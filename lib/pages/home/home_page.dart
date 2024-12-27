import 'package:flutter/material.dart';
import 'package:learn_flutter/core/core.dart';
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
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        return Scaffold(
          appBar: controller.user != null
              ? AppBarWidget(user: controller.user!)
              : PreferredSize(
                  preferredSize: const Size.fromHeight(60),
                  child: SafeArea(
                    child: SizedBox(
                      height: double.infinity,
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: AppConfig.mobilePadding),
                        child: Center(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      AppColors.darkRed),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "Carregando dados do usuário...",
                                style: AppTextStyles.heading16,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
          body: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            child: Column(
              children: [
                // Botões de níveis
                Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
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
                // Corpo principal
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: AppConfig.mobilePadding),
                  child: Center(
                    child: controller.quizState == ApiState.loading
                        ? Row(
                            children: [
                              SizedBox(
                                width: 20,
                                height: 20,
                                child: CircularProgressIndicator(
                                  strokeWidth: 3,
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                      AppColors.darkGreen),
                                ),
                              ),
                              const SizedBox(width: 10),
                              Text(
                                "Carregando tópicos...",
                                style: AppTextStyles.heading16,
                              ),
                            ],
                          )
                        : controller.quizState == ApiState.success &&
                                controller.quizzes != null &&
                                controller.quizzes!.isNotEmpty
                            ? Wrap(
                                crossAxisAlignment: WrapCrossAlignment.center,
                                spacing: 10,
                                runSpacing: 10,
                                children: controller.quizzes!
                                    .map((item) => QuizCardWidget(quiz: item))
                                    .toList(),
                              )
                            : controller.quizState == ApiState.error
                                ? Text(
                                    "Erro ao carregar quizzes",
                                    style: TextStyle(color: Colors.red),
                                  )
                                : Text(
                                    "Nenhum quiz disponível",
                                    style: TextStyle(color: AppColors.grey),
                                  ),
                  ),
                ),
                const SizedBox(height: 20),
              ],
            ),
          ),
        );
      },
    );
  }
}
