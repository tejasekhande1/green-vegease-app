import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';
import 'package:retrofit/retrofit.dart';
import '../../../../core/constants/constants.dart';
part 'remote_signup_api.g.dart';

@RestApi(baseUrl: Constants.apiAuthBaseUrl)
abstract class ApiService {
  factory ApiService(Dio dio, {String baseUrl}) = _ApiService;

  //--> Get Request
  @POST('/signup')
  Future<dynamic> SignUp(
      @Field('firstname') String firstName,
      @Field('lastname') String lastName,
      @Field('username') String userName,
      @Field('mobileNumber') String mobileNumber,
      @Field('email') String email,
      @Field('password') String password,
      @Field('confirmedPassword') String confirmedPassword);
}
