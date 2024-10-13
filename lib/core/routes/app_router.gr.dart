// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouterGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

part of 'app_router.dart';

/// generated route for
/// [CategoriesPage]
class CategoriesPageRoute extends PageRouteInfo<void> {
  const CategoriesPageRoute({List<PageRouteInfo>? children})
      : super(
          CategoriesPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'CategoriesPageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CategoriesPage();
    },
  );
}

/// generated route for
/// [CustomersPage]
class CustomersPageRoute extends PageRouteInfo<void> {
  const CustomersPageRoute({List<PageRouteInfo>? children})
      : super(
          CustomersPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'CustomersPageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const CustomersPage();
    },
  );
}

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
/// [OrdersPage]
class OrdersPageRoute extends PageRouteInfo<void> {
  const OrdersPageRoute({List<PageRouteInfo>? children})
      : super(
          OrdersPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'OrdersPageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const OrdersPage();
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
/// [ResetPasswordPage]
class ResetPasswordPageRoute extends PageRouteInfo<void> {
  const ResetPasswordPageRoute({List<PageRouteInfo>? children})
      : super(
          ResetPasswordPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'ResetPasswordPageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const ResetPasswordPage();
    },
  );
}

/// generated route for
/// [SettingsPage]
class SettingsPageRoute extends PageRouteInfo<void> {
  const SettingsPageRoute({List<PageRouteInfo>? children})
      : super(
          SettingsPageRoute.name,
          initialChildren: children,
        );

  static const String name = 'SettingsPageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      return const SettingsPage();
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
    bool isResetPass = false,
    List<PageRouteInfo>? children,
  }) : super(
          VerificationPageRoute.name,
          args: VerificationPageRouteArgs(
            key: key,
            isResetPass: isResetPass,
          ),
          initialChildren: children,
        );

  static const String name = 'VerificationPageRoute';

  static PageInfo page = PageInfo(
    name,
    builder: (data) {
      final args = data.argsAs<VerificationPageRouteArgs>(
          orElse: () => const VerificationPageRouteArgs());
      return VerificationPage(
        key: args.key,
        isResetPass: args.isResetPass,
      );
    },
  );
}

class VerificationPageRouteArgs {
  const VerificationPageRouteArgs({
    this.key,
    this.isResetPass = false,
  });

  final Key? key;

  final bool isResetPass;

  @override
  String toString() {
    return 'VerificationPageRouteArgs{key: $key, isResetPass: $isResetPass}';
  }
}
