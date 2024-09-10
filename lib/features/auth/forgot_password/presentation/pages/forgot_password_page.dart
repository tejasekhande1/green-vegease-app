import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_vegease/core/common/widgets/button_widget.dart';
import 'package:green_vegease/core/common/widgets/snackbar_widget.dart';
import 'package:green_vegease/core/theme/colors.dart';
import 'package:green_vegease/features/auth/forgot_password/domain/reset_pass_model.dart';
import 'package:green_vegease/features/auth/forgot_password/presentation/bloc/reset_pass_event.dart';
import 'package:green_vegease/features/auth/forgot_password/presentation/bloc/reset_pass_state.dart';
import '../../../../../../core/theme/text_styles.dart';
import '../../../../../core/common/bloc/internet_bloc/internet_bloc.dart';
import '../../../../../core/common/widgets/loader_widget.dart';
import '../../../../../core/routes/app_router.dart';
import '../bloc/reset_pass_bloc.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController2 =
      TextEditingController();
  final TextEditingController oldPassController = TextEditingController();
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
  bool isPasswordVisible1 = false;

  void togglePasswordVisibility1() {
    setState(() {
      isPasswordVisible1 = !isPasswordVisible1;
    });
  }

  Icon get toggleIcon1 => Icon(
        size: 24.h,
        isPasswordVisible1
            ? Icons.remove_red_eye
            : Icons.remove_red_eye_outlined,
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
      backgroundColor: kColorWhite,
      body: SingleChildScrollView(
        child: Stack(
          children: [
            _buildBackgroundImage(),
            Padding(
              padding: EdgeInsets.all(25.w),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                    _buildLogo(),
                    SizedBox(height: 50.h),
                    _buildTitle(),
                    SizedBox(height: 15.h),
                    _buildSubtitle(),
                    SizedBox(height: 24.h),
                    _buildEmailField(),
                    SizedBox(height: 25.h),
                    _buildOtpField(),
                    SizedBox(height: 30.h),
                    _buildPasswordField(),
                    SizedBox(height: 30.h),
                    _buildPasswordField2(),
                    SizedBox(height: 20.h),
                    _buildLogInButton(),
                    SizedBox(
                      height: 20.h,
                    ),
                  ],
                ),
              ),
            ),
            BlocConsumer<ResetPassBloc, ResetPassState>(
              listener: (context, state) {
                if (state is ResetPassSuccess) {
                  CustomSnackbar.show(context, "Password Changed Successful",
                      backgroundColor: kColorPrimary);
                  AutoRouter.of(context).popForced();
                }
                if (state is ResetPassFailed) {
                  CustomSnackbar.show(context, state.error,
                      backgroundColor: kColorRed);
                }
              },
              builder: (context, state) {
                if (state is ResetPassLoading) {
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
        SizedBox(height: 40.25.h),
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
      "Forgot Password",
      style: kTextStyleGilroy600.copyWith(
        color: kColorBlack,
        fontSize: 26.sp,
      ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      "Enter details to reset password",
      style: kTextStyleGilroy500.copyWith(
        color: kColorGrey,
        fontSize: 16.sp,
      ),
    );
  }

  Widget _buildOtpField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Old Password",
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
            keyboardType: TextInputType.text,
            // inputFormatters: [
            //   FilteringTextInputFormatter.digitsOnly,
            //   LengthLimitingTextInputFormatter(4),
            // ],
            controller: oldPassController,
            cursorHeight: 25,
            style: kTextStyleGilroy500.copyWith(
              fontSize: 18.sp,
              color: kColorBlack,
            ),
            decoration: InputDecoration(
              hintText: "Enter old password",
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
            // inputFormatters: [
            //   FilteringTextInputFormatter.digitsOnly,
            //   LengthLimitingTextInputFormatter(10),
            // ],
            controller: emailController,
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
        // SizedBox(
        //   height: 8.h,
        // ),
        // GestureDetector(
        //     onTap: () {},
        //     child: Text(
        //       "Get Otp",
        //       style: kTextStyleGilroy400.copyWith(
        //           height: 1, fontSize: 12, color: kColorPrimary),
        //     ))
      ],
    );
  }

// --> Password TextField1
  Widget _buildPasswordField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "New Password",
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
              hintText: "Enter new password",
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

  // --> Password TextField2
  Widget _buildPasswordField2() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Confirm New Password",
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
            controller: confirmPasswordController2,
            obscureText: !isPasswordVisible1,
            cursorHeight: 25,
            style: kTextStyleGilroy500.copyWith(
              fontSize: 18.sp,
              color: kColorBlack,
            ),
            decoration: InputDecoration(
              hintText: "Enter confirm password",
              hintStyle: kTextStyleGilroy400.copyWith(
                color: kColorTextHint,
                fontSize: 16.sp,
              ),
              border: InputBorder.none,
              suffixIcon: GestureDetector(
                onTap: togglePasswordVisibility1,
                child: toggleIcon1,
              ),
            ),
          ),
        ),
      ],
    );
  }

// --> Login Button
  Widget _buildLogInButton() {
    return BlocBuilder<InternetBloc, InternetStatus>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            if (emailController.text.trim().isEmpty ||
                passwordController.text.trim().isEmpty ||
                confirmPasswordController2.text.trim().isEmpty) {
              if (emailController.text.trim().isEmpty) {
                CustomSnackbar.show(context, "Please enter email",
                    backgroundColor: kColorRed);
              } else if (passwordController.text.trim().isEmpty) {
                CustomSnackbar.show(context, "Please enter password",
                    backgroundColor: kColorRed);
              } else {
                CustomSnackbar.show(context, "Please enter confirm password",
                    backgroundColor: kColorRed);
              }
              CustomSnackbar.show(context, "Enter Valid Data",
                  backgroundColor: kColorRed);
            } else {
              if (passwordController.text.isEmpty ||
                  passwordController.text.length < 8) {
                CustomSnackbar.show(
                    context, "Password must be at least 8 characters long.",
                    backgroundColor: kColorRed);
                return;
              }
              if (!RegExp(r'[A-Z]').hasMatch(passwordController.text)) {
                CustomSnackbar.show(context,
                    "Password must contain at least one capital letter.",
                    backgroundColor: kColorRed);
                return;
              }
              if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]')
                  .hasMatch(passwordController.text)) {
                CustomSnackbar.show(context,
                    "Password must contain at least one special character.",
                    backgroundColor: kColorRed);
                return;
              }

              // Confirm Password validation
              if (passwordController.text != confirmPasswordController2.text) {
                CustomSnackbar.show(
                    context, "Password and Confirm Password do not match.",
                    backgroundColor: kColorRed);
                return;
              }
              if (state.status == ConnectivityStatus.connected) {
                context.read<ResetPassBloc>().add(ResetPassSubmitted(
                    model: ResetPassword(
                        email: emailController.text,
                        oldPassword: oldPassController.text,
                        newPassword: passwordController.text,
                        confirmedNewPassword:
                            confirmPasswordController2.text)));
              } else {
                CustomSnackbar.show(
                    context, "Please check internet connectivity",
                    backgroundColor: kColorRed);
              }
            }
          },
          child: const ButtonWidget(title: "Changed Password"),
        );
      },
    );
  }
}
