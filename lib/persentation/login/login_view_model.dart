import 'dart:async';
import 'package:flutter/material.dart';
import 'package:netify/app/app_prefs.dart';
import 'package:netify/app/di.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/usecase/login_usecase.dart';
import 'package:netify/persentation/base/baseviewmodel.dart';
import 'package:netify/persentation/common/freezed_data_classes.dart';
import 'package:netify/services/dialog_service.dart';
import 'package:netify/services/navigator_service.dart';
import 'package:netify/persentation/resources/routes_manager.dart';

class LoginViewModel extends BaseViewModelInputsOutputs
    implements LoginViewModelInput, LoginViewModelOutput {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  final StreamController _isAllInputValidStreamController =
      StreamController<void>.broadcast();

  final AppPreferences _appPreferences = instance<AppPreferences>();

  var loginObject = LoginObject("", "");

  final LoginUseCase _loginUseCase;
  final NavigationService _navigatorService;
  final DialogService _dialogService;

  LoginViewModel(
      this._loginUseCase, this._navigatorService, this._dialogService);

  @override
  void dispose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
    _isAllInputValidStreamController.close();
  }

  @override
  void start() {
    // view tells state rendrer, please show the content of the screen.
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    loginObject =
        loginObject.copyWith(password: password); //data class operation
    _validate();
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    loginObject =
        loginObject.copyWith(username: userName); //data class operation
    _validate();
  }

  navigateToForgotPassword() {
    _navigatorService.navigateTo(Routes.forgotPasswordRoute);
  }

  navigateToSignup() {
    _navigatorService.navigateTo(Routes.registerRoute);
  }

  @override
  login(BuildContext context) async {
    _dialogService.showDialogOnScreen(
        context,
        DialogRequest(
            title: "Loading",
            description: "Loading",
            dialogType: DialogType.loading));
    var result = await _loginUseCase.execute(LoginUseCaseInput(
        username: loginObject.username, password: loginObject.password));

    result.fold((failure) => _handleFailure(failure, context),
        (data) => _handleSuccess(data, context));
  }

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputIsAllInputValid => _isAllInputValidStreamController.sink;

  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<bool> get outputIsUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));

  @override
  Stream<bool> get outputIsAllInputValid =>
      _isAllInputValidStreamController.stream.map((_) =>
          _isPasswordValid(loginObject.password) &&
          _isUserNameValid(loginObject.username));

  _validate() {
    inputIsAllInputValid.add(null);
  }

  bool _isPasswordValid(String password) {
    return password.length > 6;
  }

  bool _isUserNameValid(String username) {
    if (username.length < 4) {
      return false;
    }

    if (username.startsWith("@") ||
        username.substring(username.length - 3).contains("@")) {
      return false;
    }

    String regexPattern = r"^[a-zA-Z0-9]+@[a-zA-Z0-9]+$";
    RegExp regex = RegExp(regexPattern);

    return regex.hasMatch(username);
  }

  _handleFailure(Failure failure, BuildContext context) {
    Navigator.of(context).pop();
    _dialogService.showDialogOnScreen(
        context,
        DialogRequest(
            title: "Error",
            description: failure.message,
            dialogType: DialogType.error));
  }

  _handleSuccess(Login login, BuildContext context) async {
    Navigator.of(context).pop();
    // inputState.add(ContentState());
    await _appPreferences.setJwtToken(login.data[0].token);
    await resetAllmodules();

    if (login.data[0].isVerified == false) {
      _navigatorService.replaceRoute(Routes.verificationRoute);
    } else {
      _navigatorService.replaceRoute(Routes.homeRoute);
    }
    //navigate to main screen after the login
  }
}

abstract class LoginViewModelInput {
  //3 functions for actions
  setUserName(String userName);
  setPassword(String password);
  login(BuildContext context);
  //two sinks for streams
  Sink get inputUserName;
  Sink get inputPassword;
  Sink get inputIsAllInputValid;
}

abstract class LoginViewModelOutput {
  //two streams for output
  Stream<bool> get outputIsUserNameValid;
  Stream<bool> get outputIsPasswordValid;
  Stream<bool> get outputIsAllInputValid;
}
