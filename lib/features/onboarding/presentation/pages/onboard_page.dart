import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_vegease/core/common/widgets/button_widget.dart';
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
      body: Stack(
        children: [
          SizedBox(
            height: 896.h,
            width: 414.w,
            child: Image.asset(
              'assets/images/on_bording.png',
              fit: BoxFit.cover,
            ),
          ),
          Column(
            children: [
              SizedBox(
                width: 414.w,
              ),
              const Spacer(),
              SizedBox(
                height: 56.h,
                width: 48.w,
                child: SvgPicture.asset(
                  "assets/images/carrot.svg",
                  fit: BoxFit.contain,
                ),
              ),
              SizedBox(
                height: 30.h,
              ),
              Text(
                "Welcome",
                style: TextStyle(
                    height: 0.7,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Gilroy',
                    fontSize: 48.sp,
                    color: kColorWhite),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "to our store",
                style: TextStyle(
                    height: 0.7,
                    fontWeight: FontWeight.w500,
                    fontFamily: 'Gilroy',
                    fontSize: 48.sp,
                    color: kColorWhite),
              ),
              SizedBox(
                height: 15.h,
              ),
              Text(
                "Ger your groceries in as fast as one hour",
                style: TextStyle(
                    fontFamily: 'Gilroy',
                    fontSize: 16.sp,
                    color: kColorLiteWhite),
              ),
              SizedBox(
                height: 45.h,
              ),
              GestureDetector(
                  onTap: () {
                    // AutoRouter.of(context).push(const LoginPageRoute());
                  },
                  child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 20.w),
                      child: const ButtonWidget(title: "Get Started"))),
              SizedBox(
                height: 75.h,
              )
            ],
          )
        ],
      ),
    );
  }
}
