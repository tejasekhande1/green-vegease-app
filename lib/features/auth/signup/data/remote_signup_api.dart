import 'package:dio/dio.dart';
import 'package:green_vegease/core/constants/constants.dart';
import 'package:retrofit/http.dart';
import '../domain/models/signup_model.dart';

part 'remote_signup_api.g.dart';

@RestApi(baseUrl: Constants.apiAuthBaseUrl)
abstract class AuthService {
  factory AuthService(Dio dio, {String baseUrl,}) = _AuthService;

  @POST("/signup")
  Future<void> signup(@Body() SignUp signup);
}

//--> using http
    // try {
    //   var url = Uri.parse('http://192.168.61.60:8000/api/v1/auth/signup');
    //   var response = await http.post(url, body: {
    //     "firstname": "avi",
    //     "lastname": "ekhande",
    //     "username": "Avi@1",
    //     "mobileNumber": "9096476654",
    //     "email": "avi@gmail.com",
    //     "password": "Avi@12345",
    //     "confirmedPassword": "Avi@12345"
    //   });
    //   log("${response.body}");
    // } catch (e) {
    //   log("$e");
    //   throw Exception(e);
    // }
