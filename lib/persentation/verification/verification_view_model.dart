import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/usecase/otp_usecase.dart';
import 'package:netify/persentation/base/baseviewmodel.dart';
import 'package:netify/persentation/common/freezed_data_classes.dart';
import 'package:netify/services/dialog_service.dart';
import 'package:netify/services/navigator_service.dart';
import 'package:netify/persentation/resources/routes_manager.dart';

const defaultCount = 60;

class VerificationViewModel extends BaseViewModelInputsOutputs
    implements VerificationViewModelInput, VerificationViewModelOutput {
  int _currentCounter = defaultCount;
  Timer? _timer;

  final StreamController _inputOtpStreamController =
      StreamController<String>.broadcast();
  final StreamController _inputRegenerateOtpStreamController =
      StreamController<RegenerateOtp>.broadcast();
  final StreamController _inputActiveSubmitOtpStreamController =
      StreamController<void>.broadcast();

  var verifyOtpObject = VerifyOtpObject("");

  final VerifyOtpUseCase _verifyOtpUseCase;
  final GetOtpUseCase _regenerateOtpUseCase;
  final NavigationService _navigatorService;
  final DialogService _dialogService;

  VerificationViewModel(this._verifyOtpUseCase, this._regenerateOtpUseCase,
      this._navigatorService, this._dialogService);

  @override
  void dispose() {
    _inputOtpStreamController.close();
    _inputRegenerateOtpStreamController.close();
    _inputActiveSubmitOtpStreamController.close();
    _timer?.cancel();
  }

  @override
  void start() {}

  @override
  setOtp(String otp) {
    inputOtp.add(otp);
    verifyOtpObject = verifyOtpObject.copyWith(otp: otp);
    _validate();
  }

  @override
  void submitOtp(
      BuildContext context, LoginUserInfoArgument loginUserDetails) async {
    _dialogService.showDialogOnScreen(
        context,
        DialogRequest(
            title: "Loading",
            description: "Loading",
            dialogType: DialogType.loading));
    (await _verifyOtpUseCase
            .execute(VerifyOtpUseCaseInput(otp: verifyOtpObject.otp)))
        .fold((failure) => _handleFailureVerifyOtp(failure, context),
            (data) => _handleSuccessVerifyOtp(data, context, loginUserDetails));
  }

  @override
  void regenerateOtp(BuildContext context) async {
    _dialogService.showDialogOnScreen(
        context,
        DialogRequest(
            title: "Loading",
            description: "Loading",
            dialogType: DialogType.loading));
    (await _regenerateOtpUseCase.execute()).fold(
        (failure) => _handleFailureRegenerateOtp(failure, context),
        (data) => _handleSuccessRegenerateOtp(data, context));

    // _disableRegenerateButton();
  }

  @override
  Sink get inputOtp => _inputOtpStreamController.sink;

  @override
  Sink get inputActiveSubmitOtp => _inputActiveSubmitOtpStreamController.sink;

  @override
  Sink get inputRegenerateOtp => _inputRegenerateOtpStreamController.sink;

  @override
  Stream<RegenerateOtp> get outputIsRegenerateOtp =>
      _inputRegenerateOtpStreamController.stream.map((status) => status);

  @override
  Stream<bool> get outputActiveSubmitOtp =>
      _inputActiveSubmitOtpStreamController.stream
          .map((_) => _isValidOtp(verifyOtpObject.otp));

  void _validate() {
    inputActiveSubmitOtp.add(null);
  }

  bool _isValidOtp(String otp) {
    return otp.length == 8 ? true : false;
  }

  void _disableRegenerateButton() {
    inputRegenerateOtp.add(RegenerateOtp(false, 60));
    _currentCounter = defaultCount;
    // disableCountLeft.add(60);
    _timer = Timer.periodic(const Duration(seconds: 1), (Timer timer) {
      if (_currentCounter > 0) {
        _currentCounter--;
        inputRegenerateOtp.add(RegenerateOtp(false, _currentCounter));
      } else {
        inputRegenerateOtp.add(RegenerateOtp(true, _currentCounter));
        _timer!.cancel();
      }
    });
  }

  _handleFailureVerifyOtp(Failure failure, BuildContext context) {
    Navigator.of(context).pop();
    _dialogService.showDialogOnScreen(
        context,
        DialogRequest(
            title: "Error",
            description: failure.message,
            dialogType: DialogType.error));
  }

  _handleSuccessVerifyOtp(GeneralSuccess data, BuildContext context,
      LoginUserInfoArgument loginUserDetails) {
    Navigator.of(context).pop();
    var successDialouge = _dialogService.showDialogOnScreen(
        context,
        DialogRequest(
            title: "Success",
            description: data.data[0].message,
            dialogType: DialogType.info));
    successDialouge.then((value) => _navigatorService
        .replaceRoute(Routes.homeRoute, arguments: loginUserDetails));
  }

  _handleFailureRegenerateOtp(Failure failure, BuildContext context) {
    Navigator.of(context).pop();
    _dialogService.showDialogOnScreen(
        context,
        DialogRequest(
            title: "Error",
            description: failure.message,
            dialogType: DialogType.error));
    _disableRegenerateButton();
  }

  _handleSuccessRegenerateOtp(GeneralSuccess data, BuildContext context) {
    Navigator.of(context).pop();
    _dialogService.showDialogOnScreen(
        context,
        DialogRequest(
            title: "Success",
            description: data.data[0].message,
            dialogType: DialogType.info));
    _disableRegenerateButton();
  }
}

abstract class VerificationViewModelInput {
  // 3 Actions user can perform
  setOtp(String otp);
  void regenerateOtp(BuildContext context);
  void submitOtp(BuildContext context, LoginUserInfoArgument loginUserDetails);
  Sink get inputOtp;
  Sink get inputActiveSubmitOtp;
  Sink get inputRegenerateOtp;
  // Sink get disableCountLeft;
}

abstract class VerificationViewModelOutput {
  Stream<RegenerateOtp> get outputIsRegenerateOtp;
  Stream<bool> get outputActiveSubmitOtp;
}

class RegenerateOtp {
  bool isRegenerateOtpActive;
  int countLeft;

  RegenerateOtp(this.isRegenerateOtpActive, this.countLeft);
}
