import 'package:dio/dio.dart';
import 'package:green_vegease/core/config/config.dart';
import 'package:retrofit/retrofit.dart';
import '../model/signup_model.dart';
part 'remote_signup_api.g.dart';

@RestApi(baseUrl: AppConfig.apiBaseUrl)
abstract class SignUpApiService {
  factory SignUpApiService(
    Dio dio, {
    String baseUrl,
  }) = _SignUpApiService;

  @POST("/auth/signup")
  Future<SignUpModel> signUp(@Body() Map<String,dynamic> signUp);
}

