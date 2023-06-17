import 'package:netify/persentation/resources/language_manager.dart';
import 'package:shared_preferences/shared_preferences.dart';

const String appLanguage = "APP_LANGUAGE";
const String prefsKeyOnboardingScreen = "PREFS_KEY_ONBOARDING_SCREEN";
const String prefsKeyIsUserLoggedIn = "PREFS_KEY_IS_USER_LOGGED_IN";

class AppPreferences {
  final SharedPreferences _sharedPreferences;
  AppPreferences(this._sharedPreferences);

  Future<String> getAppLanguage() async {
    String? language = _sharedPreferences.getString(appLanguage);
    if (language == null || language.isEmpty) {
      return LanguageType.english.languageCode;
    }
    return language;
  }

  Future<void> clearAll() async {
    await _sharedPreferences.clear();
  }

  Future<void> setOnboardingScreenIsShown() async {
    await _sharedPreferences.setBool(prefsKeyOnboardingScreen, true);
  }

  Future<bool> getOnboardingScreenIsShown() async {
    return _sharedPreferences.getBool(prefsKeyOnboardingScreen) ?? false;
  }

  Future<void> setUserLoggedIn() async {
    await _sharedPreferences.setBool(prefsKeyIsUserLoggedIn, true);
  }

  Future<bool> isUserLoggedIn() async {
    return _sharedPreferences.getBool(prefsKeyIsUserLoggedIn) ?? false;
  }

  Future<bool> setJwtToken(String token) async {
    return await _sharedPreferences.setString("jwt_token", token);
  }

  Future<bool> removeJwtToken() async {
    return await _sharedPreferences.remove("jwt_token");
  }

  Future<String?> getJwtToken() async {
    return _sharedPreferences.getString("jwt_token") ?? "";
  }
}
