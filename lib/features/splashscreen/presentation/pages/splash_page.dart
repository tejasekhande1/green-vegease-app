import 'package:auto_route/annotations.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_vegease/core/theme/colors.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorPrimary,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset(
                "assets/images/carrot.svg",
                height: 63.h,
                width: 54.w,
              ),
              SizedBox(
                width: 18.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Green Vegease",
                    style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontWeight: FontWeight.w600,
                        fontSize: 40.sp,
                        color: kColorWhite),
                  ),
                  Text(
                    "o n l i n e   g r o c e r i e t",
                    style: TextStyle(
                        fontFamily: 'Gilroy',
                        fontSize: 14.sp,
                        color: kColorWhite),
                  )
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
