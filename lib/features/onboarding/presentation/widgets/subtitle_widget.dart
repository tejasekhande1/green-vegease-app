import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/theme/colors.dart';
import '../../../../core/theme/text_styles.dart';

class SubtitleWidget extends StatelessWidget {
  final String text;
  const SubtitleWidget({super.key,required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: kTextStyleGilroy400.copyWith(
        fontSize: 16.sp,
        color: kColorLiteWhite,
      ),
      textAlign: TextAlign.center,
    );


  }
}
