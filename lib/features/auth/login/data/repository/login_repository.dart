import 'package:flutter/widgets.dart';
import '../model/login_model.dart';
import '../services/login_services.dart';

class LoginRepository {
  final LoginService _service;
  LoginRepository({required LoginService loginService})
      : _service = loginService;

  Future<LogInModel> loginUser(Map<String, dynamic> body) async {
    try {
      debugPrint("in Login repo");
      return await _service.login(body);
    } catch (e) {
      throw Exception("Failed to login user :$e");
    }
  }
}
