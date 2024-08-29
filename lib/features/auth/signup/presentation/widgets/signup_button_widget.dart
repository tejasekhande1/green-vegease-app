import 'package:flutter/material.dart';

import '../../../../../core/common/widgets/button_widget.dart';
import '../../../../../core/common/widgets/snackbar_widget.dart';
import '../../../../../core/theme/colors.dart';

class SignupButtonWidget extends StatelessWidget {
  final TextEditingController usernameController;
  final TextEditingController passwordController;
  final TextEditingController emailController;
  final TextEditingController confirmPasswordController;
  const SignupButtonWidget({super.key,required this.confirmPasswordController,required this.emailController,required this.passwordController, required this.usernameController});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        String username = usernameController.text.trim();
        String password = passwordController.text.trim();
        String email = emailController.text.trim();
        String confirmPassword = confirmPasswordController.text
            .trim(); // Make sure to create and assign this controller.

        // Username validation
        if (username.isEmpty || username.length < 5) {
          CustomSnackbar.show(
              context, "Username must be at least 5 characters long.",
              backgroundColor: kColorPrimary);
          return;
        }

        // Password validation
        if (password.isEmpty || password.length < 8) {
          CustomSnackbar.show(
              context, "Password must be at least 8 characters long.",
              backgroundColor: kColorPrimary);
          return;
        }
        if (!RegExp(r'[A-Z]').hasMatch(password)) {
          CustomSnackbar.show(
              context, "Password must contain at least one capital letter.",
              backgroundColor: kColorPrimary);
          return;
        }
        if (!RegExp(r'[!@#$%^&*(),.?":{}|<>]').hasMatch(password)) {
          CustomSnackbar.show(
              context, "Password must contain at least one special character.",
              backgroundColor: kColorPrimary);
          return;
        }

        // Confirm Password validation
        if (password != confirmPassword) {
          CustomSnackbar.show(
              context, "Password and Confirm Password do not match.",
              backgroundColor: kColorPrimary);
          return;
        }

        // If all validations pass
        if (email.isEmpty ||
            password.isEmpty ||
            username.isEmpty ||
            confirmPassword.isEmpty) {
          CustomSnackbar.show(context, "Enter valid data.",
              backgroundColor: kColorPrimary);
        } else {
          // Proceed with the sign-up logic
          // e.g., API call, etc.
        }
      },
      child: const ButtonWidget(title: "Sign Up"),
    );
  }
}