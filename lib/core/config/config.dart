class AppConfig {
  //Basic auth credentials
  static const String username = 'admin';
  static const String password = 'mypcot';
  static const String acceptedLanguage = 'en';

  //--> local base Url
  static const String apiBaseUrl = "http://192.168.244.60:8000/api/v1";

  //-> api
  static const String category = '/category';

  //---> Authentication
  static const String resetPassword = '/auth/reset-password';
  static const String login = '/auth/login';
  static const String signUp = '/auth/signup';
}
