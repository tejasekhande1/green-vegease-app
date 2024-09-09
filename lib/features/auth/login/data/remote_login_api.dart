
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../../../../core/constants/constants.dart';
import '../domain/model/login_model.dart';

part 'remote_login_api.g.dart';

@RestApi(baseUrl: Constants.apiAuthBaseUrl)
abstract class LoginService {
  factory LoginService(
    Dio dio, {
    String baseUrl,
  }) = _LoginService;

  @POST("/login")
  Future<void> logIn(@Body() LogIn login);
}
