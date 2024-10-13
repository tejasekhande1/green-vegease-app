import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_styles.dart';

class ForgotPasswordTextWidget extends StatelessWidget {
  const ForgotPasswordTextWidget(
      {super.key,
      required this.mobileNumberController,
      required this.passwordController});
  final TextEditingController passwordController;
  final TextEditingController mobileNumberController;

  clearController() {
    passwordController.clear();
    mobileNumberController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            AutoRouter.of(context)
                .push(const ForgotPasswordPageRoute())
                .then((onValue) {
              clearController();
            });
          },
          child: Text(
            "Forgot Password?",
            style: kTextStyleGilroy500.copyWith(
              fontSize: 14.sp,
              color: kColorBlack,
            ),
          ),
        ),
      ],
    );
  }
}
