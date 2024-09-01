import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/theme/colors.dart';
import 'package:green_vegease/core/theme/text_styles.dart';

class CustomSnackbar {
  static void show(
    BuildContext context,
    String message, {
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
          bottom: MediaQuery.of(context).size.height - 100,
          left: 10,
          right: 10), 
    );

    ScaffoldMessenger.of(context).showSnackBar(snackbar);
  }
}
