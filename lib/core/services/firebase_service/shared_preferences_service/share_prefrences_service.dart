import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesService {
  final SharedPreferences sharedPreferences;

  SharedPreferencesService(this.sharedPreferences);

  Future<void> saveToken(String token) async {
    await sharedPreferences.setString('auth_token', token);
  }

  // Static method to retrieve the token
  Future<String?> getToken() async {
    String? token = sharedPreferences.getString('auth_token');
    return token;
  }

  Future<void> saveLoginStatus(bool isLoggedIn) async {
    sharedPreferences.setBool('isLoggedIn', isLoggedIn); // Save the login status
  }

  Future<bool> checkLoginStatus() async {
    return sharedPreferences.getBool('isLoggedIn') ?? false; // Return false if not found
  }

  Future<void> logout() async {
    sharedPreferences.remove('isLoggedIn'); // Remove the login status
    sharedPreferences.remove('userToken'); // Optionally, remove other stored data like token
  }
}
