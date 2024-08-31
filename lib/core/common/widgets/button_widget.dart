import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../theme/colors.dart';
import '../../theme/text_styles.dart';

class ButtonWidget extends StatelessWidget {
  final String title;
  const ButtonWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 15.h),
      decoration: BoxDecoration(
          color: kColorPrimary, borderRadius: BorderRadius.circular(19)),
      child: Center(
        child: Text(
          title,
          style:
              kTextStyleGilroy600.copyWith(fontSize: 18.sp, color: kColorWhite),
        ),
      ),
    );
  }
}
