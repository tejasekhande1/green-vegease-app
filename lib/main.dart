import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:green_vegease/features/auth/forgot_password/presentation/bloc/reset_pass_bloc.dart';
import 'package:green_vegease/features/auth/signup/presentation/bloc/signup_bloc.dart';
import 'package:green_vegease/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'core/common/bloc/internet_bloc/internet_bloc.dart';
import 'core/constants/constants.dart';
import 'core/routes/app_router.dart';
import 'features/auth/login/presentation/bloc/login_bloc.dart';
import 'features/injuction.dart';


@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
}
Future<void> main() async{
    WidgetsFlutterBinding.ensureInitialized();
  await initDependencies();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
   FirebaseMessaging messaging = FirebaseMessaging.instance;
  await messaging.requestPermission(
    alert: true,
    announcement: true,
    badge: true, //count of notification
    carPlay: true,
    criticalAlert: true,
    sound: true,
    provisional: false,
  );
  await FirebaseMessaging.instance.requestPermission();

  FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
  await Constants.firebaseCloudMessaging.getFirebaseNotification();
  await Constants.firebaseCloudMessaging.setupFlutterNotifications();
  runApp(MainApp());
}

class MainApp extends StatelessWidget {
  MainApp({super.key});
  // final _appRouter = AppRouter();
  final _appRouter = serviceLocator<AppRouter>();
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
              BlocProvider(
                create: (context) => ResetPassBloc(),
              ),
              BlocProvider(
                create: (context) => InternetBloc()..trackConnectivityChange()
            ..checkInternet(),
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
