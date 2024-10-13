import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LogoWidget extends StatelessWidget {
  const LogoWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(height: 77.25.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(
              height: 55.h,
              width: 48.w,
              child: SvgPicture.asset(
                "assets/images/colored_carrot.svg",
                // height: 55.h,
                fit: BoxFit.fill,
                // width: 48.w,
              ),
            ),
          ],
        ),
      ],
    );
  }
}