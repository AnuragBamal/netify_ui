import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:netify/app/app_prefs.dart';
import 'package:netify/data/data_source/remote_data_source.dart';
import 'package:netify/data/network/api.dart';
import 'package:netify/data/network/dio_factory.dart';
import 'package:netify/data/network/network_info.dart';
import 'package:netify/data/repository/repository_implementor.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/forgot_password_usecase.dart';
import 'package:netify/domain/usecase/login_usecase.dart';
import 'package:netify/domain/usecase/otp_usecase.dart';
import 'package:netify/domain/usecase/signup_usecase.dart';
import 'package:netify/persentation/forgot_password/forgot_password_view_model.dart';
import 'package:netify/persentation/login/login_view_model.dart';
import 'package:netify/persentation/register/register_view_model.dart';
import 'package:netify/persentation/verification/verification_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  final sharedPrefs = await SharedPreferences.getInstance();
  //Shared Preference instance
  instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  //App Preference instance
  instance.registerLazySingleton<AppPreferences>(
      () => AppPreferences(instance<SharedPreferences>()));

  //Instance of network info
  instance.registerLazySingleton<NetworkInfo>(
      () => NetworkInfoImplementer(InternetConnectionChecker()));

  //Instance of dio factory
  instance.registerLazySingleton<DioFactory>(() => DioFactory(instance()));

  //Instance of API service client
  final dio = await instance<DioFactory>().getDio();
  instance.registerLazySingleton<ApiServiceClient>(() => ApiServiceClient(dio));

  //Instance of remote data source
  instance.registerLazySingleton<RemoteDataSource>(
      () => RemoteDataSourceImplementer(instance<ApiServiceClient>()));

  //Instance of repository
  instance.registerLazySingleton<Repository>(() => RepositoryImplementer(
      instance<RemoteDataSource>(), instance<NetworkInfo>()));
}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(() => LoginViewModel(instance()));
  }
}

initVerificationModule() {
  if (!GetIt.I.isRegistered<VerifyOtpUseCase>()) {
    instance
        .registerFactory<VerifyOtpUseCase>(() => VerifyOtpUseCase(instance()));
    instance.registerFactory<GetOtpUseCase>(() => GetOtpUseCase(instance()));
    instance.registerFactory<VerificationViewModel>(
        () => VerificationViewModel(instance(), instance()));
  }
}

initRegistrationModule() {
  if (!GetIt.I.isRegistered<SignUpUseCase>()) {
    instance.registerFactory<SignUpUseCase>(() => SignUpUseCase(instance()));
    instance.registerFactory<CheckDomainAvailiabilityUseCase>(
        () => CheckDomainAvailiabilityUseCase(instance()));
    instance.registerFactory<RegisterViewModel>(
        () => RegisterViewModel(instance(), instance()));
  }
}

initForgotPasswordModule() {
  if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
    instance.registerFactory<ForgotPasswordUseCase>(
        () => ForgotPasswordUseCase(instance()));
    instance.registerFactory<ForgotPasswordViewModel>(
        () => ForgotPasswordViewModel(instance()));
  }
}

resetAllmodules() {
  instance.reset(dispose: false);
  initAppModule();
  initLoginModule();
  initVerificationModule();
  initRegistrationModule();
  initForgotPasswordModule();
}
