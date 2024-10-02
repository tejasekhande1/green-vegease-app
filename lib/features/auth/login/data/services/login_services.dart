import 'dart:developer';

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
      debugPrint("in Login service");
      // _dio.options.headers = headers;

      _dio.interceptors.add(Utils.getLoggingInterceptor());
      final data = await _loginApi.logIn(body);
      return data;
    } on DioException catch (e) {
      // Assuming `e` is a DioError and contains a response
      if (e.response != null) {
        return LogInModel(success: false, message: e.response!.data['message']);
      } else {
        throw Exception("Failed to Login user :$e");
      }
    } catch (e) {
      // Default exception in case it's not a DioError or doesn't contain a response
      throw Exception("Failed to Login user :$e");
    }
  }
}
