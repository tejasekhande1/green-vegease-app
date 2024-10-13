import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_vegease/core/common/widgets/loader_widget.dart';
import 'package:green_vegease/core/routes/app_router.dart';
import 'package:green_vegease/core/theme/colors.dart';
import 'package:green_vegease/features/auth/signup/presentation/bloc/signup_bloc.dart';
import 'package:green_vegease/features/auth/signup/presentation/bloc/signup_state.dart';
import 'package:green_vegease/features/auth/signup/presentation/widgets/password_text_field_widget.dart';
import 'package:green_vegease/features/auth/signup/presentation/widgets/signup_button_widget.dart';
import '../../../../../core/theme/text_styles.dart';
import '../../../../../core/utils/utils.dart';
import '../widgets/text_field_widget.dart';

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
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
  void clearControllers() {
    usernameController.clear();
    emailController.clear();
    passwordController.clear();
    mobileNumberController.clear();
    firstNameController.clear();
    lastNameController.clear();
    confirmPasswordController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: kColorWhite,
      body: KeyboardVisibilityBuilder(builder: (context, isKeyboardVisible) {
        return SizedBox(
          width: 414.w,
          height: 896.h,
          child: Stack(
            children: [
              Image.asset(
                "assets/images/login_background.png",
                width: 414.w,
                height: 896.h,
                fit: BoxFit.fill,
              ),
              SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(25.w),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40.h),
                        _buildLogo(),
                        SizedBox(height: 50.h),
                        _buildTitle(),
                        SizedBox(height: 15.h),
                        _buildSubtitle(),
                        SizedBox(height: 24.h),
                        TextFieldWidget(
                            label: "Mobile Number",
                            hint: "Enter mobile number",
                            controller: mobileNumberController),
                        SizedBox(height: 24.h),
                        Row(
                          children: [
                            Expanded(
                              child: TextFieldWidget(
                                  label: "Firstname",
                                  hint: "Enter firstname",
                                  controller: firstNameController),
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Expanded(
                              child: TextFieldWidget(
                                  label: "Lastname",
                                  hint: "Enter lastname",
                                  controller: lastNameController),
                            ),
                          ],
                        ),
                        SizedBox(height: 24.h),
                        TextFieldWidget(
                            label: "Username",
                            hint: "Enter username",
                            controller: usernameController),
                        SizedBox(height: 30.h),
                        TextFieldWidget(
                            label: "Email",
                            hint: "Enter email id",
                            controller: emailController),
                        SizedBox(height: 20.h),
                        PasswordTextFieldWidget(
                            controller: passwordController, title: "Password"),
                        SizedBox(height: 20.h),
                        PasswordTextFieldWidget(
                            controller: confirmPasswordController,
                            title: "Confirm Password"),
                        SizedBox(height: 20.h),
                        _buildTermsText(),
                        SizedBox(height: 30.h),
                        SignupButtonWidget(
                            firstNameController: firstNameController,
                            lastNameController: lastNameController,
                            mobileController: mobileNumberController,
                            confirmPasswordController:
                                confirmPasswordController,
                            emailController: emailController,
                            passwordController: passwordController,
                            usernameController: usernameController),
                        SizedBox(height: 25.h),
                        _buildLoginOption(),
                        SizedBox(
                          height: isKeyboardVisible ? 300.h : 1.h,
                        )
                      ],
                    ),
                  ),
                ),
              ),
              BlocConsumer<SignUpBloc, SignUpState>(listener: (context, state) {
                if (state is SignUpFailed) {
                  Utils.customSnackBar(context, state.error,
                      backgroundColor: kColorRed);
                }
                if (state is SignUpSuccess) {
                  AutoRouter.of(context)
                      .push(VerificationPageRoute())
                      .then((value) {
                    clearControllers();
                  });
                }
              }, builder: (context, state) {
                if (state is SignUpLoading) {
                  return const LoaderWidget();
                }
                return const SizedBox();
              })
            ],
          ),
        );
      }),

    );
  }

  Widget _buildLogo() {
    return Row(
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
