import 'dart:developer';

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
  final GlobalKey<FormState> signKey;
  const SignupButtonWidget(
      {super.key,
      required this.signKey,
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
            if (signKey.currentState!.validate()) {
              FocusScope.of(context).unfocus();
              String mobile = mobileController.text.trim();
              String username = usernameController.text.trim();
              String password = passwordController.text.trim();
              String email = emailController.text.trim();
              String confirmPassword = confirmPasswordController.text
                  .trim(); // Make sure to create and assign this controller.
              log("LOG");
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
                  context.read<SignUpBloc>().add(SignUpSubmitted(signUpData: {
                        "firstname": firstNameController.text,
                        "username": username,
                        "lastname": lastNameController.text,
                        "email": email,
                        "mobileNumber": mobile,
                        "password": password,
                        "confirmedPassword": confirmPassword
                      }));
                } else {
                  Utils.customSnackBar(
                      context, "Please check internet connectivity",
                      backgroundColor: kColorRed);
                }
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
