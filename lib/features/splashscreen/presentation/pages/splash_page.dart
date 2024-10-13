import 'dart:async';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_vegease/core/theme/colors.dart';
import '../../../../core/routes/app_router.dart';
import '../../../../core/services/firebase_service/shared_preferences_service/share_prefrences_service.dart';
import '../../../../core/theme/text_styles.dart';
import '../../../init_dependancies.dart';

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
    final isLogin =
        serviceLocator<SharedPreferencesService>().checkLoginStatus();
    Timer(
        const Duration(seconds: 2),
        () => Timer(const Duration(seconds: 2), () async {
              AutoRouter.of(context).replace(await isLogin
                  ? const OrdersPageRoute()
                  : const OnboardPageRoute());
            }));
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    precacheImage(
        Image.asset('assets/images/on_bording (1).png').image, context);
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarColor: kColorTransparent, //or set color with: Color(0xFF0000FF)
    ));
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
                SizedBox(
                  height: 63.h,
                  width: 54.w,
                  child: SvgPicture.asset("assets/images/carrot.svg",
                      fit: BoxFit.fill),
                ),
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
