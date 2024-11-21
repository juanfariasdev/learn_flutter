import 'package:flutter/material.dart';
import 'package:learn_flutter/pages/splash/splash_page.dart';

class AppWidget extends StatelessWidget {
  const AppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: "DevQuiz",
      home: SplashPage(),
    );
  }
}
