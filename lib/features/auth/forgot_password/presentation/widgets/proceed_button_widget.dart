import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/common/bloc/internet_bloc/internet_bloc.dart';
import '../../../../../core/common/widgets/button_widget.dart';
import '../../../../../core/routes/app_router.dart';

class ProceedButtonWidget extends StatelessWidget {
  const ProceedButtonWidget({super.key,required this.numberKey});
  final GlobalKey<FormState> numberKey;

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<InternetBloc, InternetStatus>(
      builder: (context, state) {
        return GestureDetector(
          onTap: () {
            if (numberKey.currentState!.validate()) {
              AutoRouter.of(context)
                  .push(VerificationPageRoute(isResetPass: true));
            }
            FocusScope.of(context).unfocus();
          },
          child: const ButtonWidget(title: "Proceed"),
        );
      },
    );
  }
}
