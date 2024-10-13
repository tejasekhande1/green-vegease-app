import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/theme/text_styles.dart';

class SignUpPromptWidget extends StatelessWidget {
  const SignUpPromptWidget(
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
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Don’t have an account? ",
          style: kTextStyleGilroy600.copyWith(
            fontSize: 14.sp,
            color: kColorBlack,
          ),
        ),
        GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            AutoRouter.of(context).push(const SingupPageRoute()).then((value) {
              clearController();
            });
          },
          child: Text(
            "Signup",
            style: kTextStyleGilroy600.copyWith(
              fontSize: 14.sp,
              color: kColorPrimary,
            ),
          ),
        ),
      ],
    );
  }
}