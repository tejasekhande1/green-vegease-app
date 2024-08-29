import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 56.h,
      width: 48.w,
      child: SvgPicture.asset(
        "assets/images/carrot.svg",
        fit: BoxFit.fill,
      ),
    );
  }
}