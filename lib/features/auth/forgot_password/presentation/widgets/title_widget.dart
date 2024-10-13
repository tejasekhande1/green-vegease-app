import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_styles.dart';

class TitleWidget extends StatelessWidget {
  const TitleWidget({super.key,required this.label});
  final String label;

  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: kTextStyleGilroy600.copyWith(
        color: kColorBlack,
        fontSize: 26.sp,
      ),
    );
  }
}
