import 'package:flutter/material.dart';
import 'package:learn_flutter/api/quiz.dart';
import 'package:learn_flutter/api/user.dart';
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
    UserApi userApi = UserApi();
    user = await userApi.getMyUser();
    userState = ApiState.success;
    notifyListeners(); // Notifica mudanças no estado do usuário
  }

  void getQuizzes() async {
    quizState = ApiState.loading;
    notifyListeners(); // Notifica que o estado está em carregamento

    QuizApi quizApi = QuizApi();
    quizzes = await quizApi.getQuizzes();
    quizState = ApiState.success;
    notifyListeners(); // Notifica que o carregamento foi concluído
  }
}
