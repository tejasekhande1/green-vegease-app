
import 'package:flutter/widgets.dart';

import '../model/signup_model.dart';
import '../services/sign_up_services.dart';

class SignUpRepository {
  final SignUpService _service;
  SignUpRepository({required SignUpService signUpService})
      : _service = signUpService;

  Future<SignUpModel> signUpUser(Map<String, dynamic> body) async {
    try {
      debugPrint("in SignUp repo");
      return await _service.signUp(body);
    } catch (e) {
      throw Exception("Failed to register user :$e");
    }
  }
}
