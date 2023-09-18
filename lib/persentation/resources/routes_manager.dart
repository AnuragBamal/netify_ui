import 'package:flutter/material.dart';
import 'package:netify/app/di.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/persentation/forgot_password/forgot_password.dart';
import 'package:netify/persentation/login/login.dart';
import 'package:netify/persentation/main/home/subscriber/create_subscriber.dart';
import 'package:netify/persentation/main/home/subscription/create_subscription.dart';
import 'package:netify/persentation/main/home/user/create_user.dart';
import 'package:netify/persentation/main/main.dart';
import 'package:netify/persentation/main/plans/create_plan/create_plan.dart';
import 'package:netify/persentation/main/plans/price_chart/create_price_chart.dart';
import 'package:netify/persentation/main/settings/nas/create_nas.dart';
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
  static const String createpricechart = "/createpricechart";
  static const String createPlan = "/createplan";
  static const String createSubscriber = "/createsubscriber";
  static const String createSubscription = "/createsubscription";
  static const String createNas = "/createnas";
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
        final LoginUserInfoArgument args =
            settings.arguments as LoginUserInfoArgument;
        return MaterialPageRoute(
            builder: (_) => Verification(
                  argument: args,
                ));
      case Routes.registerRoute:
        initRegistrationModule();
        return MaterialPageRoute(builder: (_) => const RegisterView());
      case Routes.forgotPasswordRoute:
        initForgotPasswordModule();
        return MaterialPageRoute(builder: (_) => const ForgotPasswordView());
      case Routes.homeRoute:
        initHomepageModule();
        final LoginUserInfoArgument args =
            settings.arguments as LoginUserInfoArgument;
        return MaterialPageRoute(
            builder: (_) => Main(
                  argument: args,
                ));

      case Routes.createuser:
        initCreateUserModule();
        final CreateUserViewArguments args =
            settings.arguments as CreateUserViewArguments;
        return MaterialPageRoute(
            builder: (_) => CreateUserView(
                  arguments: args,
                ));
      case Routes.createPlan:
        initCreateNewPlan();
        return MaterialPageRoute(builder: (_) => const CreateNewPlan());

      case Routes.createpricechart:
        initCreatePlanModule();
        final CreatePriceChartArguments args =
            settings.arguments as CreatePriceChartArguments;
        return MaterialPageRoute(
            builder: (_) => CreatePriceChart(
                  arguments: args,
                ));

      case Routes.createSubscriber:
        initCreateSubscriber();
        return MaterialPageRoute(builder: (_) => const CreateSubscriber());

      case Routes.createSubscription:
        initCreateSubscription();
        return MaterialPageRoute(builder: (_) => const CreateNewSubscription());

      case Routes.createNas:
        initCreateNas();
        List<String> supportedNasType = settings.arguments as List<String>;
        return MaterialPageRoute(
            builder: (_) => CreateNewNas(
                  supportedNasType: supportedNasType,
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
