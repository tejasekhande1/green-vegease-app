import 'package:auto_route/annotations.dart';
import 'package:auto_route/auto_route.dart';
import 'package:green_vegease/features/splashscreen/presentation/pages/splash_page.dart';

import '../../features/auth/presentation/pages/login_page.dart';
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
      ];
}
