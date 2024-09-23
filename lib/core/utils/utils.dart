import 'dart:convert';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../common/bloc/internet_bloc/internet_bloc.dart';
import '../config/config.dart';
import '../theme/colors.dart';
import '../theme/text_styles.dart';
import 'package:device_info_plus/device_info_plus.dart';

class Utils {
static Future<String> authHeader() async {
    String basicAuth =
        'Basic ${base64Encode(utf8.encode('${AppConfig.username}:${AppConfig.password}'))}';
    return basicAuth;
  }

  static Future<String> getAppVersion() async {
    PackageInfo? info = await PackageInfo.fromPlatform();
    return info.version.toString();
  }

  static void showCustomSnackBar(BuildContext context, String message) {
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text(message)));
  }

  Future<String?> getDeviceId() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    String? deviceId;
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      deviceId = androidInfo.id.toString();
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      deviceId = iosInfo.identifierForVendor.toString();
    }
    return deviceId;
  }
  static Future<bool> checkInternet(BuildContext context) async {
    final internetState = context.read<InternetBloc>().state;

    if (internetState.status == ConnectivityStatus.connected) {
      return true;
    } else {
      Utils.showCustomSnackBar(context,
          "No internet connection found. Please check connectivity and try again.");
      return false;
    }
  }
  static void customSnackBar(
    BuildContext context,
    String message, {
    bool isFloatingButton = false,
    Color backgroundColor = kColorPrimary,
    Color textColor = kColorWhite,
    Duration duration = const Duration(seconds: 3),
    SnackBarAction? action,
    double fontSize = 14.0,
    EdgeInsetsGeometry padding = const EdgeInsets.all(16.0),
    ShapeBorder shape = const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(8))),
  }) {
    final snackbar = SnackBar(
      content: Text(
        message,
        style: kTextStyleGilroy500.copyWith(
            color: textColor, fontSize: fontSize.sp),
      ),
      backgroundColor: backgroundColor,
      duration: duration,
      action: action,
      padding: padding,
      dismissDirection: DismissDirection.up,
      shape: shape,
      behavior: SnackBarBehavior.floating,
      margin: EdgeInsets.only(
          bottom: isFloatingButton
              ? MediaQuery.of(context).size.height - 170
              : MediaQuery.of(context).size.height - 100,
          left: 10,
          right: 10),
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }

  static InterceptorsWrapper getLoggingInterceptor() {
    int count = 0;
    return InterceptorsWrapper(
      onRequest: (options, handler) {
        count++;
        debugPrint('Request[${options.method}] => PATH: ${options.path}');
        debugPrint('Request HEADERS: ${options.headers}');
        debugPrint('Request DATA: ${options.data}');
        debugPrint('API call count: $count');
        return handler.next(options);
      },
      onResponse: (response, handler) {
        debugPrint(
            'Response[${response.statusCode}] => DATA: ${response.data}');
        return handler.next(response);
      },
      onError: (DioException e, handler) {
        debugPrint("test error:}");
        debugPrint('Error[${e.response?.statusCode}] => MESSAGE: ${e.message}');
        debugPrint('Error DATA: ${e.response?.data}');
        return handler.next(e);
      },
    );
  }
}
