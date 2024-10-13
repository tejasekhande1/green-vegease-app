import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_vegease/core/common/widgets/button_widget.dart';
import 'package:green_vegease/core/theme/colors.dart';
import 'package:green_vegease/core/utils/validation_mixin.dart';
import 'package:green_vegease/features/auth/forgot_password/presentation/bloc/reset_pass_event.dart';
import 'package:green_vegease/features/auth/forgot_password/presentation/bloc/reset_pass_state.dart';
import '../../../../../../core/theme/text_styles.dart';
import '../../../../../core/common/bloc/internet_bloc/internet_bloc.dart';
import '../../../../../core/common/widgets/custom_textfield_widget.dart';
import '../../../../../core/common/widgets/loader_widget.dart';
import '../../../../../core/utils/utils.dart';
import '../bloc/reset_pass_bloc.dart';

@RoutePage()
class ResetPasswordPage extends StatefulWidget {
  const ResetPasswordPage({super.key});

  @override
  State<ResetPasswordPage> createState() => _ResetPasswordPageState();
}

class _ResetPasswordPageState extends State<ResetPasswordPage>
    with ValidationMixin {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  bool isPasswordVisible = false;
  final resetPassKey = GlobalKey<FormState>();

  void togglePasswordVisibility() {
    setState(() {
      isPasswordVisible = !isPasswordVisible;
    });
  }

  Icon get toggleIcon => Icon(
        size: 24.sp,
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
        size: 24.sp,
        isPasswordVisible1
            ? Icons.remove_red_eye
            : Icons.remove_red_eye_outlined,
      );

  bool unShowPass = true;
  final signKey = GlobalKey<FormState>();

  Icon _toggleIcon1() {
    return Icon(
      size: 24.sp,
      unShowPass ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
    );
  }

  bool unShowPass2 = true;

  Icon _toggleIcon2() {
    return Icon(
      size: 24.sp,
      unShowPass2 ? Icons.remove_red_eye_outlined : Icons.remove_red_eye,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kColorWhite,
      body: KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
        return SizedBox(
          width: 414.w,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              _buildBackgroundImage(),
              SafeArea(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      // Spacer to push the form down, this prevents the background from overlapping form elements
                      SizedBox(height: 20.h),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 25.w),
                        child: Form(
                          key: resetPassKey,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Back button
                              GestureDetector(
                                onTap: () {
                                  AutoRouter.of(context).popForced();
                                },
                                child: SizedBox(
                                  height: 18.h,
                                  width: 10.w,
                                  child: SvgPicture.asset(
                                    "assets/icons/back_arrow.svg",
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(height: 35.h),
                              // Logo, Titles, Password fields, etc.
                              _buildLogo(),
                              SizedBox(height: 100.h),
                              _buildTitle(),
                              _buildSubtitle(),
                              SizedBox(height: 30.h),
                              CustomTextfieldWidget(
                                isPassword: unShowPass,
                                maxLines: 1,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    unShowPass = !unShowPass;
                                    setState(() {});
                                  },
                                  child: _toggleIcon1(),
                                ),
                                style: kTextStyleGilroy400.copyWith(
                                    color: kColorTextHint,
                                    fontSize: 16.sp,
                                    height: 4.h),
                                labelText: "New Password",
                                hintText: "Enter password",
                                hintStyle: kTextStyleGilroy400.copyWith(
                                    color: kColorTextHint,
                                    fontSize: 16.sp,
                                    height: 3.5.h),
                                controller: passwordController,
                                validator: validatedPassword,
                              ),
                              SizedBox(height: 20.h),
                              CustomTextfieldWidget(
                                isPassword: unShowPass2,
                                maxLines: 1,
                                suffixIcon: GestureDetector(
                                  onTap: () {
                                    unShowPass2 = !unShowPass2;
                                    setState(() {});
                                  },
                                  child: _toggleIcon2(),
                                ),
                                style: kTextStyleGilroy400.copyWith(
                                    color: kColorTextHint,
                                    fontSize: 16.sp,
                                    height: 4.h),
                                labelText: "Confirm New Password",
                                hintText: "Re-enter password",
                                hintStyle: kTextStyleGilroy400.copyWith(
                                    color: kColorTextHint,
                                    fontSize: 16.sp,
                                    height: 3.5.h),
                                controller: confirmPasswordController,
                                validator: (value) {
                                  if (validatedPassword(value) != null) {
                                    return validatedPassword(value);
                                  } else if (passwordController.text !=
                                      confirmPasswordController.text) {
                                    return "Password not match";
                                  }
                                  return null;
                                },
                              ),

                              SizedBox(height: 70.h),
                              _buildLogInButton(),
                              SizedBox(
                                height: isKeyboardVisible ? 300.h : 1.h,
                              )
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              BlocConsumer<ResetPassBloc, ResetPassState>(
                listener: (context, state) {
                  if (state is ResetPassSuccess) {
                    Utils.customSnackBar(context, "Password Changed Successful",
                        backgroundColor: kColorPrimary);
                    AutoRouter.of(context).popForced();
                  }
                  if (state is ResetPassFailed) {
                    Utils.customSnackBar(context, state.error,
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
        );
      }),
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
            SizedBox(
              height: 55.h,
              width: 48.w,
              child: SvgPicture.asset(
                "assets/images/colored_carrot.svg",
                fit: BoxFit.fill,
              ),
            ),
          ],
        ),
      ],
    );
  }

// --> Login Title
  Widget _buildTitle() {
    return Text(
      "Reset Password",
      style: kTextStyleGilroy600.copyWith(
        color: kColorBlack,
        fontSize: 26.sp,
      ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      "Enter a new and strong password",
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

// --> Login Button
  Widget _buildLogInButton() {
    return BlocBuilder<InternetBloc, InternetStatus>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            if (resetPassKey.currentState!.validate()) {
              if (state.status == ConnectivityStatus.connected) {
                context
                    .read<ResetPassBloc>()
                    .add(ResetPassSubmitted(resetData: {
                      "email": emailController.text,
                      "newPassword": passwordController.text,
                      "confirmedNewPassword": confirmPasswordController.text
                    }));
              } else {
                Utils.customSnackBar(
                    context, "Please check internet connectivity",
                    backgroundColor: kColorRed);
              }
            }
          
          },
          child: const ButtonWidget(title: "Reset"),
        );
      },
    );
  }
}
