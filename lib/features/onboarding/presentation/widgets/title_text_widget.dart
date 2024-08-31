import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

class TitleTextWidget extends StatelessWidget {
  final String text;
  const TitleTextWidget({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: kTextStyleGilroy500.copyWith(
        height: 0.7,
        fontSize: 48.sp,
        color: kColorWhite,
      ),
      textAlign: TextAlign.center,
    );
  }
}
