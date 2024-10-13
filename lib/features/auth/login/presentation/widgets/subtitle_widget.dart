import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_styles.dart';

class SubtitleWidget extends StatelessWidget {
  const SubtitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Text(
      "Enter your mobile number and password",
      style: kTextStyleGilroy500.copyWith(
        color: kColorGrey,
        fontSize: 16.sp,
      ),
    );
  }
}