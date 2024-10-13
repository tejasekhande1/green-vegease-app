import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:green_vegease/core/common/bloc/internet_bloc/internet_bloc.dart';
import 'package:green_vegease/core/common/widgets/button_widget.dart';
import 'package:green_vegease/core/common/widgets/loader_widget.dart';
import 'package:green_vegease/core/theme/colors.dart';
import 'package:green_vegease/core/utils/validation_mixin.dart';
import '../../../../../core/common/widgets/custom_textfield_widget.dart';
import '../../../../../core/routes/app_router.dart';
import '../../../../../core/theme/text_styles.dart';
import '../../../../../core/utils/utils.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';
import '../bloc/login_state.dart';

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
              _buildBackgroundImage(),
              SingleChildScrollView(
                child: Padding(
                  padding: EdgeInsets.all(25.w),
                  child: Form(
                    key: loginKey,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildLogo(),
                        SizedBox(height: 100.h),
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
                        _buildForgotPasswordText(),
                        SizedBox(height: 30.h),
                        _buildLogInButton(),
                        SizedBox(height: 25.h),
                        _buildSignUpPrompt(),
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

// -->  background Image
  Widget _buildBackgroundImage() {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Image.asset(
        "assets/images/login_background.png",
        fit: BoxFit.fill, // Ensures the image covers the screen
      ),
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
            SizedBox(
              height: 55.h,
              width: 48.w,
              child: SvgPicture.asset(
                "assets/images/colored_carrot.svg",
                // height: 55.h,
                fit: BoxFit.fill,
                // width: 48.w,
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
      "Log In",
      style: kTextStyleGilroy600.copyWith(
        color: kColorBlack,
        fontSize: 26.sp,
      ),
    );
  }

  Widget _buildSubtitle() {
    return Text(
      "Enter your mobile number and password",
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
    return BlocBuilder<InternetBloc, InternetStatus>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();

            if (loginKey.currentState!.validate()) {
              if (state.status == ConnectivityStatus.connected) {
                context.read<LogInBloc>().add(LogInSubmitted(loginData: {
                      "mobileNumber": mobileController.text,
                      "password": passwordController.text
                    }));
              } else {
                Utils.customSnackBar(
                    context, "Please check internet connectivity",
                    backgroundColor: kColorRed);
              }
            }
          },
          child: const ButtonWidget(title: "Log In"),
        );
      },
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
