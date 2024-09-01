import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/common/widgets/button_widget.dart';
import 'package:green_vegease/core/theme/colors.dart';
import 'package:green_vegease/features/onboarding/presentation/widgets/logo_widget.dart';
import 'package:green_vegease/features/onboarding/presentation/widgets/subtitle_widget.dart';
import '../../../../core/routes/app_router.dart';
import '../widgets/title_text_widget.dart';

@RoutePage()
class OnboardPage extends StatefulWidget {
  const OnboardPage({super.key});

  @override
  State<OnboardPage> createState() => _OnboardPageState();
}

class _OnboardPageState extends State<OnboardPage> {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: kColorTransparent, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/images/on_bording (1).png',
              fit: BoxFit.fill,
            ),
          ),
          Column(
            children: [
              const Spacer(),
              const LogoWidget(),
              SizedBox(height: 30.h),
              const TitleTextWidget(text: "Welcome"),
              SizedBox(height: 15.h),
              const TitleTextWidget(text: "to our store"),
              SizedBox(height: 15.h),
              const SubtitleWidget(
                  text: "Get your groceries in as fast as one hour"),
              SizedBox(height: 45.h),
              GestureDetector(
                onTap: () {
                  AutoRouter.of(context).push(const LoginPageRoute());
                },
                child: Container(
                  margin: EdgeInsets.symmetric(horizontal: 20.w),
                  child: const ButtonWidget(title: "Get Started"),
                ),
              ),
              SizedBox(height: 75.h),
            ],
          )
        ],
      ),
    );
  }
}
