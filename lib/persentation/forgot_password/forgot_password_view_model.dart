import 'dart:async';
import 'package:flutter/material.dart';
import 'package:netify/domain/usecase/forgot_password_usecase.dart';
import 'package:netify/persentation/base/baseviewmodel.dart';
import 'package:netify/persentation/common/freezed_data_classes.dart';
import 'package:netify/services/dialog_service.dart';
import 'package:netify/services/navigator_service.dart';

class ForgotPasswordViewModel extends BaseViewModelInputsOutputs
    implements ForgotPasswordViewModelInput, ForgotPasswordViewModelOutput {
  final StreamController<String> _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController<String> _newPasscodeStreamController =
      StreamController<String>.broadcast();
  final StreamController<String> _confirmNewPasscodeStreamController =
      StreamController<String>.broadcast();
  final StreamController<String> _otpStreamController =
      StreamController<String>();
  final StreamController<bool> _isAllInputValidStreamController =
      StreamController<bool>.broadcast();
  final StreamController<bool> _isOtpSentStreamController =
      StreamController<bool>.broadcast();
  final StreamController<bool> _isPasswordUpdatedStreamController =
      StreamController<bool>.broadcast();

  ForgotPasswordObject forgotPasswordObject =
      ForgotPasswordObject("", "", "", "", false);

  final ForgotPasswordUseCase _forgotPasswordUseCase;
  final NavigationService _navigationService;
  final DialogService _dialogService;

  ForgotPasswordViewModel(this._forgotPasswordUseCase, this._navigationService,
      this._dialogService);

  //----------------------Input----------------------

  @override
  void setConfirmNewPasscode(String password) {
    inputConfirmNewPasscode.add(password);
    if (_isConfirmPasscodeValid(password)) {
      forgotPasswordObject =
          forgotPasswordObject.copyWith(confirmPassword: password);
    } else {
      forgotPasswordObject = forgotPasswordObject.copyWith(confirmPassword: "");
    }
    _validate();
  }

  @override
  void setNewPasscode(String password) {
    if (_isNewPasscodeValid(password)) {
      forgotPasswordObject =
          forgotPasswordObject.copyWith(newPaasCode: password);
      inputNewPasscode.add(password);
    } else {
      forgotPasswordObject = forgotPasswordObject.copyWith(newPaasCode: "");
      inputNewPasscode.add("");
    }
    _validate();
  }

  @override
  void setOtp(String otp) {
    inputOtp.add(otp);
    forgotPasswordObject = forgotPasswordObject.copyWith(otp: otp);
    _validate();
  }

  @override
  void setUserName(String userName) {
    if (_isUserNameValid(userName)) {
      forgotPasswordObject = forgotPasswordObject.copyWith(userName: userName);
      inputUserName.add(userName);
    } else {
      forgotPasswordObject = forgotPasswordObject.copyWith(userName: "");
      inputUserName.add("");
    }
    _validate();
  }

  void setIsOtpSent(bool isOtpSent) {
    inputIsOtpSent.add(isOtpSent);
    if (isOtpSent) {
      forgotPasswordObject = forgotPasswordObject.copyWith(isOtpSent: true);
    } else {
      forgotPasswordObject = forgotPasswordObject.copyWith(isOtpSent: false);
    }
    _validate();
  }

  void setPasswordUpdated(passwordUpdated) {
    inputIsPasswordUpdated.add(passwordUpdated);
  }

  @override
  void dispose() {
    _userNameStreamController.close();
    _newPasscodeStreamController.close();
    _confirmNewPasscodeStreamController.close();
    _otpStreamController.close();
    _isAllInputValidStreamController.close();
    _isOtpSentStreamController.close();
    _isPasswordUpdatedStreamController.close();
  }

  @override
  void start() {}

  @override
  void submitForgotPassword(BuildContext context) async {
    _dialogService.showDialogOnScreen(
        context,
        DialogRequest(
            title: "Loading",
            description: "Loading",
            dialogType: DialogType.loading));
    if (!forgotPasswordObject.isOtpSent) {
      final result =
          await _forgotPasswordUseCase.execute(ForgotPasswordUseCaseInput(
        userName: forgotPasswordObject.userName,
      ));
      result.fold((error) {
        Navigator.of(context).pop();
        _dialogService.showDialogOnScreen(
            context,
            DialogRequest(
                title: "Error",
                description: error.message,
                dialogType: DialogType.error));
        //Yet to implement
      }, (success) {
        Navigator.of(context).pop();
        var successDialouge = _dialogService.showDialogOnScreen(
            context,
            DialogRequest(
                title: "Success",
                description: success.data[0].message,
                dialogType: DialogType.info));
        successDialouge.then((value) => setIsOtpSent(true));
      });
    } else {
      final result = await _forgotPasswordUseCase.execute(
          ForgotPasswordUseCaseInput(
              userName: forgotPasswordObject.userName,
              otp: forgotPasswordObject.otp,
              newPasscode: forgotPasswordObject.newPaasCode));
      result.fold((error) {
        Navigator.of(context).pop();
        _dialogService.showDialogOnScreen(
            context,
            DialogRequest(
                title: "Error",
                description: error.message,
                dialogType: DialogType.error));
      }, (success) {
        Navigator.of(context).pop();
        var successDialouge = _dialogService.showDialogOnScreen(
            context,
            DialogRequest(
                title: "Success",
                description: success.data[0].message,
                dialogType: DialogType.info));
        successDialouge.then((value) {
          _navigationService.goBack();
          setPasswordUpdated(true);
        });
        //yet to implement
      });
    }
  }

  @override
  Sink get inputConfirmNewPasscode => _confirmNewPasscodeStreamController.sink;

  @override
  Sink get inputNewPasscode => _newPasscodeStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputOtp => _otpStreamController.sink;

  @override
  Sink get inputIsOtpSent => _isOtpSentStreamController.sink;

  @override
  Sink get inputIsPasswordUpdated => _isPasswordUpdatedStreamController.sink;

  Sink get inputIsAllInputValid => _isAllInputValidStreamController.sink;
//----------------------Output----------------------
  @override
  Stream<bool> get outputIsUserNameValid => _userNameStreamController.stream
      .map((username) => _isUserNameValid(username));

  @override
  Stream<String?> get outputErrorUserName => outputIsUserNameValid
      .map((isUserNameValid) => isUserNameValid ? null : "Invalid Username");

  @override
  Stream<bool> get outputIsConfirmPasscodeValid =>
      _confirmNewPasscodeStreamController.stream
          .map((confirmPasscode) => _isConfirmPasscodeValid(confirmPasscode));

  @override
  Stream<String?> get outputErrorConfirmPasscode =>
      outputIsConfirmPasscodeValid.map((isConfirmPasscodeValid) =>
          isConfirmPasscodeValid ? null : "Invalid Confirm Passcode");

  @override
  Stream<bool> get outputIsNewPasscodeValid =>
      _newPasscodeStreamController.stream
          .map((newPasscode) => _isNewPasscodeValid(newPasscode));
  @override
  Stream<String?> get outputErrorNewPasscode => outputIsNewPasscodeValid.map(
      (isNewPasscodeValid) => isNewPasscodeValid ? null : "Invalid Passcode");

  @override
  Stream<bool> get outputIsAllInputValid =>
      _isAllInputValidStreamController.stream.map((_) => _isAllInputValid());

  @override
  Stream<bool> get outputIsOtpSent =>
      _isOtpSentStreamController.stream.map((isOtpSent) => isOtpSent);

  @override
  Stream<bool> get outputIsPasswordUpdated =>
      _isPasswordUpdatedStreamController.stream
          .map((isPasswordUpdated) => isPasswordUpdated);

//----------------------Helper----------------------
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

  bool _isConfirmPasscodeValid(String confirmPassword) {
    return _isNewPasscodeValid(forgotPasswordObject.newPaasCode!) &&
        confirmPassword == forgotPasswordObject.newPaasCode;
  }

  bool _isNewPasscodeValid(String password) {
    // Password pattern: At least 8 characters, including uppercase, lowercase, digits, and special characters
    final pattern =
        RegExp(r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,}$');

    // Additional checks
    final isLengthValid = password.length >= 8;
    final hasUppercase =
        pattern.hasMatch(password) && password.contains(RegExp(r'[A-Z]'));
    final hasLowercase =
        pattern.hasMatch(password) && password.contains(RegExp(r'[a-z]'));
    final hasDigit =
        pattern.hasMatch(password) && password.contains(RegExp(r'\d'));
    final hasSpecialChar =
        pattern.hasMatch(password) && password.contains(RegExp(r'[\W_]'));

    return isLengthValid &&
        hasUppercase &&
        hasLowercase &&
        hasDigit &&
        hasSpecialChar;
  }

  bool _isAllInputValid() {
    if (_isUserNameValid(forgotPasswordObject.userName) &&
        !forgotPasswordObject.isOtpSent) {
      return true;
    } else if (_isUserNameValid(forgotPasswordObject.userName) &&
        forgotPasswordObject.isOtpSent &&
        _isNewPasscodeValid(forgotPasswordObject.newPaasCode!) &&
        forgotPasswordObject.otp != null &&
        forgotPasswordObject.otp!.isNotEmpty &&
        forgotPasswordObject.confirmPassword.isNotEmpty) {
      return true;
    } else {
      return false;
    }
  }

  _validate() {
    inputIsAllInputValid.add(false);
  }
}

abstract class ForgotPasswordViewModelInput {
  void submitForgotPassword(BuildContext context);
  void setUserName(String userName);
  void setOtp(String userName);
  void setNewPasscode(String userName);
  void setConfirmNewPasscode(String userName);
  Sink get inputUserName;
  Sink get inputNewPasscode;
  Sink get inputConfirmNewPasscode;
  Sink get inputOtp;
  Sink get inputIsOtpSent;
  Sink get inputIsPasswordUpdated;
}

abstract class ForgotPasswordViewModelOutput {
  Stream<bool> get outputIsUserNameValid;
  Stream<String?> get outputErrorUserName;
  Stream<bool> get outputIsNewPasscodeValid;
  Stream<String?> get outputErrorNewPasscode;
  Stream<bool> get outputIsAllInputValid;
  Stream<bool> get outputIsConfirmPasscodeValid;
  Stream<String?> get outputErrorConfirmPasscode;
  Stream<bool> get outputIsOtpSent;
  Stream<bool> get outputIsPasswordUpdated;
}
