import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../../../core/common/bloc/internet_bloc/internet_bloc.dart';
import '../../../../../core/common/widgets/button_widget.dart';
import '../../../../../core/theme/colors.dart';
import '../../../../../core/utils/utils.dart';
import '../bloc/login_bloc.dart';
import '../bloc/login_event.dart';

class LogInButtonWidget extends StatelessWidget {
  const LogInButtonWidget({super.key,required this.loginKey,required this.mobileController,required this.passwordController});
  final GlobalKey<FormState> loginKey;
  final TextEditingController mobileController;
  final TextEditingController passwordController;
  @override
  Widget build(BuildContext context) {
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
}
