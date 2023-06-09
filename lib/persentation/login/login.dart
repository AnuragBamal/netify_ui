import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:netify/app/app_prefs.dart';
import 'package:netify/app/di.dart';
import 'package:netify/persentation/common/state_rendrer/state_rendrer_implementor.dart';
import 'package:netify/persentation/login/login_view_model.dart';
import 'package:netify/persentation/resources/assets_manager.dart';
import 'package:netify/persentation/resources/color_manager.dart';
import 'package:netify/persentation/resources/routes_manager.dart';
import 'package:netify/persentation/resources/strings_manager.dart';
import 'package:netify/persentation/resources/values_manager.dart';

class LoginView extends StatefulWidget {
  const LoginView({super.key});

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView> {
  final LoginViewModel _loginViewModel = instance<LoginViewModel>();
  final AppPreferences _appPreferences = instance<AppPreferences>();
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  _bind() {
    _loginViewModel.start();
    _userNameController.addListener(() {
      _loginViewModel.setUserName(_userNameController.text);
    });
    _passwordController.addListener(() {
      _loginViewModel.setPassword(_passwordController.text);
    });
    _loginViewModel.isUserLoggedInSuccessfullyStreamController.stream
        .listen((isSuccessLoggedIn) {
      if (isSuccessLoggedIn) {
        _loginViewModel.verificationRequiredStreamController.stream
            .listen((isVerificationRequired) {
          if (isVerificationRequired) {
            //navigate to verification screen
            SchedulerBinding.instance.addPostFrameCallback((_) {
              var result =
                  Navigator.of(context).pushNamed(Routes.verificationRoute);
              result.then((value) {
                if (value != null && value.toString().isNotEmpty == true) {
                  _successfulLogin();
                }
              });
            });
          } else {
            //navigate to main screen
            _successfulLogin();
          }
        });
      }
    });
  }

  _successfulLogin() {
    _appPreferences.setUserLoggedIn();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      Navigator.of(context).pushReplacementNamed(Routes.homeRoute);
    });
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.surfaceColor,
        body: StreamBuilder<FlowState>(
          stream: _loginViewModel.outputState,
          builder: (context, snapshot) {
            return snapshot.data
                    ?.getScreenWidget(context, _getContentWidget(context), () {
                  _loginViewModel.login();
                }) ??
                _getContentWidget(context);
          },
        ));
  }

  Widget _getContentWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: AppPadding.p100),
      child: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              const SizedBox(
                height: AppSize.s100,
              ),
              const Image(
                image: AssetImage(ImageAssets.splashLogo),
                width: AppSize.s200,
              ),
              const SizedBox(
                height: AppSize.s64,
              ),
              Text(
                AppString.loginWelcome,
                style: Theme.of(context).textTheme.displayLarge,
              ),
              const SizedBox(
                height: AppSize.s64,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
                child: StreamBuilder<bool>(
                    stream: _loginViewModel.outputIsUserNameValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.emailAddress,
                        controller: _userNameController,
                        decoration: InputDecoration(
                          hintText: AppString.usernameHint,
                          labelText: AppString.username,
                          errorText:
                              snapshot.data == true || snapshot.data == null
                                  ? null
                                  : AppString.usernameError,
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: AppSize.s48,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
                child: StreamBuilder<bool>(
                    stream: _loginViewModel.outputIsPasswordValid,
                    builder: (context, snapshot) {
                      return TextFormField(
                        keyboardType: TextInputType.visiblePassword,
                        controller: _passwordController,
                        obscureText: true,
                        decoration: InputDecoration(
                          hintText: AppString.passwordHint,
                          labelText: AppString.password,
                          errorText:
                              snapshot.data == true || snapshot.data == null
                                  ? null
                                  : AppString.passwordError,
                        ),
                      );
                    }),
              ),
              const SizedBox(
                height: AppSize.s48,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: AppPadding.p24),
                child: StreamBuilder<bool>(
                  stream: _loginViewModel.outputIsAllInputValid,
                  builder: (context, snapshot) {
                    return SizedBox(
                      width: double.infinity,
                      child: ElevatedButton(
                        onPressed: (snapshot.data == true)
                            ? () {
                                _loginViewModel.login();
                              }
                            : null,
                        child: const Text(AppString.login),
                      ),
                    );
                  },
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(
                    top: AppPadding.p8,
                    left: AppPadding.p24,
                    right: AppPadding.p24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    TextButton(
                      onPressed: () {
                        Navigator.pushNamed(
                            context, Routes.forgotPasswordRoute);
                      },
                      child: Text(AppString.forgotPassword,
                          style: Theme.of(context).textTheme.bodyLarge),
                    ),
                    TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Routes.registerRoute);
                        },
                        child: Text(AppString.registerText,
                            style: Theme.of(context).textTheme.bodyLarge))
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _loginViewModel.dispose();
    _userNameController.dispose();
    _passwordController.dispose();
    super.dispose();
  }
}
