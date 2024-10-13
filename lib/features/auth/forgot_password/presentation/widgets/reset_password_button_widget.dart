import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/bloc/internet_bloc/internet_bloc.dart';
import '../../../../../core/common/widgets/button_widget.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/utils/utils.dart';
import '../bloc/reset_pass_bloc.dart';
import '../bloc/reset_pass_event.dart';

class ResetPasswordButtonWidget extends StatelessWidget {
  const ResetPasswordButtonWidget({
    super.key,
    required this.resetPassKey,
    required this.emailController,
    required this.passwordController,
    required this.confirmPasswordController,
  });

  final GlobalKey<FormState> resetPassKey;
  final TextEditingController emailController;
  final TextEditingController passwordController;
  final TextEditingController confirmPasswordController;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetBloc, InternetStatus>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
            if (resetPassKey.currentState!.validate()) {
              if (state.status == ConnectivityStatus.connected) {
                context
                    .read<ResetPassBloc>()
                    .add(ResetPassSubmitted(resetData: {
                      "email": emailController.text,
                      "newPassword": passwordController.text,
                      "confirmedNewPassword": confirmPasswordController.text
                    }));
              } else {
                Utils.customSnackBar(
                    context, "Please check internet connectivity",
                    backgroundColor: kColorRed);
              }
            }
          },
          child: const ButtonWidget(title: "Reset"),
        );
      },
    );
  }
}
