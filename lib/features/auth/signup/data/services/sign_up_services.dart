import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../../../core/utils/utils.dart';
import '../api/remote_signup_api.dart';
import '../model/signup_model.dart';


class SignUpService {
  final SignUpApiService _signUpApi;
  final Dio _dio;
  SignUpService({required SignUpApiService signUpApi, required Dio dio})
      : _signUpApi = signUpApi,
        _dio = dio;

  Future<SignUpModel> signUp(Map<String, dynamic> body) async {
    try {
      debugPrint("in SignUp Service before headers");
      // final headers = {
      //   // 'Authorization': await Utils.authHeader(),
      //   "content-type": "application/json",
      //   "uuid": "12345",
      //   "Accept-Language": "en",
      //   "platform": "android"
      // };
      debugPrint("in SignUp service");
      // _dio.options.headers = headers;

      _dio.interceptors.add(Utils.getLoggingInterceptor());
      final data = await _signUpApi.signUp(body);
      return data;
    } catch (e) {
      throw Exception("Failed to SignUp user");
    }
  }
}
