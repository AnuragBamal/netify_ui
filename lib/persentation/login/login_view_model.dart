import 'dart:async';
import 'package:netify/app/app_prefs.dart';
import 'package:netify/app/di.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/usecase/login_usecase.dart';
import 'package:netify/persentation/base/baseviewmodel.dart';
import 'package:netify/persentation/common/freezed_data_classes.dart';
import 'package:netify/persentation/common/state_rendrer/state_rendrer.dart';
import 'package:netify/persentation/common/state_rendrer/state_rendrer_implementor.dart';
import 'package:netify/persentation/main/authentication_service.dart';

class LoginViewModel extends BaseViewModel
    implements LoginViewModelInput, LoginViewModelOutput {
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();

  final StreamController _isAllInputValidStreamController =
      StreamController<void>.broadcast();

  final StreamController isUserLoggedInSuccessfullyStreamController =
      StreamController<bool>();

  final StreamController verificationRequiredStreamController =
      StreamController<bool>();

  final AppPreferences _appPreferences = instance<AppPreferences>();

  var loginObject = LoginObject("", "");

  final LoginUseCase _loginUseCase;

  LoginViewModel(this._loginUseCase);

  @override
  void dispose() {
    _userNameStreamController.close();
    _passwordStreamController.close();
    _isAllInputValidStreamController.close();
    isUserLoggedInSuccessfullyStreamController.close();
    verificationRequiredStreamController.close();
    super.dispose();
  }

  @override
  void start() {
    // view tells state rendrer, please show the content of the screen.
    inputState.add(ContentState());
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

  @override
  login() async {
    inputState.add(
        LoadingState(stateRendrerType: StateRendrerType.popupLoadingState));
    (await _loginUseCase.execute(LoginUseCaseInput(
            username: loginObject.username, password: loginObject.password)))
        .fold((failure) => _handleFailure(failure),
            (data) => _handleSuccess(data));
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

  _handleFailure(Failure failure) {
    inputState.add(ErrorState(
        stateRendrerType: StateRendrerType.popupErrorState,
        message: failure.message));
  }

  _handleSuccess(Login login) async {
    // await _appPreferences.setJwtToken(login.data[0].token);
    // resetAllmodules();

    // inputState.add(ContentState());
    // if (login.data[0].isVerified == false) {
    //   verificationRequiredStreamController.add(true);
    // } else {
    //   verificationRequiredStreamController.add(false);
    //   final AuthenticationService authenticationService =
    //       instance();
    //   await authenticationService.signInUser(login.data[0].token);
    // }
    //isUserLoggedInSuccessfullyStreamController.add(true);
    await _appPreferences.setJwtToken(login.data[0].token);
    resetAllmodules();

    inputState.add(ContentState());
    if (login.data[0].isVerified == false) {
      verificationRequiredStreamController.add(true);
    } else {
      verificationRequiredStreamController.add(false);
    }
    isUserLoggedInSuccessfullyStreamController.add(true);
    //navigate to main screen after the login
  }
}

abstract class LoginViewModelInput {
  //3 functions for actions
  setUserName(String userName);
  setPassword(String password);
  login();
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
