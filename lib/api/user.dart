import 'package:flutter/material.dart';
import 'package:learn_flutter/models/user_model.dart';

import 'json.dart'; // Seu arquivo json.dart

class UserApi {
  Future<UserModel> getMyUser() async {
    WidgetsFlutterBinding.ensureInitialized();
    final userData = await getItem('database/user.json');
    return UserModel.fromMap(userData);
  }
}
