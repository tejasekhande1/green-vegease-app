import 'dart:async';
import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_vegease/core/theme/colors.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/theme/text_styles.dart';

@RoutePage()
class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    // Timer(
    //     const Duration(seconds: 2),
    //     () => Timer(const Duration(seconds: 2), () {
    //           AutoRouter.of(context).replace(isLogin() != null
    //               ? const CommonbottomnavigationbarRoute()
    //               : const OptionScreenRoute());
    //         }));
    Timer(
        const Duration(seconds: 2),
        () => Timer(const Duration(seconds: 2), () {
              AutoRouter.of(context).replace(const OnboardPageRoute());
            }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorPrimary,
      body: Padding(
        padding: EdgeInsets.all(10.h),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SvgPicture.asset("assets/images/carrot.svg",
                    height: 63.h, width: 54.w, fit: BoxFit.fill),
                SizedBox(
                  width: 18.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Green Vegease",
                      style: kTextStyleGilroy600.copyWith(
                          height: 1.2, fontSize: 35.sp, color: kColorWhite),
                    ),
                    Text(
                      " o n l i n e   g r o c e r i e t",
                      style: kTextStyleGilroy400.copyWith(
                          wordSpacing: 6.4.sp,
                          height: 1,
                          fontSize: 14.sp,
                          color: kColorWhite),
                    ),
                  ],
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
