import 'package:flutter/material.dart';
import 'package:learn_flutter/api/quiz_api.dart';
import 'package:learn_flutter/models/quiz_model.dart';
import 'package:learn_flutter/models/user_model.dart';
import 'package:learn_flutter/pages/home/home_state.dart';

class HomeController extends ChangeNotifier {
  ApiState userState = ApiState.empty;
  ApiState quizState = ApiState.empty;

  UserModel? user;
  List<QuizModel>? quizzes;

  void getUser() async {
    userState = ApiState.loading;
    await Future.delayed(Duration(seconds: 1));

    user = UserModel(
      name: 'Juanfarias.dev',
      photoUrl: 'https://avatars.githubusercontent.com/u/77401614?v=4',
    );
    userState = ApiState.success;
    notifyListeners(); // Notifica mudanças no estado do usuário
  }

  void getQuizzes() async {
    quizState = ApiState.loading;
    notifyListeners(); // Notifica que o estado está em carregamento

    await Future.delayed(Duration(seconds: 1));
    quizzes = learningPath;
    quizState = ApiState.success;
    notifyListeners(); // Notifica que o carregamento foi concluído
  }
}
