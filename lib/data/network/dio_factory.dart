import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:netify/app/app_prefs.dart';
import 'package:netify/app/constant.dart';
import 'package:netify/persentation/resources/language_manager.dart';
import 'package:netify/persentation/resources/values_manager.dart';

const String applicationJson = "application/json";
const String contentType = "content-type";
const String accept = "accept";
const String authorization = "authorization";
const String defaultLanguage = "language";

class DioFactory {
  final AppPreferences _appPreferences;
  DioFactory(this._appPreferences);
  Future<Dio> getDio() async {
    Dio dio = Dio();
    Duration timeOut = const Duration(minutes: DurationConstants.timeoutMin);
    String language = await _appPreferences.getAppLanguage();
    language = LanguageType.english.languageCode;
    Map<String, String> headers = {
      contentType: applicationJson,
      accept: applicationJson,
      authorization: await _appPreferences.getJwtToken() ?? "",
      defaultLanguage: language
    };
    dio.options = BaseOptions(
        baseUrl: Constant.baseUrl,
        connectTimeout: timeOut,
        receiveTimeout: timeOut,
        headers: headers);

    if (kReleaseMode) {
      print("Release Mode. No Logs.");
    } else {
      dio.interceptors.add(LogInterceptor(
          request: true,
          requestBody: true,
          responseBody: true,
          requestHeader: true,
          responseHeader: true));
    }
    return dio;
  }
}
