// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [ForgotPasswordPage]
class ForgotPasswordPageRoute extends PageRouteInfo<void> {
  const ForgotPasswordPageRoute({List<PageRouteInfo>? children})
      : super(
          ForgotPasswordPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ForgotPasswordPageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ForgotPasswordPage();
    },
  );
}

/// generated route for
/// [LoginPage]
class LoginPageRoute extends PageRouteInfo<void> {
  const LoginPageRoute({List<PageRouteInfo>? children})
      : super(
          LoginPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'LoginPageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const LoginPage();
    },
  );
}

/// generated route for
/// [OnboardPage]
class OnboardPageRoute extends PageRouteInfo<void> {
  const OnboardPageRoute({List<PageRouteInfo>? children})
      : super(
          OnboardPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'OnboardPageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OnboardPage();
    },
  );
}

/// generated route for
/// [ProductPage]
class ProductPageRoute extends PageRouteInfo<void> {
  const ProductPageRoute({List<PageRouteInfo>? children})
      : super(
          ProductPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ProductPageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ProductPage();
    },
  );
}

/// generated route for
/// [SingupPage]
class SingupPageRoute extends PageRouteInfo<void> {
  const SingupPageRoute({List<PageRouteInfo>? children})
      : super(
          SingupPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SingupPageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SingupPage();
    },
  );
}

/// generated route for
/// [SplashPage]
class SplashPageRoute extends PageRouteInfo<void> {
  const SplashPageRoute({List<PageRouteInfo>? children})
      : super(
          SplashPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SplashPageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SplashPage();
    },
  );
}

/// generated route for
/// [VerificationPage]
class VerificationPageRoute extends PageRouteInfo<VerificationPageRouteArgs> {
  VerificationPageRoute({
    Key? key,
    List<PageRouteInfo>? children,
  }) : super(
          VerificationPageRoute.name,
          args: VerificationPageRouteArgs(key: key),
          initialChildren: children,
        );

  static const String name = 'VerificationPageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerificationPageRouteArgs>(
          orElse: () => const VerificationPageRouteArgs());
      return VerificationPage(key: args.key);
    },
  );
}

class VerificationPageRouteArgs {
  const VerificationPageRouteArgs({this.key});

  final Key? key;

  @override
  String toString() {
    return 'VerificationPageRouteArgs{key: $key}';
  }
}
