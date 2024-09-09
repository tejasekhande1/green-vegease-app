import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_vegease/core/common/widgets/button_widget.dart';
import 'package:green_vegease/core/common/widgets/loader_widget.dart';
import 'package:green_vegease/core/common/widgets/snackbar_widget.dart';
import 'package:green_vegease/core/theme/colors.dart';
import 'package:green_vegease/features/auth/login/domain/model/login_model.dart';

import '../../../../../core/routes/app_router.dart';
import '../../../../../core/theme/text_styles.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isPasswordVisible = false;

  void clearController() {
    mobileController.clear();
    passwordController.clear();
  }

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
    SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
      statusBarIconBrightness: Brightness.dark,
      statusBarColor: kColorTransparent, //or set color with: Color(0xFF0000FF)
    ));
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
            BlocConsumer<LogInBloc, LogInState>(
              listener: (context, state) {
                if (state is LogInSuccess) {
                  CustomSnackbar.show(context, "Logged in successful",
                      backgroundColor: kColorPrimary);
                }
                if (state is LogInFailed) {
                  CustomSnackbar.show(context, state.error,
                      backgroundColor: kColorRed);
                }
              },
              builder: (context, state) {
                if (state is LogInLoading) {
                  return const LoaderWidget();
                }
                return const SizedBox();
              },
            )
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
          "Mobile Number",
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
            keyboardType: TextInputType.phone,
            controller: mobileController,
            inputFormatters: [
              FilteringTextInputFormatter.digitsOnly,
              LengthLimitingTextInputFormatter(10),
            ],
            cursorHeight: 25,
            style: kTextStyleGilroy500.copyWith(
              fontSize: 18.sp,
              color: kColorBlack,
            ),
            decoration: InputDecoration(
              hintText: "Enter mobile number",
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

// --> Login Button
  Widget _buildLogInButton() {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
        if (mobileController.text.trim().isEmpty &&
            passwordController.text.trim().isEmpty) {
          CustomSnackbar.show(
              context, "Please enter mobile number and password",
              backgroundColor: kColorRed);
        } else if (mobileController.text.trim().isEmpty ||
            passwordController.text.trim().isEmpty) {
          if (mobileController.text.isEmpty) {
            CustomSnackbar.show(context, "Please enter mobile number",
                backgroundColor: kColorRed);
          } else {
            CustomSnackbar.show(context, "Please enter password",
                backgroundColor: kColorRed);
          }
        } else {
          if (passwordController.text.length <= 7) {
            CustomSnackbar.show(context, "Password must have 8 character",
                backgroundColor: kColorRed);
          } else if (mobileController.text.length < 10) {
            CustomSnackbar.show(context, "Please enter valid mobile number",
                backgroundColor: kColorRed);
          } else {
            context.read<LogInBloc>().add(LogInSubmitted(
                model: LogIn(
                    mobileNumber: mobileController.text,
                    password: passwordController.text)));
          }
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
