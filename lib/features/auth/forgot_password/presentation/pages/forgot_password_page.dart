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
import '../../../../../../core/theme/text_styles.dart';
import '../../../../../core/common/bloc/internet_bloc/internet_bloc.dart';
import '../../../../../core/common/widgets/loader_widget.dart';
import '../../../../../core/utils/utils.dart';
import '../bloc/reset_pass_bloc.dart';

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
              _buildBackgroundImage(),
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
                      _buildLogo(),
                      SizedBox(height: 90.h),
                      _buildTitle(),
                      _buildSubtitle(),
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
                      _buildLogInButton(),
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
                height: 55.h,
                fit: BoxFit.fill,
                width: 48.w,
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

// --> Email TextField
  Widget _buildEmailField() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 30.h,
        ),
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

// --> Login Button
  Widget _buildLogInButton() {
    return BlocBuilder<InternetBloc, InternetStatus>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (numberKey.currentState!.validate()) {
              AutoRouter.of(context)
                  .push(VerificationPageRoute(isResetPass: true));
            }
            FocusScope.of(context).unfocus();
          },
          child: const ButtonWidget(title: "Proceed"),
        );
      },
    );
  }
}
