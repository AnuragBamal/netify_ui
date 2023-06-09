import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/usecase/signup_usecase.dart';
import 'package:netify/persentation/base/baseviewmodel.dart';
import 'package:netify/persentation/common/freezed_data_classes.dart';
import 'package:netify/persentation/common/state_rendrer/state_rendrer.dart';
import 'package:netify/persentation/common/state_rendrer/state_rendrer_implementor.dart';

class RegisterViewModel extends BaseViewModel
    implements RegisterViewModelInput, RegisterViewModelOutput {
  static const firstNamePattern = r'^[a-zA-Z\s]{3,}$';
  static const lastNamePattern = r'^[a-zA-Z]{3,}$';
  final List<DropdownMenuItem<String>> tenantTypesList = const [
    DropdownMenuItem(
      value: "ISP",
      child: Text("ISP"),
    ),
    DropdownMenuItem(
      value: "HOTEL",
      child: Text("HOTEL"),
    )
  ];
  static const defaultTenantType = "ISP";
  final StreamController _firstNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _lastNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _emailStreamController =
      StreamController<String>.broadcast();
  final StreamController _mobileNumberStreamController =
      StreamController<String>.broadcast();
  final StreamController _passwordStreamController =
      StreamController<String>.broadcast();
  final StreamController _confirmPasswordStreamController =
      StreamController<String>.broadcast();
  final StreamController _aadharNumberStreamController =
      StreamController<String>.broadcast();
  final StreamController _countryStreamController =
      StreamController<String>.broadcast();
  final StreamController _cityStreamController =
      StreamController<String>.broadcast();
  final StreamController _addressStreamController =
      StreamController<String>.broadcast();
  final StreamController _tenancyTypeStreamController =
      StreamController<String>.broadcast();
  final StreamController _domainStreamController =
      StreamController<String>.broadcast();
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _isAllInputValidStreamController =
      StreamController<void>.broadcast();
  final StreamController isTenantCreatedSuccessfullyStreamController =
      StreamController<bool>();

  final SignUpUseCase _signUpUseCase;
  final CheckDomainAvailiabilityUseCase _checkDomainAvailiabilityUseCase;
  var signUpObject = RegisterObject(
      "", "", "", "", "IN", "", "", "", "", "", "", "", "+91", "");

  RegisterViewModel(this._signUpUseCase, this._checkDomainAvailiabilityUseCase);

  @override
  void dispose() {
    _firstNameStreamController.close();
    _lastNameStreamController.close();
    _emailStreamController.close();
    _mobileNumberStreamController.close();
    _passwordStreamController.close();
    _confirmPasswordStreamController.close();
    _aadharNumberStreamController.close();
    _countryStreamController.close();
    _cityStreamController.close();
    _addressStreamController.close();
    _tenancyTypeStreamController.close();
    _domainStreamController.close();
    _userNameStreamController.close();
    _isAllInputValidStreamController.close();
    isTenantCreatedSuccessfullyStreamController.close();

    super.dispose();
  }

  @override
  void start() {
    inputState.add(ContentState());
  }

  @override
  void submitRegister() async {
    inputState.add(
        LoadingState(stateRendrerType: StateRendrerType.popupLoadingState));
    final result = await _signUpUseCase.execute(SignUpUseCaseInput(
      firstName: signUpObject.firstName,
      lastName: signUpObject.lastName,
      email: signUpObject.email,
      mobileNumber: "${signUpObject.countryCode} ${signUpObject.mobileNumber}",
      password: signUpObject.password,
      aadharNumber: signUpObject.aadharNumber,
      country: signUpObject.country,
      city: signUpObject.city,
      address: signUpObject.address,
      tenancyType: signUpObject.tenancyType,
      garudaDomain: signUpObject.garudaDomain,
      userName: signUpObject.userName,
    ));
    result.fold((failure) => _handleSubmitFailure(failure),
        (data) => _handleSubmitSuccess(data));
  }

  @override
  setAadharNumber(String aadharNumber) {
    inputAadharNumber.add(aadharNumber);
    if (_isAadharNumberValid(aadharNumber)) {
      signUpObject = signUpObject.copyWith(aadharNumber: aadharNumber);
    } else {
      signUpObject = signUpObject.copyWith(aadharNumber: "");
    }
    _validateInputs();
  }

  @override
  setAddress(String address) {
    inputAddress.add(address);
    if (_isAddressValid(address)) {
      signUpObject = signUpObject.copyWith(address: address);
    } else {
      signUpObject = signUpObject.copyWith(address: "");
    }
    _validateInputs();
  }

  @override
  setCity(String city) {
    inputCity.add(city);
    if (_isCityValid(city)) {
      signUpObject = signUpObject.copyWith(city: city);
    } else {
      signUpObject = signUpObject.copyWith(city: "");
    }
    _validateInputs();
  }

  @override
  setDomain(String domain) {
    inputDomain.add(domain);

    _checkDomainAvailiability(domain).then((value) {
      if (value) {
        signUpObject = signUpObject.copyWith(garudaDomain: domain);
        inputDomain.add(domain);
        _validateInputs();
      } else {
        signUpObject = signUpObject.copyWith(garudaDomain: "");
        inputDomain.add(domain);
        _validateInputs();
      }
    });
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    if (_isEmailValid(email)) {
      signUpObject = signUpObject.copyWith(email: email);
    } else {
      signUpObject = signUpObject.copyWith(email: "");
    }
    _validateInputs();
  }

  @override
  setFirstName(String firstName) {
    inputFirstName.add(firstName);
    if (_isFirstNameValid(firstName)) {
      signUpObject = signUpObject.copyWith(firstName: firstName);
    } else {
      signUpObject = signUpObject.copyWith(firstName: "");
    }
    _validateInputs();
  }

  @override
  setLastName(String lastName) {
    inputLastName.add(lastName);
    if (_isLastNameValid(lastName)) {
      signUpObject = signUpObject.copyWith(lastName: lastName);
    } else {
      signUpObject = signUpObject.copyWith(lastName: "");
    }
    _validateInputs();
  }

  @override
  setMobileNumber(String mobileNumber) {
    inputMobileNumber.add(mobileNumber);
    if (_isMobileNumberValid(mobileNumber)) {
      signUpObject = signUpObject.copyWith(mobileNumber: mobileNumber);
    } else {
      signUpObject = signUpObject.copyWith(mobileNumber: "");
    }
    _validateInputs();
  }

  @override
  setConfirmPassword(String confirmPassword) {
    inputConfirmPassword.add(confirmPassword);
    if (_isConfirmPasswordValid(confirmPassword)) {
      signUpObject = signUpObject.copyWith(confirmPassword: confirmPassword);
    } else {
      signUpObject = signUpObject.copyWith(confirmPassword: "");
    }
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    if (_isPasswordValid(password)) {
      signUpObject = signUpObject.copyWith(password: password);
    } else {
      signUpObject = signUpObject.copyWith(password: "");
    }
    _validateInputs();
  }

  @override
  setCountry(String country) {
    inputCountry.add(country);
    if (_isCountryValid(country)) {
      signUpObject = signUpObject.copyWith(country: country);
    } else {
      signUpObject = signUpObject.copyWith(country: "");
    }
    _validateInputs();
  }

  setCountryCode(String countryCode) {
    signUpObject = signUpObject.copyWith(countryCode: countryCode);
  }

  @override
  setTenancyType(String? tenancyType) {
    if (tenancyType == null) {
      signUpObject = signUpObject.copyWith(tenancyType: "");
      return;
    }
    if (_isTenancyTypeValid(tenancyType)) {
      signUpObject = signUpObject.copyWith(tenancyType: tenancyType);
    } else {
      signUpObject = signUpObject.copyWith(tenancyType: "");
    }
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    if (_isUserNameValid(userName)) {
      signUpObject = signUpObject.copyWith(userName: userName);
    } else {
      signUpObject = signUpObject.copyWith(userName: "");
    }
    _validateInputs();
  }

  @override
  Sink get inputAadharNumber => _aadharNumberStreamController.sink;

  @override
  Sink get inputAddress => _addressStreamController.sink;

  @override
  Sink get inputCity => _cityStreamController.sink;

  @override
  Sink get inputConfirmPassword => _confirmPasswordStreamController.sink;

  @override
  Sink get inputCountry => _countryStreamController.sink;

  @override
  Sink get inputDomain => _domainStreamController.sink;

  @override
  Sink get inputEmail => _emailStreamController.sink;

  @override
  Sink get inputFirstName => _firstNameStreamController.sink;

  @override
  Sink get inputLastName => _lastNameStreamController.sink;

  @override
  Sink get inputPassword => _passwordStreamController.sink;

  @override
  Sink get inputMobileNumber => _mobileNumberStreamController.sink;

  @override
  Sink get inputTenancyType => _tenancyTypeStreamController.sink;

  @override
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputAllinputsAreValid => _isAllInputValidStreamController.sink;

  //-----------------Outputs-----------------

  @override
  Stream<bool> get outputIsFirstNameValid => _firstNameStreamController.stream
      .map((firstName) => _isFirstNameValid(firstName));

  @override
  Stream<String?> get outputErrorFirstName => outputIsFirstNameValid.map(
      (isFirstNameValid) => isFirstNameValid ? null : "Invalid First Name");

  @override
  Stream<bool> get outputIsLastNameValid => _lastNameStreamController.stream
      .map((lastName) => _isLastNameValid(lastName));

  @override
  Stream<String?> get outputErrorLastName => outputIsLastNameValid
      .map((isLastNameValid) => isLastNameValid ? null : "Invalid Last Name");

  @override
  Stream<bool> get outputIsAadharNumberValid =>
      _aadharNumberStreamController.stream
          .map((aadharNumber) => _isAadharNumberValid(aadharNumber));

  @override
  Stream<String?> get outputErrorAadharNumber =>
      outputIsAadharNumberValid.map((isAadharNumberValid) =>
          isAadharNumberValid ? null : "Invalid Aadhar Number");

  @override
  Stream<bool> get outputIsAddressValid => _addressStreamController.stream
      .map((address) => _isAddressValid(address));

  @override
  Stream<String?> get outputErrorAddress => outputIsAddressValid
      .map((isAddressValid) => isAddressValid ? null : "Invalid Address");

  @override
  Stream<bool> get outputIsCityValid =>
      _cityStreamController.stream.map((city) => _isCityValid(city));

  @override
  Stream<String?> get outputErrorCity => outputIsCityValid
      .map((isCityValid) => isCityValid ? null : "Invalid City");

  @override
  Stream<bool> get outputIsDomainValid =>
      _domainStreamController.stream.map((_) => _isDomainValid());

  @override
  Stream<String?> get outputErrorDomain => outputIsDomainValid
      .map((isDomainValid) => isDomainValid ? null : "Domain not availiable");

  @override
  Stream<bool> get outputIsEmailValid =>
      _emailStreamController.stream.map((email) => _isEmailValid(email));

  @override
  Stream<String?> get outputErrorEmail => outputIsEmailValid
      .map((isEmailValid) => isEmailValid ? null : "Invalid Email");

  @override
  Stream<bool> get outputIsMobileNumberValid =>
      _mobileNumberStreamController.stream
          .map((mobileNumber) => _isMobileNumberValid(mobileNumber));
  @override
  Stream<String?> get outputErrorMobileNumber =>
      outputIsMobileNumberValid.map((isMobileNumberValid) =>
          isMobileNumberValid ? null : "Invalid Mobile Number");

  @override
  Stream<bool> get outputIsUserNameValid => _userNameStreamController.stream
      .map((userName) => _isUserNameValid(userName));
  @override
  Stream<String?> get outputErrorUserName => outputIsUserNameValid
      .map((isUserNameValid) => isUserNameValid ? null : "Invalid User Name");
  @override
  Stream<bool> get outputIsCountryValid => _countryStreamController.stream
      .map((country) => _isCountryValid(country));

  @override
  Stream<bool> get outputIsConfirmPasswordValid =>
      _confirmPasswordStreamController.stream
          .map((confirmPassword) => _isConfirmPasswordValid(confirmPassword));

  @override
  Stream<String?> get outputErrorConfirmPassword =>
      outputIsConfirmPasswordValid.map((isConfirmPasswordValid) =>
          isConfirmPasswordValid ? null : "Password does not match");

  @override
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<String?> get outputErrorPassword =>
      outputIsPasswordValid.map((isConfirmPasswordValid) =>
          isConfirmPasswordValid ? null : "Invalid Password");

  @override
  Stream<bool> get allInputsValid =>
      _isAllInputValidStreamController.stream.map((_) => _isAllInputValid());

//----------Private Methods----------------

  _isAllInputValid() {
    return signUpObject.firstName.isNotEmpty &&
        signUpObject.lastName.isNotEmpty &&
        signUpObject.email.isNotEmpty &&
        signUpObject.mobileNumber.isNotEmpty &&
        signUpObject.password.isNotEmpty &&
        signUpObject.aadharNumber.isNotEmpty &&
        signUpObject.country.isNotEmpty &&
        signUpObject.city.isNotEmpty &&
        signUpObject.address.isNotEmpty &&
        signUpObject.tenancyType.isNotEmpty &&
        signUpObject.garudaDomain.isNotEmpty &&
        signUpObject.userName.isNotEmpty &&
        signUpObject.confirmPassword.isNotEmpty;
  }

  _validateInputs() {
    inputAllinputsAreValid.add(null);
  }

  _isFirstNameValid(String firstName) {
    final firstNameRegExp = RegExp(firstNamePattern);
    return firstNameRegExp.hasMatch(firstName.trim());
  }

  _isLastNameValid(String lastName) {
    final firstNameRegExp = RegExp(lastNamePattern);
    return firstNameRegExp.hasMatch(lastName.trim());
  }

  _isAadharNumberValid(String aadharNumber) {
    final pattern = RegExp(r'^\d{12}$');
    return pattern.hasMatch(aadharNumber.trim());
  }

  _isAddressValid(String address) {
    return address.length > 3;
  }

  _isCityValid(String city) {
    final pattern = RegExp(r'^[a-zA-Z\s-]+$');
    return pattern.hasMatch(city.trim());
  }

  bool _isDomainValid() {
    return signUpObject.garudaDomain.isNotEmpty &&
        signUpObject.garudaDomain.length > 3;
  }

  Future<bool> _checkDomainAvailiability(String domain) async {
    return (await _checkDomainAvailiabilityUseCase.execute(
            CheckDomainAvailiabilityUseCaseInput(garudaDomain: domain)))
        .fold((l) => false, (r) => true);
  }

  _isEmailValid(String email) {
    final pattern = RegExp(r'^[\w-]+(\.[\w-]+)*@([\w-]+\.)+[a-zA-Z]{2,7}$');
    return pattern.hasMatch(email);
  }

  _isMobileNumberValid(String mobileNumber) {
    // Mobile number pattern (assuming 10-digit numbers with optional country code)
    // final pattern = RegExp(r'^(\+\d{1,3}\s?)?(\d{10})$');
    // return pattern.hasMatch(mobileNumber);
    //final pattern = RegExp(r'^\+\d{1,3}\s?\d{10}$');
    final pattern = RegExp(r'^\d{10}$');
    return pattern.hasMatch(mobileNumber);
  }

  _isUserNameValid(String userName) {
    //only alphabets and numbers are allowed
    final pattern = RegExp(r'^[a-zA-Z0-9]+$');
    return pattern.hasMatch(userName) && userName.length > 2;
  }

  _isPasswordValid(String password) {
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

  _isConfirmPasswordValid(String confirmPassword) {
    return _isPasswordValid(signUpObject.password) &&
        confirmPassword == signUpObject.password;
  }

  _handleSubmitFailure(Failure failure) {
    inputState.add(ErrorState(
        stateRendrerType: StateRendrerType.popupErrorState,
        message: failure.message));
  }

  _handleSubmitSuccess(GeneralSuccess data) {
    inputState.add(SuccessState(
        stateRendrerType: StateRendrerType.popupSuccessState,
        message: data.data[0].message));
    isTenantCreatedSuccessfullyStreamController.add(true);
  }

  bool _isCountryValid(String country) {
    return country.isNotEmpty;
  }

  bool _isTenancyTypeValid(String tenancyType) {
    var tenancyTypeValues =
        tenantTypesList.map((item) => item.value as String).toList();
    if (tenancyTypeValues.contains(tenancyType)) {
      return true;
    } else {
      return false;
    }
  }
}

abstract class RegisterViewModelInput {
  setFirstName(String firstName);
  setLastName(String lastName);
  setEmail(String email);
  setMobileNumber(String mobileNumber);
  setPassword(String password);
  setConfirmPassword(String confirmPassword);
  setAadharNumber(String aadharNumber);
  setCountry(String country);
  setCity(String city);
  setAddress(String address);
  setTenancyType(String tenancyType);
  setDomain(String domain);
  setUserName(String userName);

  void submitRegister();
  Sink get inputFirstName;
  Sink get inputLastName;
  Sink get inputEmail;
  Sink get inputMobileNumber;
  Sink get inputPassword;
  Sink get inputConfirmPassword;
  Sink get inputAadharNumber;
  Sink get inputCountry;
  Sink get inputCity;
  Sink get inputAddress;
  Sink get inputTenancyType;
  Sink get inputDomain;
  Sink get inputUserName;
  Sink get inputAllinputsAreValid;
}

abstract class RegisterViewModelOutput {
  Stream<bool> get outputIsFirstNameValid;
  Stream<String?> get outputErrorFirstName;
  Stream<bool> get outputIsLastNameValid;
  Stream<String?> get outputErrorLastName;
  Stream<bool> get outputIsEmailValid;
  Stream<String?> get outputErrorEmail;
  Stream<bool> get outputIsMobileNumberValid;
  Stream<String?> get outputErrorMobileNumber;
  Stream<bool> get outputIsPasswordValid;
  Stream<String?> get outputErrorPassword;
  Stream<bool> get outputIsConfirmPasswordValid;
  Stream<bool> get outputIsAadharNumberValid;
  Stream<String?> get outputErrorAadharNumber;
  Stream<bool> get outputIsCountryValid;
  Stream<bool> get outputIsCityValid;
  Stream<String?> get outputErrorCity;
  Stream<bool> get outputIsAddressValid;
  Stream<String?> get outputErrorAddress;
  Stream<bool> get outputIsDomainValid;
  Stream<String?> get outputErrorDomain;
  Stream<bool> get outputIsUserNameValid;
  Stream<String?> get outputErrorUserName;
  Stream<bool> get allInputsValid;
  Stream<String?> get outputErrorConfirmPassword;
}
