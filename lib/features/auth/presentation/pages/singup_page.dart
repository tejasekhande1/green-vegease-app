import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_vegease/core/common/widgets/button_widget.dart';
import 'package:green_vegease/core/theme/colors.dart';

@RoutePage()
class SingupPage extends StatefulWidget {
  const SingupPage ({super.key});

  @override
  State<SingupPage > createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage > {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool unShowPass = true;

  Icon _toggleIcon() {
    return Icon(
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
                  SizedBox(height: 77.25.h),
                  _buildLogo(),
                  SizedBox(height: 100.h),
                  _buildTitle(),
                  SizedBox(height: 15.h),
                  _buildSubtitle(),
                  SizedBox(height: 24.h),
                  _buildTextField("Username", "Enter username", usernameController),
                  SizedBox(height: 30.h),
                  _buildTextField("Email", "Enter email id", emailController),
                  SizedBox(height: 20.h),
                  _buildPasswordField(),
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
        SvgPicture.asset("assets/images/colored_carrot.svg"),
      ],
    );
  }

  Widget _buildTitle() {
    return Text(
      "Sign Up",
      style: TextStyle(
        color: kColorBlack,
        fontFamily: "Gilroy",
        fontWeight: FontWeight.w600,
        fontSize: 26.sp,
      ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      "Enter your credentials to continue",
      style: TextStyle(
        color: kColorGrey,
        fontFamily: "Gilroy",
        fontWeight: FontWeight.w400,
        fontSize: 16.sp,
      ),
    );
  }

  //--> UserName TextField and Email TextField
  Widget _buildTextField(String label, String hint, TextEditingController controller) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          label,
          style: TextStyle(
            color: kColorGrey,
            fontFamily: "Gilroy",
            fontWeight: FontWeight.w600,
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
            style: TextStyle(
              fontSize: 18.sp,
              fontFamily: "Gilroy",
              fontWeight: FontWeight.w400,
              color: kColorBlack,
            ),
            decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(
                color: kColorTextHint,
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w400,
                fontSize: 16.sp,
              ),
              border: InputBorder.none,
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
          style: TextStyle(
            color: kColorGrey,
            fontFamily: "Gilroy",
            fontWeight: FontWeight.w600,
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
            obscuringCharacter: ".",
            cursorHeight: 25,
            style: TextStyle(
              fontSize: 18.sp,
              fontFamily: "Gilroy",
              fontWeight: FontWeight.w400,
              color: kColorBlack,
            ),
            decoration: InputDecoration(
              hintText: "Enter password",
              hintStyle: TextStyle(
                color: kColorTextHint,
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w400,
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
              style: TextStyle(
                fontSize: 16.sp,
                fontFamily: "Gilroy",
                fontWeight: FontWeight.w400,
                color: kColorBlack,
              ),
              children: [
                TextSpan(
                  text: "Terms of Service",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: kColorPrimary,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: " and ",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w400,
                  ),
                ),
                TextSpan(
                  text: "Privacy Policy",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: kColorPrimary,
                    fontWeight: FontWeight.w400,
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
          style: TextStyle(
            fontSize: 14.sp,
            fontFamily: "Gilroy",
            fontWeight: FontWeight.w600,
            color: kColorBlack,
          ),
        ),
        GestureDetector(
          onTap: () {
            AutoRouter.of(context).back();
          },
          child: Text(
            "Login",
            style: TextStyle(
              fontSize: 14.sp,
              fontFamily: "Gilroy",
              fontWeight: FontWeight.w600,
              color: kColorPrimary,
            ),
          ),
        ),
      ],
    );
  }
}
