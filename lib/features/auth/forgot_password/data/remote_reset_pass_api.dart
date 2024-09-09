import 'package:dio/dio.dart';
import 'package:green_vegease/core/constants/constants.dart';
import 'package:green_vegease/features/auth/forgot_password/domain/reset_pass_model.dart';
import 'package:retrofit/http.dart';

part 'remote_reset_pass_api.g.dart';

@RestApi(baseUrl: Constants.apiAuthBaseUrl)
abstract class ResetPassService {
  factory ResetPassService(
    Dio dio, {
    String baseUrl,
  }) = _ResetPassService;

  @PATCH("/reset-password")
  Future<void> resetPassword(@Body() ResetPassword resetPass);
}


