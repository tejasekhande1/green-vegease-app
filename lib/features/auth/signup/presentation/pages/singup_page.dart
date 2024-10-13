import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_keyboard_visibility/flutter_keyboard_visibility.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_vegease/core/common/widgets/custom_textfield_widget.dart';
import 'package:green_vegease/core/common/widgets/loader_widget.dart';
import 'package:green_vegease/core/routes/app_router.dart';
import 'package:green_vegease/core/theme/colors.dart';
import 'package:green_vegease/core/utils/validation_mixin.dart';
import 'package:green_vegease/features/auth/signup/presentation/bloc/signup_bloc.dart';
import 'package:green_vegease/features/auth/signup/presentation/bloc/signup_state.dart';
import 'package:green_vegease/features/auth/signup/presentation/widgets/signup_button_widget.dart';
import '../../../../../core/theme/text_styles.dart';
import '../../../../../core/utils/utils.dart';

@RoutePage()
class SingupPage extends StatefulWidget {
  const SingupPage({super.key});

  @override
  State<SingupPage> createState() => _SingupPageState();
}

class _SingupPageState extends State<SingupPage> with ValidationMixin {
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController mobileNumberController = TextEditingController();
  final TextEditingController firstNameController = TextEditingController();
  final TextEditingController lastNameController = TextEditingController();
  final TextEditingController confirmPasswordController =
      TextEditingController();
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
                    child: Form(
                      key: signKey,
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
                            controller: mobileNumberController,
                            validator: validatedPhoneNumber,
                          ),
                          SizedBox(height: 24.h),
                          Row(
                            children: [
                              Expanded(
                                child: CustomTextfieldWidget(
                                  style: kTextStyleGilroy400.copyWith(
                                      color: kColorTextHint,
                                      fontSize: 16.sp,
                                      height: 4.h),
                                  labelText: "Firstname",
                                  hintText: "Enter firstname",
                                  hintStyle: kTextStyleGilroy400.copyWith(
                                      color: kColorTextHint,
                                      fontSize: 16.sp,
                                      height: 3.5.h),
                                  controller: firstNameController,
                                  validator: validatedName,
                                ),
                              ),
                              SizedBox(
                                width: 15.w,
                              ),
                              Expanded(
                                child: CustomTextfieldWidget(
                                  style: kTextStyleGilroy400.copyWith(
                                      color: kColorTextHint,
                                      fontSize: 16.sp,
                                      height: 4.h),
                                  labelText: "Lastname",
                                  hintText: "Enter lastname",
                                  hintStyle: kTextStyleGilroy400.copyWith(
                                      color: kColorTextHint,
                                      fontSize: 16.sp,
                                      height: 3.5.h),
                                  controller: lastNameController,
                                  validator: validatedName,
                                ),
                              )
                            ],
                          ),
                          SizedBox(height: 24.h),
                          CustomTextfieldWidget(
                            style: kTextStyleGilroy400.copyWith(
                                color: kColorTextHint,
                                fontSize: 16.sp,
                                height: 4.h),
                            labelText: "Username",
                            hintText: "Enter username",
                            hintStyle: kTextStyleGilroy400.copyWith(
                                color: kColorTextHint,
                                fontSize: 16.sp,
                                height: 3.5.h),
                            controller: usernameController,
                            validator: validatedName,
                          ),
                          SizedBox(height: 30.h),
                          CustomTextfieldWidget(
                            style: kTextStyleGilroy400.copyWith(
                                color: kColorTextHint,
                                fontSize: 16.sp,
                                height: 4.h),
                            textInputType: TextInputType.emailAddress,
                            labelText: "Email",
                            hintText: "Enter email id",
                            hintStyle: kTextStyleGilroy400.copyWith(
                                color: kColorTextHint,
                                fontSize: 16.sp,
                                height: 3.5.h),
                            controller: emailController,
                            validator: validatedEmail,
                          ),
                          SizedBox(height: 20.h),
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
                            labelText: "Confirm Password",
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
                          SizedBox(height: 20.h),
                          _buildTermsText(),
                          SizedBox(height: 30.h),
                          SignupButtonWidget(
                              signKey: signKey,
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
              ),
              BlocConsumer<SignUpBloc, SignUpState>(listener: (context, state) {
                if (state is SignUpFailed) {
                  Utils.customSnackBar(context, state.error,
                      backgroundColor: kColorRed);
                }
                if (state is SignUpSuccess) {
                  AutoRouter.of(context)
                      .push(VerificationPageRoute(isResetPass: false))
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
