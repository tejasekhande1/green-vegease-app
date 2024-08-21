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
          _buildBackgroundImage(),
          _buildContent(),
        ],
      ),
    );
  }

  Widget _buildBackgroundImage() {
    return Positioned.fill(
      child: Image.asset(
        'assets/images/on_bording (1).png',
        fit: BoxFit.fill,
      ),
    );
  }

  Widget _buildContent() {
    return Column(
      children: [
        const Spacer(),
        _buildLogo(),
        SizedBox(height: 30.h),
        _buildTitleText("Welcome"),
        SizedBox(height: 15.h),
        _buildTitleText("to our store"),
        SizedBox(height: 15.h),
        _buildSubtitleText("Get your groceries in as fast as one hour"),
        SizedBox(height: 45.h),
        _buildGetStartedButton(),
        SizedBox(height: 75.h),
      ],
    );
  }

  Widget _buildLogo() {
    return SizedBox(
      height: 56.h,
      width: 48.w,
      child: SvgPicture.asset(
        "assets/images/carrot.svg",
        fit: BoxFit.contain,
      ),
    );
  }

  Widget _buildTitleText(String text) {
    return Text(
      text,
      style: TextStyle(
        height: 0.7,
        fontWeight: FontWeight.w500,
        fontFamily: 'Gilroy',
        fontSize: 48.sp,
        color: kColorWhite,
      ),
      textAlign: TextAlign.center,
    );
  }

  Widget _buildSubtitleText(String text) {
    return Text(
      text,
      style: TextStyle(
        fontFamily: 'Gilroy',
        fontSize: 16.sp,
        color: kColorLiteWhite,
      ),
      textAlign: TextAlign.center,
    );
  }

// --> Get Started Button
  Widget _buildGetStartedButton() {
    return GestureDetector(
      onTap: () {
        AutoRouter.of(context).push(const LoginPageRoute());
      },
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 20.w),
        child: const ButtonWidget(title: "Get Started"),
      ),
    );
  }
}
