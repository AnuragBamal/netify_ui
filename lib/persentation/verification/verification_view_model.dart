import 'dart:async';

import 'package:netify/data/network/failure.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/usecase/otp_usecase.dart';
import 'package:netify/persentation/base/baseviewmodel.dart';
import 'package:netify/persentation/common/freezed_data_classes.dart';
import 'package:netify/persentation/common/state_rendrer/state_rendrer.dart';
import 'package:netify/persentation/common/state_rendrer/state_rendrer_implementor.dart';
import 'package:rxdart/rxdart.dart';

const defaultCount = 60;

class VerificationViewModel
    implements VerificationViewModelInput, VerificationViewModelOutput {
  int _currentCounter = defaultCount;
  Timer? _timer;

  final StreamController _inputOtpStreamController =
      StreamController<String>.broadcast();
  final StreamController _inputRegenerateOtpStreamController =
      StreamController<RegenerateOtp>.broadcast();
  final StreamController _inputActiveSubmitOtpStreamController =
      StreamController<void>.broadcast();
  final isVerificationSuccessfullStreamController = BehaviorSubject<bool?>();

  var verifyOtpObject = VerifyOtpObject("");

  final VerifyOtpUseCase _verifyOtpUseCase;
  final GetOtpUseCase _regenerateOtpUseCase;

  VerificationViewModel(this._verifyOtpUseCase, this._regenerateOtpUseCase);

  void dispose() {
    _inputOtpStreamController.close();
    _inputRegenerateOtpStreamController.close();
    _inputActiveSubmitOtpStreamController.close();
    isVerificationSuccessfullStreamController.close();

    // super.dispose();
  }

  void start() {
    //inputState.add(ContentState());
  }

  @override
  setOtp(String otp) {
    inputOtp.add(otp);
    verifyOtpObject = verifyOtpObject.copyWith(otp: otp);
    _validate();
  }

  @override
  void submitOtp() async {
    // inputState.add(
    //     LoadingState(stateRendrerType: StateRendrerType.popupLoadingState));
    (await _verifyOtpUseCase
            .execute(VerifyOtpUseCaseInput(otp: verifyOtpObject.otp)))
        .fold((failure) => _handleFailureVerifyOtp(failure),
            (data) => _handleSuccessVerifyOtp(data));
  }

  @override
  void regenerateOtp() async {
    // inputState.add(
    //     LoadingState(stateRendrerType: StateRendrerType.popupLoadingState));
    (await _regenerateOtpUseCase.execute()).fold(
        (failure) => _handleFailureRegenerateOtp(failure),
        (data) => _handleSuccessRegenerateOtp(data));

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

  _handleFailureVerifyOtp(Failure failure) {
    // inputState.add(ErrorState(
    //     stateRendrerType: StateRendrerType.popupErrorState,
    //     message: failure.message));
    isVerificationSuccessfullStreamController.add(false);
  }

  _handleSuccessVerifyOtp(GeneralSuccess data) {
    //isVerificationSuccessfull = true;
    // inputState.add(ContentState());
    isVerificationSuccessfullStreamController.add(true);
  }

  _handleFailureRegenerateOtp(Failure failure) {
    // inputState.add(ErrorState(
    //     stateRendrerType: StateRendrerType.popupErrorState,
    //     message: failure.message));
    _disableRegenerateButton();
  }

  _handleSuccessRegenerateOtp(GeneralSuccess data) {
    // inputState.add(SuccessState(
    //     stateRendrerType: StateRendrerType.popupSuccessState,
    //     message: data.data[0].message));
    _disableRegenerateButton();
  }
}

abstract class VerificationViewModelInput {
  // 3 Actions user can perform
  setOtp(String otp);
  void regenerateOtp();
  void submitOtp();
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
