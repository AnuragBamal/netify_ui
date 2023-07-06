import 'package:flutter/material.dart';
import 'package:netify/app/di.dart';
import 'package:netify/persentation/forgot_password/forgot_password.dart';
import 'package:netify/persentation/login/login.dart';
import 'package:netify/persentation/main/home/user/create_user.dart';
import 'package:netify/persentation/main/main.dart';
import 'package:netify/persentation/main/plans/price_chart/create_price_chart.dart';
import 'package:netify/persentation/onboarding/onboarding.dart';
import 'package:netify/persentation/resources/strings_manager.dart';
import 'package:netify/persentation/splash/splash.dart';
import 'package:netify/persentation/verification/verification.dart';
import '../register/register.dart';

class Routes {
  static const String splashRoute = "/";
  static const String onBoardingRoute = "/onboarding";
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String forgotPasswordRoute = "/forgotpassword";
  static const String homeRoute = "/home";
  static const String verificationRoute = "/verification";
  static const String createuser = "/createuser";
  static const String userops = "/userops";
  static const String createplan = "/createplan";
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashView());
      case Routes.onBoardingRoute:
        return MaterialPageRoute(builder: (_) => const OnboardingView());
      case Routes.loginRoute:
        initLoginModule();
        return MaterialPageRoute(builder: (_) => const LoginView());
      case Routes.verificationRoute:
        initVerificationModule();
        return MaterialPageRoute(builder: (_) => const Verification());
      case Routes.registerRoute:
        initRegistrationModule();
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        initForgotPasswordModule();
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.homeRoute:
        initHomepageModule();
        return MaterialPageRoute(builder: (_) => const Main());

      case Routes.createuser:
        initCreateUserModule();
        final CreateUserViewArguments args =
            settings.arguments as CreateUserViewArguments;
        return MaterialPageRoute(
            builder: (_) => CreateUserView(
                  arguments: args,
                ));
      case Routes.createplan:
        initCreatePlanModule();
        final CreatePriceChartArguments args =
            settings.arguments as CreatePriceChartArguments;
        return MaterialPageRoute(
            builder: (_) => CreatePriceChart(
                  arguments: args,
                ));

      default:
        return undefinedRoute();
    }
  }
}

Route<dynamic> undefinedRoute() {
  return MaterialPageRoute(
      builder: (_) => Scaffold(
            appBar: AppBar(
              title: const Text(AppString.noRouteFound),
            ),
            body: const Center(
              child: Text(AppString.noRouteFound),
            ),
          ));
}
