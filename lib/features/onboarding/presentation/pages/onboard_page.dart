import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_vegease/core/theme/colors.dart';

import '../../../../core/routes/app_router.dart';

@RoutePage()
class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      b
      body: Stack(
        children: [
          Image.asset(
            'assets/images/onbording.png',
            fit: BoxFit.cover,
            height: 896.h,
            width: 414.w,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 30.h,
                width: 414.w,
              ),
              const Spacer(),
              SvgPicture.asset(
                "assets/images/carrot.svg",
                height: 56.h,
                width: 48.w,
              ),
              SizedBox(
                height: 35.h,
              ),
              Text(
                "Welcome",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Gilroy',
                    fontSize: 48.sp,
                    color: kColorWhite),
              ),
              Text(
                "to our store",
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Gilroy',
                    fontSize: 48.sp,
                    color: kColorWhite),
              ),
              Text(
                "Ger your groceries in as fast as one hour",
                style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 16.sp,
                    color: kColorLiteWhite),
              ),
              SizedBox(
                height: 40.h,
              ),
              GestureDetector(
                onTap: () {
                  AutoRouter.of(context).replace(const LoginPageRoute());
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 30.5.w),
                  height: 57.h,
                  decoration: BoxDecoration(
                      color: kColorPrimary,
                      borderRadius: BorderRadius.circular(19)),
                  child: Center(
                    child: Text(
                      "Get Started",
                      style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontFamily: 'Gilroy',
                          fontSize: 18.sp,
                          color: kColorWhite),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              )
            ],
          )
        ],
      ),
    );
  }
}
