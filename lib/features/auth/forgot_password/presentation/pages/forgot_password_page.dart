import 'package:auto_route/auto_route.dart';
// import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_vegease/core/common/widgets/button_widget.dart';
import 'package:green_vegease/core/common/widgets/custom_textfield_widget.dart';
import 'package:green_vegease/core/routes/app_router.dart';
import 'package:green_vegease/core/theme/colors.dart';
import 'package:green_vegease/core/utils/validation_mixin.dart';
import 'package:green_vegease/features/auth/forgot_password/presentation/bloc/reset_pass_state.dart';
import 'package:green_vegease/features/auth/forgot_password/presentation/widgets/proceed_button_widget.dart';
import '../../../../../../core/theme/text_styles.dart';
import '../../../../../core/common/bloc/internet_bloc/internet_bloc.dart';
import '../../../../../core/common/widgets/loader_widget.dart';
import '../../../../../core/utils/utils.dart';
import '../bloc/reset_pass_bloc.dart';
import '../widgets/background_img_widget.dart';
import '../widgets/logo_widget.dart';
import '../widgets/subtitle_widget.dart';
import '../widgets/title_widget.dart';

@RoutePage()
class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage>
    with ValidationMixin {
  final TextEditingController emailController = TextEditingController();
  bool isPasswordVisible = false;
  final numberKey = GlobalKey<FormState>();

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
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kColorWhite,
        body: SingleChildScrollView(
          child: Stack(
            children: [
              const BackgroundImgWidget(),
              Padding(
                padding: EdgeInsets.all(25.w),
                child: SingleChildScrollView(
                  physics: const ScrollPhysics(),
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
                          child: SizedBox(
                            height: 18.h,
                            width: 10.w,
                            child: SvgPicture.asset(
                              "assets/icons/back_arrow.svg",
                              height: 18.h,
                              width: 10.w,
                              fit: BoxFit.fill,
                            ),
                          )),
                      const LogoWidget(),
                      SizedBox(height: 90.h),
                      const TitleWidget(label: "Forgot Password",),
                      const SubtitleWidget(title: "Enter details to reset password",),
                      SizedBox(
                        height: 40.h,
                      ),
                      Form(
                        key: numberKey,
                        child: CustomTextfieldWidget(
                          style: kTextStyleGilroy400.copyWith(
                              color: kColorTextHint,
                              fontSize: 16.sp,
                              height: 4.h),
                          textInputType: TextInputType.phone,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly,
                            LengthLimitingTextInputFormatter(10),
                          ],
                          labelText: "Mobile Number",
                          hintText: "Enter mobile number",
                          hintStyle: kTextStyleGilroy400.copyWith(
                              color: kColorTextHint,
                              fontSize: 16.sp,
                              height: 3.5.h),
                          controller: emailController,
                          validator: validatedPhoneNumber,
                        ),
                      ),
                      SizedBox(height: 80.h),
                      ProceedButtonWidget(numberKey: numberKey),
                      SizedBox(
                        height: 20.h,
                      ),
                      SizedBox(
                        height: isKeyboardVisible ? 180.h : 1.h,
                      )
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
        // }
        );
  }
}
