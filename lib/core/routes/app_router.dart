import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:green_vegease/features/auth/forgot_password/presentation/pages/reset_password_page.dart';
import 'package:green_vegease/features/auth/signup/presentation/pages/singup_page.dart';
import 'package:green_vegease/features/onboarding/presentation/pages/onboard_page.dart';
import 'package:green_vegease/features/splashscreen/presentation/pages/splash_page.dart';
import '../../features/auth/forgot_password/presentation/pages/forgot_password_page.dart';
import '../../features/auth/login/presentation/pages/login_page.dart';
import '../../features/auth/signup/presentation/pages/verification_page.dart';
import '../../features/dashboard/categories/presentation/pages/categories_page.dart';
import '../../features/dashboard/customers/presentation/customers_page.dart';
import '../../features/dashboard/orders/presentation/pages/orders_page.dart';
import '../../features/dashboard/products/presentation/pages/product_page.dart';
import '../../features/dashboard/settings/presentation/settings_page.dart';
part 'app_router.gr.dart';

@AutoRouterConfig(replaceInRouteName: "Route")
class AppRouter extends RootStackRouter {
  @override
  RouteType get defaultRouteType => const RouteType.adaptive();
  @override
  List<AutoRoute> get routes => [
        AutoRoute(
          page: LoginPageRoute.page,
        ),
        AutoRoute(page: SplashPageRoute.page, path: "/"),
        AutoRoute(page: OnboardPageRoute.page),
        AutoRoute(page: SingupPageRoute.page),
        AutoRoute(page: ForgotPasswordPageRoute.page),
        AutoRoute(page: VerificationPageRoute.page),
        AutoRoute(page: ProductPageRoute.page),
        AutoRoute(page: CategoriesPageRoute.page),
        AutoRoute(page: SettingsPageRoute.page),
        AutoRoute(page: OrdersPageRoute.page),
        AutoRoute(page: CustomersPageRoute.page),
        AutoRoute(page: ResetPasswordPageRoute.page)
      ];
}
