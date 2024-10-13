import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_vegease/core/theme/colors.dart';
import 'package:green_vegease/core/utils/validation_mixin.dart';
import 'package:green_vegease/features/auth/forgot_password/presentation/bloc/reset_pass_state.dart';
import '../../../../../../core/theme/text_styles.dart';
import '../../../../../core/common/widgets/custom_textfield_widget.dart';
import '../../../../../core/common/widgets/loader_widget.dart';
import '../../../../../core/utils/utils.dart';
import '../bloc/reset_pass_bloc.dart';
import '../widgets/background_img_widget.dart';
import '../widgets/logo_widget.dart';
import '../widgets/reset_password_button_widget.dart';
import '../widgets/subtitle_widget.dart';
import '../widgets/title_widget.dart';

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
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kColorWhite,
        body: SizedBox(
          width: 414.w,
          height: MediaQuery.of(context).size.height,
          child: Stack(
            children: [
              const BackgroundImgWidget(),
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
                              const LogoWidget(),
                              SizedBox(height: 100.h),
                              const TitleWidget(
                                label: "Reset Password",
                              ),
                              const SubtitleWidget(
                                  title: "Enter a new and strong password"),
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
                              ResetPasswordButtonWidget(
                                  resetPassKey: resetPassKey,
                                  emailController: emailController,
                                  passwordController: passwordController,
                                  confirmPasswordController:
                                      confirmPasswordController),
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
        )
        // }),
        );
  }

}
