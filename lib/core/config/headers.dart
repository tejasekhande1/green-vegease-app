import 'dart:io';
import 'package:flutter/material.dart';
import '../../features/init_dependancies.dart';
import '../services/firebase_service/shared_preferences_service/share_prefrences_service.dart';
import '../utils/utils.dart';
import 'config.dart';

class HeaderGenerator {
  final sharedPrefsService = serviceLocator<SharedPreferencesService>();
  static String? applicationVersion;
  Future<Map<String, String>> getHeaders(
      {String acceptType = "application/json"}) async {
    String basicAuth = await Utils.authHeader();
    String acceptedLanguages = AppConfig.acceptedLanguage;
    String platform = Platform.operatingSystem;
    applicationVersion = await Utils.getAppVersion();
    String? accessToken = await sharedPrefsService.getToken();
    dynamic deviceId = await Utils().getDeviceId();
    debugPrint("deviceId: " + deviceId);

    return {
      'authorization': basicAuth,
      'Accept-Language': acceptedLanguages,
      'access-token': accessToken ?? "",
      'platform': platform,
      'uuid': deviceId,
      'version': applicationVersion!,
      'Accept': acceptType,
    };
  }
}
