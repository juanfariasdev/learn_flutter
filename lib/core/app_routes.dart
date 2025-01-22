// lib/core/app_routes.dart
import 'package:flutter/material.dart';
import 'package:learn_flutter/models/quiz_model.dart';
import 'package:learn_flutter/pages/challenge/challenge_page.dart';
import 'package:learn_flutter/pages/challenge/confirmation_page.dart';
import 'package:learn_flutter/pages/home/home_page.dart';
import 'package:learn_flutter/pages/topic/topic_page.dart';

class AppRoutes {
  static const String home = '/';
  static const String topic = '/topic';
  static const String challenge = '/challenge';
  static const String confirmation = '/confirmation';

  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case home:
        return MaterialPageRoute(
          builder: (_) => HomePage(),
          settings: settings, // Adiciona o RouteSettings
        );
      case topic:
        final quiz = settings.arguments as QuizModel?;
        return MaterialPageRoute(
          builder: (_) => TopicPage(quiz: quiz!),
          settings: settings, // Adiciona o RouteSettings
        );
      case challenge:
        final args = settings.arguments as Map?;
        return MaterialPageRoute(
          builder: (_) => ChallengePage(
            questions: args?['questions'] ?? [],
            answers: args?['answers'],
            currentQuestionIndex: args?['currentQuestionIndex'] ?? 0,
          ),
          settings: settings, // Adiciona o RouteSettings
        );
      case confirmation:
        final args = settings.arguments as Map?;
        return MaterialPageRoute(
          builder: (_) => ConfirmationPage(
            questions: args?['questions'] ?? [],
            answers: args?['answers'] ?? [],
          ),
          settings: settings, // Adiciona o RouteSettings
        );
      default:
        return MaterialPageRoute(
          builder: (_) => Scaffold(
            body: Center(child: Text('Page not found')),
          ),
          settings: settings, // Adiciona o RouteSettings
        );
    }
  }
}
