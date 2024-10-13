import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/core/common/widgets/loader_widget.dart';
import 'package:green_vegease/core/theme/colors.dart';
import 'package:green_vegease/core/utils/validation_mixin.dart';
import 'package:green_vegease/features/auth/login/presentation/widgets/background_img_widget.dart';
import 'package:green_vegease/features/auth/login/presentation/widgets/forgot_password_text_widget.dart';
import 'package:green_vegease/features/auth/login/presentation/widgets/log_in_button_widget.dart';
import 'package:green_vegease/features/auth/login/presentation/widgets/sign_up_prompt_widget.dart';
import 'package:green_vegease/features/auth/login/presentation/widgets/subtitle_widget.dart';
import 'package:green_vegease/features/auth/login/presentation/widgets/title_widget.dart';
import '../../../../../core/common/widgets/custom_textfield_widget.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/theme/text_styles.dart';
import '../../../../../core/utils/utils.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_state.dart';
import '../widgets/logo_widget.dart';

@RoutePage()
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with ValidationMixin {
  final TextEditingController mobileController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  bool isPasswordVisible = false;
  double? height;
  double? width;

  void clearController() {
    mobileController.clear();
    passwordController.clear();
  }

  Icon get toggleIcon => Icon(
        size: 24.sp,
        isPasswordVisible
            ? Icons.remove_red_eye
            : Icons.remove_red_eye_outlined,
      );

  @override
  Widget build(BuildContext context) {
    width = MediaQuery.of(context).size.width;
    height = MediaQuery.of(context).size.height;
    bool isKeyboardVisible = MediaQuery.of(context).viewInsets.bottom != 0;

    return AnnotatedRegion<SystemUiOverlayStyle>(
      value: const SystemUiOverlayStyle(
        statusBarIconBrightness: Brightness.dark, // For Android: dark icons
        statusBarBrightness:
            Brightness.light, // For iOS: dark icons on light background
        statusBarColor: kColorTransparent, // Transparent status bar color
      ),
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kColorWhite,
        body: SizedBox(
          width: width,
          height: height, // Ensure the container takes the full screen size
          child: Stack(
            children: [
              const BackgroundImgWidget(),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(25.w),
                  child: Form(
                    key: loginKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const LogoWidget(),
                        SizedBox(height: 100.h),
                        const TitleWidget(),
                        SizedBox(height: 15.h),
                        const SubtitleWidget(),
                        SizedBox(height: 24.h),
                        CustomTextfieldWidget(
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
                          controller: mobileController,
                          validator: validatedPhoneNumber,
                        ),
                        SizedBox(height: 30.h),
                        CustomTextfieldWidget(
                          isPassword: !isPasswordVisible,
                          maxLines: 1,
                          suffixIcon: GestureDetector(
                            onTap: () {
                              isPasswordVisible = !isPasswordVisible;
                              setState(() {});
                            },
                            child: toggleIcon,
                          ),
                          style: kTextStyleGilroy400.copyWith(
                              color: kColorTextHint,
                              fontSize: 16.sp,
                              height: 4.h),
                          labelText: "Password",
                          hintText: "Enter password",
                          hintStyle: kTextStyleGilroy400.copyWith(
                              color: kColorTextHint,
                              fontSize: 16.sp,
                              height: 3.5.h),
                          controller: passwordController,
                          validator: validatedPassword,
                        ),
                        SizedBox(height: 20.h),
                        ForgotPasswordTextWidget(
                            mobileNumberController: mobileController,
                            passwordController: passwordController),
                        SizedBox(height: 30.h),
                        LogInButtonWidget(
                          loginKey: loginKey,
                          mobileController: mobileController,
                          passwordController: passwordController,
                        ),
                        SizedBox(height: 25.h),
                        SignUpPromptWidget(
                            mobileNumberController: mobileController,
                            passwordController: passwordController),
                        SizedBox(
                          height: isKeyboardVisible ? 220.h : 0.h,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              BlocConsumer<LogInBloc, LogInState>(
                listener: (context, state) {
                  if (state is LogInSuccess) {
                    Utils.customSnackBar(context, state.response.message!,
                        backgroundColor: kColorPrimary);
                    if (state.response.user!.role == "admin") {
                      AutoRouter.of(context)
                          .replaceAll([const OrdersPageRoute()]);
                    }
                  }

                  if (state is LogInFailed) {
                    Utils.customSnackBar(context, state.error,
                        backgroundColor: kColorRed);
                  }
                  if (state is LoginException) {
                    Utils.customSnackBar(context, "Something went wrong",
                        backgroundColor: kColorRed);
                  }
                },
                builder: (context, state) {
                  if (state is LogInLoading) {
                    return const LoaderWidget();
                  }
                  return const SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
