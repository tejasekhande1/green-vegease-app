import 'package:dio/dio.dart';
import 'package:green_vegease/core/constants/constants.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import '../model/signup_model.dart';

part 'remote_signup_api.g.dart';

@RestApi(baseUrl: Constants.apiAuthBaseUrl)
abstract class SignUpApiService {
  factory SignUpApiService(
    Dio dio, {
    String baseUrl,
  }) = _SignUpApiService;

  @POST("/signup")
  Future<SignUpModel> signUp(@Body() Map<String,dynamic> signUp);
}

