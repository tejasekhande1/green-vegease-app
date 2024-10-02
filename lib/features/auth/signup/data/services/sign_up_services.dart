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

      debugPrint("in SignUp service");
      // _dio.options.headers = headers;

      _dio.interceptors.add(Utils.getLoggingInterceptor());
      final data = await _signUpApi.signUp(body);
      return data;
    } on DioException catch (e) {
      // Assuming `e` is a DioError and contains a response
      if (e.response != null) {
        return SignUpModel(
            success: false, message: e.response!.data['message']);
      } else {
        throw Exception("Failed to Login user :$e");
      }
    } catch (e) {
      // Default exception in case it's not a DioError or doesn't contain a response
      throw Exception("Failed to Login user :$e");
    }
  }
}
