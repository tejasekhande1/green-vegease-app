import 'package:flutter/widgets.dart';

import '../model/forgot_pass_word_model.dart';
import '../services/forgot_pass_word_services.dart';


class ForgotPassWordRepository {
  final ForgotPassWordService _service;
  ForgotPassWordRepository({required ForgotPassWordService forgotPassWordService})
      : _service = forgotPassWordService;

  Future<ForgotPassWordModel> forgotPass(Map<String, dynamic> body) async {
    try {
      debugPrint("in forgot pass repo");
      return await _service.forgotPassWord(body);
    } catch (e) {
      throw Exception("Failed to ForgotPassWord user :$e");
    }
  }
}
