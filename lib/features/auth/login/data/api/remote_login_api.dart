import 'package:dio/dio.dart';
import 'package:green_vegease/core/config/config.dart';
import 'package:retrofit/retrofit.dart';
import '../model/login_model.dart';

part 'remote_login_api.g.dart';

@RestApi(baseUrl: AppConfig.apiBaseUrl)
abstract class LoginApiService {
  factory LoginApiService(
    Dio dio, {
    String baseUrl,
  }) = _LoginApiService;

  @POST(AppConfig.login)
  Future<LogInModel> logIn(@Body() Map<String, dynamic> login);
}
