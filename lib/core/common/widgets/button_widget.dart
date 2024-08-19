import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/colors.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  const ButtonWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 100.w, vertical: 15.h),
      decoration: BoxDecoration(
          color: kColorPrimary, borderRadius: BorderRadius.circular(19)),
      child: Center(
        child: Text(
          title,
          style: TextStyle(
              fontWeight: FontWeight.w600,
              fontFamily: 'Gilroy',
              fontSize: 18.sp,
              color: kColorWhite),
        ),
      ),
    );
  }
}
