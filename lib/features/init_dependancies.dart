import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../core/routes/app_router.dart';
// import 'package:shared_preferences/shared_preferences.dart';

import '../core/services/firebase_service/shared_preferences_service/share_prefrences_service.dart';
import 'auth/forgot_password/data/api/remote_reset_pass_api.dart';
import 'auth/forgot_password/data/repository/forgot_pass_word_repository.dart';
import 'auth/forgot_password/data/services/forgot_pass_word_services.dart';
import 'auth/forgot_password/presentation/bloc/reset_pass_bloc.dart';
import 'auth/login/data/api/remote_login_api.dart';
import 'auth/login/data/repository/login_repository.dart';
import 'auth/login/data/services/login_services.dart';
import 'auth/login/presentation/bloc/login_bloc.dart';
import 'auth/signup/data/api/remote_signup_api.dart';
import 'auth/signup/data/repository/sign_up_repository.dart';
import 'auth/signup/data/services/sign_up_services.dart';
import 'auth/signup/presentation/bloc/signup_bloc.dart';
import 'dashboard/categories/data/api/category_api.dart';
import 'dashboard/categories/data/repository/category_repository.dart';
import 'dashboard/categories/data/service/category_service.dart';
import 'dashboard/categories/presentation/bloc/bloc/category_bloc.dart';

final serviceLocator = GetIt.instance;

Future<void> initDependencies() async {
  final SharedPreferences sharedPreferences =
      await SharedPreferences.getInstance();
  serviceLocator.registerLazySingleton<SharedPreferencesService>(
      () => SharedPreferencesService(sharedPreferences));
  serviceLocator.registerSingleton<AppRouter>(AppRouter());
  serviceLocator.registerLazySingleton<Dio>(() => Dio());

  _initSignUp();
  _initResetPassWord();
  _initLogIn();
  _initCategory();
}

void _initSignUp() {
  serviceLocator

    //Api
    ..registerLazySingleton(() => SignUpApiService(serviceLocator()))

    // service
    ..registerLazySingleton(
        () => SignUpService(signUpApi: serviceLocator(), dio: serviceLocator()))

    //Repository
    ..registerLazySingleton(
        () => SignUpRepository(signUpService: serviceLocator()))

    // Bloc
    ..registerLazySingleton<SignUpBloc>(
      () => SignUpBloc(
        signUpRepository: serviceLocator(),
      ),
    );
}

void _initResetPassWord() {
  serviceLocator

    //Api
    ..registerLazySingleton(() => ForgotPassWordApiService(serviceLocator()))

    // service
    ..registerLazySingleton(() => ForgotPassWordService(
        forgotPassWordApi: serviceLocator(), dio: serviceLocator()))

    //Repository
    ..registerLazySingleton(
        () => ForgotPassWordRepository(forgotPassWordService: serviceLocator()))

    // Bloc
    ..registerLazySingleton<ResetPassBloc>(
      () => ResetPassBloc(
        forgotPassWordRepository: serviceLocator(),
      ),
    );
}

void _initLogIn() {
  serviceLocator

    //Api
    ..registerLazySingleton(() => LoginApiService(serviceLocator()))

    // service
    ..registerLazySingleton(
        () => LoginService(loginApi: serviceLocator(), dio: serviceLocator()))

    //Repository
    ..registerLazySingleton(
        () => LoginRepository(loginService: serviceLocator()))

    // Bloc
    ..registerLazySingleton<LogInBloc>(
      () => LogInBloc(
        loginRepository: serviceLocator(),
      ),
    );
}

void _initCategory() {
  serviceLocator

    //Api
    ..registerLazySingleton(() => CategoryApiService(serviceLocator()))

    // service
    ..registerLazySingleton(
        () => CategoryService(categoryApi: serviceLocator(), dio: serviceLocator()))

    //Repository
    ..registerLazySingleton(
        () => CategoryRepository(categoryService: serviceLocator()))

    // Bloc
    ..registerLazySingleton<CategoryBloc>(
      () => CategoryBloc(
        repository: serviceLocator(),
      ),
    );
}
