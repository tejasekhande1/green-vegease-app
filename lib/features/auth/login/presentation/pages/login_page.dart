import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_vegease/core/common/widgets/button_widget.dart';
import 'package:green_vegease/core/common/widgets/snackbar_widget.dart';
import 'package:green_vegease/core/theme/colors.dart';

import '../../../../../core/routes/app_router.dart';
import '../../../../../core/theme/text_styles.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  Icon get toggleIcon => Icon(
        size: 24.h,
        isPasswordVisible
            ? Icons.remove_red_eye
            : Icons.remove_red_eye_outlined,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
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
                  _buildLogo(),
                  SizedBox(height: 100.h),
                  _buildTitle(),
                  SizedBox(height: 15.h),
                  _buildSubtitle(),
                  SizedBox(height: 24.h),
                  _buildEmailField(),
                  SizedBox(height: 30.h),
                  _buildPasswordField(),
                  SizedBox(height: 20.h),
                  _buildForgotPasswordText(),
                  SizedBox(height: 30.h),
                  _buildLogInButton(),
                  SizedBox(height: 25.h),
                  _buildSignUpPrompt(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

// -->  background Image
  Widget _buildBackgroundImage() {
    return Image.asset(
      "assets/images/login_background.png",
      width: 414.w,
      height: 896.h,
      fit: BoxFit.fill,
    );
  }

// -- > Carrot Logo
  Widget _buildLogo() {
    return Column(
      children: [
        SizedBox(height: 77.25.h),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SvgPicture.asset(
              "assets/images/colored_carrot.svg",
              height: 55.h,
              fit: BoxFit.fill,
              width: 48.w,
            ),
          ],
        ),
      ],
    );
  }

// --> Login Title
  Widget _buildTitle() {
    return Text(
      "Loging",
      style: kTextStyleGilroy600.copyWith(
        color: kColorBlack,
        fontSize: 26.sp,
      ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      "Enter your email and password",
      style: kTextStyleGilroy500.copyWith(
        color: kColorGrey,
        fontSize: 16.sp,
      ),
    );
  }

// --> Email TextField
  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Email",
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
            controller: emailController,
            cursorHeight: 25,
            style: kTextStyleGilroy500.copyWith(
              fontSize: 18.sp,
              color: kColorBlack,
            ),
            decoration: InputDecoration(
              hintText: "Enter email id",
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

// --> Password TextField
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
            obscureText: !isPasswordVisible,
            cursorHeight: 25,
            style: kTextStyleGilroy500.copyWith(
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
                onTap: togglePasswordVisibility,
                child: toggleIcon,
              ),
            ),
          ),
        ),
      ],
    );
  }

// --> Forgot password Button
  Widget _buildForgotPasswordText() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Text(
          "Forgot Password?",
          style: kTextStyleGilroy500.copyWith(
            fontSize: 14.sp,
            color: kColorBlack,
          ),
        ),
      ],
    );
  }

// --> Login Button
  Widget _buildLogInButton() {
    return GestureDetector(
      onTap: () {
        if (emailController.text.isEmpty || passwordController.text.isEmpty) {
          CustomSnackbar.show(context, "Enter Valid Data",
              backgroundColor: kColorPrimary);
        }
      },
      child: const ButtonWidget(title: "Log In"),
    );
  }

//--> Sign-Up Button for Registration
  Widget _buildSignUpPrompt() {
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
            AutoRouter.of(context).push(const SingupPageRoute());
            FocusScope.of(context).unfocus();
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
