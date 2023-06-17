import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netify/app/app_prefs.dart';
import 'package:netify/app/di.dart';
import 'package:netify/persentation/resources/assets_manager.dart';
import 'package:netify/persentation/resources/color_manager.dart';
import 'package:netify/persentation/resources/values_manager.dart';

import '../resources/routes_manager.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();
}

class _SplashViewState extends State<SplashView> {
  Timer? timer;
  final AppPreferences _appPreferences = instance<AppPreferences>();

  _startDelay() {
    timer = Timer(const Duration(seconds: 3), _goNext);
  }

  _goNext() async {
    _appPreferences.clearAll();
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
          if (isUserLoggedIn)
            {Navigator.pushReplacementNamed(context, Routes.homeRoute)}
          else
            {
              _appPreferences
                  .getOnboardingScreenIsShown()
                  .then((isOnboardingScreenViewed) => {
                        if (isOnboardingScreenViewed)
                          {
                            Navigator.pushReplacementNamed(
                                context, Routes.loginRoute)
                          }
                        else
                          {
                            Navigator.pushReplacementNamed(
                                context, Routes.onBoardingRoute)
                          }
                      })
            }
        });
  }

  @override
  void initState() {
    super.initState();
    _startDelay();
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: ColorManager.surfaceColor,
      body: Center(
          child: Image(
        image: AssetImage(ImageAssets.splashLogo),
        width: AppSize.s200,
      )),
    );
  }
}
