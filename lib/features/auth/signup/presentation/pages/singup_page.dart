import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_vegease/core/common/widgets/button_widget.dart';
import 'package:green_vegease/core/routes/app_router.dart';
import 'package:green_vegease/core/theme/colors.dart';

import '../../../../../core/common/widgets/snackbar_widget.dart';
import '../../../../../core/theme/text_styles.dart';

@RoutePage()
class SingupPage extends StatefulWidget {
  const SingupPage({super.key});

  @override
  State<SingupPage> createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool unShowPass = true;

  Icon _toggleIcon() {
    return Icon(
      size: 24.h,
      unShowPass ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
    );
  }

  bool unShowPass1 = true;

  Icon _toggleIcon1() {
    return Icon(
      size: 24.h,
      unShowPass ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kColorWhite,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _buildBackgroundImage(),
            Padding(
              padding: EdgeInsets.all(25.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 67.25.h),
                  _buildLogo(),
                  SizedBox(height: 50.h),
                  _buildTitle(),
                  SizedBox(height: 15.h),
                  _buildSubtitle(),
                  SizedBox(height: 24.h),
                  _buildTextField(
                      "Username", "Enter username", usernameController),
                  SizedBox(height: 30.h),
                  _buildTextField("Email", "Enter email id", emailController),
                  SizedBox(height: 20.h),
                  _buildPasswordField(),
                  SizedBox(height: 20.h),
                  _buildConfirmPasswordField(),
                  SizedBox(height: 20.h),
                  _buildTermsText(),
                  SizedBox(height: 30.h),
                  _buildSignUpButton(),
                  SizedBox(height: 25.h),
                  _buildLoginOption(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

//--> background Image
  Widget _buildBackgroundImage() {
    return Image.asset(
      "assets/images/login_background.png",
      width: 414.w,
      height: 896.h,
      fit: BoxFit.fill,
    );
  }

  Widget _buildLogo() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SvgPicture.asset(
          "assets/images/colored_carrot.svg",
          height: 55.h,
          fit: BoxFit.fill,
          width: 48.w,
        ),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      "Sign Up",
      style: kTextStyleGilroy600.copyWith(
        color: kColorBlack,
        fontSize: 26.sp,
      ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      "Enter your credentials to continue",
      style: kTextStyleGilroy500.copyWith(
        color: kColorGrey,
        fontSize: 16.sp,
      ),
    );
  }

  //--> UserName TextField and Email TextField
  Widget _buildTextField(
      String label, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
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
            controller: controller,
            cursorHeight: 25,
            style: kTextStyleGilroy400.copyWith(
              fontSize: 18.sp,
              color: kColorBlack,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: kTextStyleGilroy400.copyWith(
                color: kColorTextHint,
                fontSize: 16.sp,
              ),
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildConfirmPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Confirm Password",
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
            controller: confirmPasswordController,
            obscureText: unShowPass,
            cursorHeight: 25,
            style: kTextStyleGilroy400.copyWith(
              fontSize: 18.sp,
              color: kColorBlack,
            ),
            decoration: InputDecoration(
              hintText: "Confirm password",
              hintStyle: kTextStyleGilroy400.copyWith(
                color: kColorTextHint,
                fontSize: 16.sp,
              ),
              border: InputBorder.none,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    unShowPass1 = !unShowPass1;
                  });
                },
                child: _toggleIcon1(),
              ),
            ),
          ),
        ),
      ],
    );
  }

//--> password TextField
  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Password",
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
            controller: passwordController,
            obscureText: unShowPass,
            // obscuringCharacter: ".",
            cursorHeight: 25,
            style: kTextStyleGilroy400.copyWith(
              fontSize: 18.sp,
              color: kColorBlack,
            ),
            decoration: InputDecoration(
              hintText: "Enter password",
              hintStyle: kTextStyleGilroy400.copyWith(
                color: kColorTextHint,
                fontSize: 16.sp,
              ),
              border: InputBorder.none,
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    unShowPass = !unShowPass;
                  });
                },
                child: _toggleIcon(),
              ),
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildTermsText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: RichText(
            text: TextSpan(
              text: "By continuing you agree to our ",
              style: kTextStyleGilroy500.copyWith(
                fontSize: 14.sp,
                color: kColorGrey,
              ),
              children: [
                TextSpan(
                  text: "Terms of Service",
                  style: kTextStyleGilroy500.copyWith(
                    fontSize: 14.sp,
                    color: kColorPrimary,
                  ),
                ),
                TextSpan(
                  text: " and ",
                  style: kTextStyleGilroy500.copyWith(
                    fontSize: 14.sp,
                  ),
                ),
                TextSpan(
                  text: "Privacy Policy",
                  style: kTextStyleGilroy500.copyWith(
                    fontSize: 14.sp,
                    color: kColorPrimary,
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  Widget _buildSignUpButton() {
    return GestureDetector(
      onTap: () {
        String username = usernameController.text.trim();
        String password = passwordController.text.trim();
        String email = emailController.text.trim();
        String confirmPassword = confirmPasswordController.text
            .trim(); // Make sure to create and assign this controller.

        // Username validation
        if (username.isEmpty || username.length < 5) {
          CustomSnackbar.show(
              context, "Username must be at least 5 characters long.",
              backgroundColor: kColorPrimary);
          return;
        }

        // Password validation
        if (password.isEmpty || password.length < 8) {
          CustomSnackbar.show(
              context, "Password must be at least 8 characters long.",
              backgroundColor: kColorPrimary);
          return;
        }
        if (!RegExp(r'[A-Z]').hasMatch(password)) {
          CustomSnackbar.show(
              context, "Password must contain at least one capital letter.",
              backgroundColor: kColorPrimary);
          return;
        }
        if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
          CustomSnackbar.show(
              context, "Password must contain at least one special character.",
              backgroundColor: kColorPrimary);
          return;
        }

        // Confirm Password validation
        if (password != confirmPassword) {
          CustomSnackbar.show(
              context, "Password and Confirm Password do not match.",
              backgroundColor: kColorPrimary);
          return;
        }

        // If all validations pass
        if (email.isEmpty ||
            password.isEmpty ||
            username.isEmpty ||
            confirmPassword.isEmpty) {
          CustomSnackbar.show(context, "Enter valid data.",
              backgroundColor: kColorPrimary);
        } else {
          // Proceed with the sign-up logic
          // e.g., API call, etc.
        }
      },
      child: const ButtonWidget(title: "Sign Up"),
    );
  }

//--> Login Button
  Widget _buildLoginOption() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          "Already have an account? ",
          style: kTextStyleGilroy600.copyWith(
            fontSize: 14.sp,
            color: kColorBlack,
          ),
        ),
        GestureDetector(
          onTap: () {
            AutoRouter.of(context).replace(const LoginPageRoute());
          },
          child: Text(
            "Login",
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
