import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import '../../../../../core/utils/utils.dart';
import '../api/remote_reset_pass_api.dart';
import '../model/forgot_pass_word_model.dart';

class ForgotPassWordService {
  final ForgotPassWordApiService _forgotPassWordApi;
  final Dio _dio;
  ForgotPassWordService(
      {required ForgotPassWordApiService forgotPassWordApi, required Dio dio})
      : _forgotPassWordApi = forgotPassWordApi,
        _dio = dio;

  Future<ForgotPassWordModel> forgotPassWord(Map<String, dynamic> body) async {
    try {
      debugPrint("in ForgotPassWord Service before headers");
      // final headers = {
      //   // 'Authorization': await Utils.authHeader(),
      //   "content-type": "application/json",
      //   "uuid": "12345",
      //   "Accept-Language": "en",
      //   "platform": "android"
      // };
      debugPrint("in ForgotPassWord service");
      // _dio.options.headers = headers;

      _dio.interceptors.add(Utils.getLoggingInterceptor());
      final data = await _forgotPassWordApi.forgotPassword(body);
      return data;
    } on DioException catch (e) {
      // Assuming `e` is a DioError and contains a response
      if (e.response != null) {
        return ForgotPassWordModel(
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
