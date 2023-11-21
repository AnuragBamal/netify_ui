import 'package:flutter/material.dart';
import 'package:netify/app/app_prefs.dart';
import 'package:netify/app/di.dart';
import 'package:netify/persentation/login/login_view_model.dart';
import 'package:netify/persentation/resources/assets_manager.dart';
import 'package:netify/persentation/resources/color_manager.dart';
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
    _appPreferences.removeJwtToken();
    _loginViewModel.start();
    _userNameController.addListener(() {
      _loginViewModel.setUserName(_userNameController.text);
    });
    _passwordController.addListener(() {
      _loginViewModel.setPassword(_passwordController.text);
    });
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: ColorManager.whiteColor,
        body: _getContentWidget(context));
  }

  Widget _getContentWidget(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(top: AppPadding.p100),
      child: SizedBox(
        width: MediaQuery.of(context).size.width * .90,
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p24),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p24),
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
                  padding:
                      const EdgeInsets.symmetric(horizontal: AppPadding.p24),
                  child: StreamBuilder<bool>(
                    stream: _loginViewModel.outputIsAllInputValid,
                    builder: (context, snapshot) {
                      return SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          onPressed: (snapshot.data == true)
                              ? () {
                                  _loginViewModel.login(context);
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
                          _loginViewModel.navigateToForgotPassword();
                        },
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(AppString.forgotPassword,
                              style: Theme.of(context).textTheme.bodyLarge),
                        ),
                      ),
                      TextButton(
                          onPressed: () {
                            _loginViewModel.navigateToSignup();
                          },
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(AppString.registerText,
                                style: Theme.of(context).textTheme.bodyLarge),
                          ))
                    ],
                  ),
                )
              ],
            ),
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
