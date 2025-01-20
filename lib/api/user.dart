import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:learn_flutter/models/user_model.dart';

class UserApi {
  Future<UserModel?> getMyUser() async {
    WidgetsFlutterBinding.ensureInitialized();
    final userDataResponse =
        await http.get(Uri.parse("http://10.0.2.2:3000/api/user/me"));

    if (userDataResponse.statusCode == 200) {
      final userData = utf8.decode(
          userDataResponse.bodyBytes); // Decodificando explicitamente com UTF-8
      final user = jsonDecode(userData) as Map<String, dynamic>;

      return UserModel.fromMap(user);
    }

    return null;
  }
}
