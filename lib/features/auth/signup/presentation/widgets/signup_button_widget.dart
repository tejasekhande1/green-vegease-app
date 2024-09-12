import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_vegease/features/auth/signup/presentation/bloc/signup_bloc.dart';
import 'package:green_vegease/features/auth/signup/presentation/bloc/signup_event.dart';
import '../../../../../core/common/bloc/internet_bloc/internet_bloc.dart';
import '../../../../../core/common/widgets/button_widget.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/utils/utils.dart';

class SignupButtonWidget extends StatelessWidget {
  final TextEditingController firstNameController;
  final TextEditingController lastNameController;
  final TextEditingController mobileController;
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController emailController;
  final TextEditingController confirmPasswordController;
  const SignupButtonWidget(
      {super.key,
      required this.firstNameController,
      required this.lastNameController,
      required this.mobileController,
      required this.confirmPasswordController,
      required this.emailController,
      required this.passwordController,
      required this.usernameController});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetBloc, InternetStatus>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            String mobile = mobileController.text.trim();
            String username = usernameController.text.trim();
            String password = passwordController.text.trim();
            String email = emailController.text.trim();
            String confirmPassword = confirmPasswordController.text
                .trim(); // Make sure to create and assign this controller.
            if (mobile.isEmpty || mobile.length < 10) {
              Utils.customSnackBar(context, "Please enter valid mobile number",
                  backgroundColor: kColorRed);
              return;
            }
            // Username validation
            if (username.isEmpty || username.length < 5) {
              Utils.customSnackBar(
                  context, "Username must be at least 5 characters long.",
                  backgroundColor: kColorRed);
              return;
            }
            // email validation
            final RegExp emailRegExp = RegExp(
              r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
            );

            if (email.isEmpty) {
              Utils.customSnackBar(context, "Please enter your email",
                  backgroundColor: kColorRed);
              return;
            } else if (!emailRegExp.hasMatch(email)) {
              Utils.customSnackBar(
                  context, "Please enter a valid email address",
                  backgroundColor: kColorRed);
              return;
            }
            // Password validation
            if (password.isEmpty || password.length < 8) {
              Utils.customSnackBar(
                  context, "Password must be at least 8 characters long.",
                  backgroundColor: kColorRed);
              return;
            }
            if (!RegExp(r'[A-Z]').hasMatch(password)) {
              Utils.customSnackBar(
                  context, "Password must contain at least one capital letter.",
                  backgroundColor: kColorRed);
              return;
            }
            if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
              Utils.customSnackBar(context,
                  "Password must contain at least one special character.",
                  backgroundColor: kColorRed);
              return;
            }

            // Confirm Password validation
            if (password != confirmPassword) {
              Utils.customSnackBar(
                  context, "Password and Confirm Password do not match.",
                  backgroundColor: kColorRed);
              return;
            }

            // If all validations pass
            if (email.isEmpty ||
                password.isEmpty ||
                username.isEmpty ||
                confirmPassword.isEmpty) {
              Utils.customSnackBar(context, "Enter valid data.",
                  backgroundColor: kColorRed);
            } else {
              if (state.status == ConnectivityStatus.connected) {
                context.read<SignUpBloc>().add(SignUpSubmitted(
                    signUpData: {
                        "firstname": firstNameController.text,
                        "username": username,
                        "lastname": lastNameController.text,
                        "email": email,
                        "mobileNumber": mobile,
                        "password": password,
                        "confirmedPassword": confirmPassword}));
              } else {
                Utils.customSnackBar(
                    context, "Please check internet connectivity",
                    backgroundColor: kColorRed);
              }

              // Proceed with the sign-up logic
              // e.g., API call, etc.
            }
          },
          child: const ButtonWidget(title: "Sign Up"),
        );
      },
    );
  }
}
