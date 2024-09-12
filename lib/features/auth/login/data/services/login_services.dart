import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../../../core/utils/utils.dart';
import '../api/remote_login_api.dart';
import '../model/login_model.dart';

class LoginService {
  final LoginApiService _loginApi;
  final Dio _dio;
  LoginService({required LoginApiService loginApi, required Dio dio})
      : _loginApi = loginApi,
        _dio = dio;

  Future<LogInModel> login(Map<String, dynamic> body) async {
    try {
      debugPrint("in Login Service before headers");
      // final headers = {
      //   // 'Authorization': await Utils.authHeader(),
      //   "content-type": "application/json",
      //   "uuid": "12345",
      //   "Accept-Language": "en",
      //   "platform": "android"
      // };
      debugPrint("in Login service");
      // _dio.options.headers = headers;

      _dio.interceptors.add(Utils.getLoggingInterceptor());
      final data = await _loginApi.logIn(body);
      return data;
    } catch (e) {
      // Assuming `e` is a DioError and contains a response
      if (e is DioException && e.response != null) {
        final response = e.response?.data;
        final message = response['message'] ?? 'An unknown error occurred';

        // Throw custom exception with the message
        throw Exception(message);
      } else {
        // Default exception in case it's not a DioError or doesn't contain a response
        throw Exception("Failed to Login user");
      }
    }
  }
}
