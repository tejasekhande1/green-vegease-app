import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/features/auth/signup/presentation/bloc/signup_bloc.dart';

import 'core/routes/app_router.dart';
import 'features/auth/login/presentation/bloc/login_bloc.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  final _appRouter = AppRouter();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(414, 896),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (_, child) {
          return MultiBlocProvider(
            providers: [
              BlocProvider(
                create: (context) => SignUpBloc(),
              ),
              BlocProvider(
                create: (context) => LogInBloc(),
              ),
            ],
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              routerConfig: _appRouter.config(),
            ),
          );
        });
  }
}
