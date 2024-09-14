import 'package:dio/dio.dart';
import 'package:green_vegease/core/config/config.dart';
import 'package:green_vegease/features/auth/forgot_password/data/model/forgot_pass_word_model.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

part 'remote_reset_pass_api.g.dart';

@RestApi(baseUrl: AppConfig.apiBaseUrl)
abstract class ForgotPassWordApiService {
  factory ForgotPassWordApiService(
    Dio dio, {
    String baseUrl,
  }) = _ForgotPassWordApiService;

  @PATCH("/reset-password")
  Future<ForgotPassWordModel> forgotPassword(
      @Body() Map<String, dynamic> resetPass);
}
