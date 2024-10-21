import 'dart:convert';
import 'dart:io';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:fluttertoast/fluttertoast.dart';
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
    Color backgroundColor = Colors.greenAccent,
    Color textColor = Colors.white,
    double fontSize = 14.0,
    Duration duration = const Duration(seconds: 3),
    double radius = 25.0,
    ToastGravity gravity = ToastGravity.TOP,
  }) {
    final fToast = FToast();

    fToast.init(context);
    Widget toast = Container(
      padding: const EdgeInsets.symmetric(horizontal: 24.0, vertical: 12.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(radius),
        color: backgroundColor,
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            message,
            style: kTextStyleGilroy400.copyWith(
                color: textColor, fontSize: fontSize.sp),
          ),
        ],
      ),
    );

    // Show the toast
    fToast.showToast(
      child: toast,
      gravity: gravity,
      toastDuration: duration,
    );
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
