
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../../core/constants/constants.dart';
import '../model/login_model.dart';

part 'remote_login_api.g.dart';

@RestApi(baseUrl: Constants.apiAuthBaseUrl)
abstract class LoginApiService {
  factory LoginApiService(
    Dio dio, {
    String baseUrl,
  }) = _LoginApiService;

  @POST("/login")
  Future<LogInModel> logIn(@Body() Map<String,dynamic> login);
}
