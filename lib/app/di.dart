import 'package:get_it/get_it.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:netify/app/app_prefs.dart';
import 'package:netify/data/data_source/remote_data_source.dart';
import 'package:netify/data/network/api.dart';
import 'package:netify/data/network/dio_factory.dart';
import 'package:netify/data/network/network_info.dart';
import 'package:netify/data/repository/repository_implementor.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/create_operatorchart_usecase.dart';
import 'package:netify/domain/usecase/create_plan_usecase.dart';
import 'package:netify/domain/usecase/create_resellerchart_usecase.dart';
import 'package:netify/domain/usecase/create_subscriber_usecase.dart';
import 'package:netify/domain/usecase/create_subscription_usecase.dart';
import 'package:netify/domain/usecase/create_user_usecase.dart';
import 'package:netify/domain/usecase/forgot_password_usecase.dart';
import 'package:netify/domain/usecase/getdashboard_usecase.dart';
import 'package:netify/domain/usecase/getoperator_pricechart_usecase.dart';
import 'package:netify/domain/usecase/getplanprofile_usecase.dart';
import 'package:netify/domain/usecase/getplans_usecase.dart';
import 'package:netify/domain/usecase/getreseller_pricechart_usecase.dart';
import 'package:netify/domain/usecase/getresellermap_usecase.dart';
import 'package:netify/domain/usecase/getsubscriber_usecase.dart';
import 'package:netify/domain/usecase/getsubscription_metadata_usecase.dart';
import 'package:netify/domain/usecase/getsubscription_usecase.dart';
import 'package:netify/domain/usecase/getuser_usecase.dart';
import 'package:netify/domain/usecase/getuserlist_usecase.dart';
import 'package:netify/domain/usecase/login_usecase.dart';
import 'package:netify/domain/usecase/otp_usecase.dart';
import 'package:netify/domain/usecase/signup_usecase.dart';
import 'package:netify/persentation/forgot_password/forgot_password_view_model.dart';
import 'package:netify/persentation/login/login_view_model.dart';
import 'package:netify/persentation/main/home/home_page_view_model.dart';
import 'package:netify/persentation/main/home/subscriber/subscriber_view_model.dart';
import 'package:netify/persentation/main/home/subscription/subscription_view_model.dart';
import 'package:netify/persentation/main/home/user/create_user_view_model.dart';
import 'package:netify/persentation/main/plans/plans_view_model.dart';
import 'package:netify/persentation/main/plans/price_chart/create_price_chart_view_model.dart';
import 'package:netify/services/authentication_service.dart';

import 'package:netify/services/dialog_service.dart';
import 'package:netify/services/navigator_service.dart';
import 'package:netify/persentation/register/register_view_model.dart';
import 'package:netify/persentation/splash/splash_view_model.dart';
import 'package:netify/persentation/verification/verification_view_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

final instance = GetIt.instance;

Future<void> initAppModule() async {
  //Shared Preference instance
  if (!instance.isRegistered<SharedPreferences>()) {
    final sharedPrefs = await SharedPreferences.getInstance();
    instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  }
  if (!instance.isRegistered<NavigationService>()) {
    instance.registerLazySingleton<NavigationService>(
        () => NavigationService.instance);
  }
  //instance.registerLazySingleton<SharedPreferences>(() => sharedPrefs);
  //App Preference instance
  if (!instance.isRegistered<AppPreferences>()) {
    instance.registerLazySingleton<AppPreferences>(
        () => AppPreferences(instance<SharedPreferences>()));
  }
  //Instance of authentication service
  if (!instance.isRegistered<AuthenticationService>()) {
    final authService = AuthenticationService();
    instance.registerLazySingleton<AuthenticationService>(() => authService);
  }

  if (!instance.isRegistered<DialogService>()) {
    instance.registerLazySingleton<DialogService>(() => DialogService());
  }
  // final authService = AuthenticationService();
  // instance.registerLazySingleton<AuthenticationService>(() => authService);

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

  if (!GetIt.I.isRegistered<SplashViewModel>()) {
    instance.registerFactory<SplashViewModel>(
        () => SplashViewModel(instance(), instance()));
  }

  //Instance of authService
}

initTransportLayer() {}

initLoginModule() {
  if (!GetIt.I.isRegistered<LoginUseCase>()) {
    instance.registerFactory<LoginUseCase>(() => LoginUseCase(instance()));
    instance.registerFactory<LoginViewModel>(
        () => LoginViewModel(instance(), instance(), instance()));
  }
}

initVerificationModule() {
  if (!GetIt.I.isRegistered<VerifyOtpUseCase>()) {
    instance
        .registerFactory<VerifyOtpUseCase>(() => VerifyOtpUseCase(instance()));
    instance.registerFactory<GetOtpUseCase>(() => GetOtpUseCase(instance()));
    instance.registerFactory<VerificationViewModel>(() =>
        VerificationViewModel(instance(), instance(), instance(), instance()));
  }
}

initRegistrationModule() {
  if (!GetIt.I.isRegistered<SignUpUseCase>()) {
    instance.registerFactory<SignUpUseCase>(() => SignUpUseCase(instance()));
    instance.registerFactory<CheckDomainAvailiabilityUseCase>(
        () => CheckDomainAvailiabilityUseCase(instance()));
    instance.registerFactory<RegisterViewModel>(() =>
        RegisterViewModel(instance(), instance(), instance(), instance()));
  }
}

initForgotPasswordModule() {
  if (!GetIt.I.isRegistered<ForgotPasswordUseCase>()) {
    instance.registerFactory<ForgotPasswordUseCase>(
        () => ForgotPasswordUseCase(instance()));
    instance.registerFactory<ForgotPasswordViewModel>(
        () => ForgotPasswordViewModel(instance(), instance(), instance()));
  }
}

initHomepageModule() {
  if (!GetIt.I.isRegistered<GetUserUseCase>()) {
    instance.registerFactory<GetUserUseCase>(() => GetUserUseCase(instance()));
    instance.registerFactory<GetUserListUsecase>(
        () => GetUserListUsecase(instance()));
    instance.registerFactory<GetDashboardUseCase>(
        () => GetDashboardUseCase(instance()));
    instance.registerFactory<GetOperatorPriceChartUseCase>(
        () => GetOperatorPriceChartUseCase(instance()));
    instance
        .registerFactory<GetPlansUsecase>(() => GetPlansUsecase(instance()));
    instance.registerFactory<GetResellerPriceChartUseCase>(
        () => GetResellerPriceChartUseCase(instance()));
    instance.registerFactory<GetPlanProfileUseCase>(
        () => GetPlanProfileUseCase(instance()));
    instance.registerFactory<GetSubscriberUsecase>(
        () => GetSubscriberUsecase(instance()));
    instance.registerFactory<GetSubscriptionUsecase>(
        () => GetSubscriptionUsecase(instance()));
    instance.registerFactory<HomepageViewModel>(() => HomepageViewModel(
        instance(),
        instance(),
        instance(),
        instance(),
        instance(),
        instance(),
        instance()));
    instance.registerFactory<PlansPageViewModel>(() => PlansPageViewModel(
        instance(),
        instance(),
        instance(),
        instance(),
        instance(),
        instance()));
  }
}

initCreateUserModule() {
  if (!GetIt.I.isRegistered<CreateUserUseCase>()) {
    instance.registerFactory<CreateUserUseCase>(
        () => CreateUserUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<GetResellerMapUseCase>()) {
    instance.registerFactory<GetResellerMapUseCase>(
        () => GetResellerMapUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<UserViewModel>()) {
    instance.registerFactory<UserViewModel>(
        () => UserViewModel(instance(), instance(), instance(), instance()));
  }
}

initCreatePlanModule() {
  if (!GetIt.I.isRegistered<CreateOperatorPriceChartUsecase>()) {
    instance.registerFactory<CreateOperatorPriceChartUsecase>(
        () => CreateOperatorPriceChartUsecase(instance()));
  }

  if (!GetIt.I.isRegistered<CreatePlanUseCase>()) {
    instance.registerFactory<CreatePlanUseCase>(
        () => CreatePlanUseCase(instance()));
  }

  if (!GetIt.I.isRegistered<CreateResellerPriceChartUsecase>()) {
    instance.registerFactory<CreateResellerPriceChartUsecase>(
        () => CreateResellerPriceChartUsecase(instance()));
  }

  if (!GetIt.I.isRegistered<CreatePlanPageViewModel>()) {
    instance.registerFactory<CreatePlanPageViewModel>(() =>
        CreatePlanPageViewModel(instance(), instance(), instance(), instance(),
            instance(), instance()));
  }
}

initCreateSubscriber() {
  if (!GetIt.I.isRegistered<CreateSubscriberUseCase>()) {
    instance.registerFactory<CreateSubscriberUseCase>(
        () => CreateSubscriberUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<GetResellerMapUseCase>()) {
    instance.registerFactory<GetResellerMapUseCase>(
        () => GetResellerMapUseCase(instance()));
  }

  if (!GetIt.I.isRegistered<SubscriberViewModel>()) {
    instance.registerFactory<SubscriberViewModel>(() =>
        SubscriberViewModel(instance(), instance(), instance(), instance()));
  }
}

initCreateSubscription() {
  if (!GetIt.I.isRegistered<GetSubscriptionMetaUsecase>()) {
    instance.registerFactory<GetSubscriptionMetaUsecase>(
        () => GetSubscriptionMetaUsecase(instance()));
  }
  if (!GetIt.I.isRegistered<CreateSubscriptionUseCase>()) {
    instance.registerFactory<CreateSubscriptionUseCase>(
        () => CreateSubscriptionUseCase(instance()));
  }
  if (!GetIt.I.isRegistered<SubscriptionViewModel>()) {
    instance.registerFactory<SubscriptionViewModel>(() =>
        SubscriptionViewModel(instance(), instance(), instance(), instance()));
  }
}

resetAllmodules() async {
  instance.reset(dispose: false);
  initAppModule();
  initLoginModule();
  initVerificationModule();
  initRegistrationModule();
  initForgotPasswordModule();
}

ungegisterLoginHomePageModule() {
  instance.unregister<HomepageViewModel>();
  instance.unregister<GetUserUseCase>();
  instance.unregister<GetUserListUsecase>();
  instance.unregister<GetDashboardUseCase>();
}

unregisterCreateUserModule() {
  instance.unregister<CreateUserUseCase>();
  instance.unregister<GetResellerMapUseCase>();
  instance.unregister<UserViewModel>();
}
