import 'dart:async';

import 'package:netify/app/app_prefs.dart';
import 'package:netify/services/navigator_service.dart';
import 'package:netify/persentation/resources/routes_manager.dart';

class SplashViewModel {
  final NavigationService _navigatorService;
  final AppPreferences _appPreferences;
  Timer? timer;
  SplashViewModel(this._navigatorService, this._appPreferences);

  void start() {
    _startDelay();
  }

  void dispose() {
    timer?.cancel();
  }

  _startDelay() {
    timer = Timer(const Duration(seconds: 3), _goNext);
  }

  _goNext() async {
    _appPreferences.clearAll();
    _appPreferences.isUserLoggedIn().then((isUserLoggedIn) => {
          if (isUserLoggedIn)
            {_navigatorService.replaceRoute(Routes.homeRoute)}
          else
            {
              _appPreferences
                  .getOnboardingScreenIsShown()
                  .then((isOnboardingScreenViewed) => {
                        if (isOnboardingScreenViewed)
                          {_navigatorService.replaceRoute(Routes.loginRoute)}
                        else
                          {
                            _navigatorService
                                .replaceRoute(Routes.onBoardingRoute)
                          }
                      })
            }
        });
  }
}
