import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:green_vegease/core/routes/app_router.dart';
import 'package:green_vegease/features/auth/signup/domain/models/signup_model.dart';
import 'package:green_vegease/features/auth/signup/presentation/bloc/signup_bloc.dart';
import 'package:green_vegease/features/auth/signup/presentation/bloc/signup_event.dart';

import '../../../../../core/common/widgets/button_widget.dart';
import '../../../../../core/common/widgets/snackbar_widget.dart';
import '../../../../../core/theme/colors.dart';
import '../bloc/signup_state.dart';

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
    return BlocBuilder<SignUpBloc, SignUpState>(
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
              CustomSnackbar.show(context, "Please enter valid mobile number",
                  backgroundColor: kColorRed);
              return;
            }
            // Username validation
            if (username.isEmpty || username.length < 5) {
              CustomSnackbar.show(
                  context, "Username must be at least 5 characters long.",
                  backgroundColor: kColorRed);
              return;
            }
            // email validation
            final RegExp emailRegExp = RegExp(
              r'^[a-zA-Z0-9._]+@[a-zA-Z0-9]+\.[a-zA-Z]+',
            );

            if (email.isEmpty) {
              CustomSnackbar.show(context, "Please enter your email",
                  backgroundColor: kColorRed);
              return;
            } else if (!emailRegExp.hasMatch(email)) {
              CustomSnackbar.show(context, "Please enter a valid email address",
                  backgroundColor: kColorRed);
              return;
            }
            // Password validation
            if (password.isEmpty || password.length < 8) {
              CustomSnackbar.show(
                  context, "Password must be at least 8 characters long.",
                  backgroundColor: kColorRed);
              return;
            }
            if (!RegExp(r'[A-Z]').hasMatch(password)) {
              CustomSnackbar.show(
                  context, "Password must contain at least one capital letter.",
                  backgroundColor: kColorRed);
              return;
            }
            if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
              CustomSnackbar.show(context,
                  "Password must contain at least one special character.",
                  backgroundColor: kColorRed);
              return;
            }

            // Confirm Password validation
            if (password != confirmPassword) {
              CustomSnackbar.show(
                  context, "Password and Confirm Password do not match.",
                  backgroundColor: kColorRed);
              return;
            }

            // If all validations pass
            if (email.isEmpty ||
                password.isEmpty ||
                username.isEmpty ||
                confirmPassword.isEmpty) {
              CustomSnackbar.show(context, "Enter valid data.",
                  backgroundColor: kColorRed);
            } else {
              context.read<SignUpBloc>().add(SignUpSubmitted(
                  model: SignUp(
                      firstname: firstNameController.text,
                      username: username,
                      lastname: lastNameController.text,
                      email: email,
                      mobileNumber: mobile,
                      password: password,
                      confirmedPassword: confirmPassword)));
              
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
