import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../../../core/common/widgets/snackbar_widget.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_styles.dart';

@RoutePage()
class VerificationPage extends StatelessWidget {
  VerificationPage({super.key});

  final TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: kColorTransparent, //or set color with: Color(0xFF0000FF)
    ));
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: kColorWhite,
      body: Stack(children: [
        Image.asset(
          "assets/images/login_background.png",
          width: 414.w,
          height: 896.h,
          fit: BoxFit.fill,
        ),
        Padding(
          padding: EdgeInsets.all(24.h),
          child:
              Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
            SizedBox(
              height: 35.h,
            ),
            GestureDetector(
                onTap: () {
                  AutoRouter.of(context).popForced();
                },
                child: SvgPicture.asset(
                  "assets/icons/back_arrow.svg",
                  height: 18.h,
                  width: 10.w,
                  fit: BoxFit.fill,
                )),
            SizedBox(
              height: 65.h,
            ),
            Text(
              "Enter your 4-digit code",
              style: kTextStyleGilroy600.copyWith(
                color: kColorBlack,
                fontSize: 26.sp,
              ),
            ),
            SizedBox(
              height: 27.h,
            ),
            Text(
              "Code",
              style: kTextStyleGilroy600.copyWith(
                color: kColorGrey,
                fontSize: 16.sp,
              ),
            ),
            Container(
              decoration: const BoxDecoration(
                border: Border(
                  bottom: BorderSide(color: kColorTextFieldBorder),
                ),
              ),
              child: TextFormField(
                inputFormatters: [
                  FilteringTextInputFormatter.digitsOnly,
                  LengthLimitingTextInputFormatter(4),
                ],
                keyboardType: TextInputType.number,
                controller: otpController,
                cursorHeight: 25,
                style: kTextStyleGilroy400.copyWith(
                  fontSize: 18.sp,
                  color: kColorBlack,
                ),
                decoration: InputDecoration(
                  hintText: "- - - -",
                  hintStyle: kTextStyleGilroy400.copyWith(
                    color: kColorTextHint,
                    fontSize: 16.sp,
                  ),
                  border: InputBorder.none,
                ),
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            GestureDetector(
              onTap: () {},
              child: Text(
                "Resend Code",
                style: kTextStyleGilroy500.copyWith(
                    fontSize: 18.sp, color: kColorPrimary),
              ),
            )
          ]),
        )
      ]),
      floatingActionButton: FloatingActionButton(
        shape: const CircleBorder(),
        backgroundColor: kColorPrimary,
        onPressed: () {
          FocusScope.of(context).unfocus();
          if (otpController.text.trim().isNotEmpty &&
              otpController.text.trim().length == 4) {
            CustomSnackbar.show(context, "SignUp successful",
                backgroundColor: kColorPrimary, isFloatingButton: true);
          } else {
            CustomSnackbar.show(context, "Please enter valid otp",
                backgroundColor: kColorRed, isFloatingButton: true);
          }
        },
        child: SvgPicture.asset(
          "assets/icons/forward_arrow.svg",
          height: 18.h,
          width: 10.w,
          fit: BoxFit.fill,
        ),
      ),
    );
  }
}
