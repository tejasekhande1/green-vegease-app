import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../theme/colors.dart';
import '../theme/text_styles.dart';

class Utils {

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
