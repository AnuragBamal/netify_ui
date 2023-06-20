import 'dart:async';

import 'package:netify/data/network/failure.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/persentation/base/baseviewmodel.dart';
import 'package:netify/persentation/common/freezed_data_classes.dart';

class UserViewModel extends BaseViewModelInputsOutputs
    implements UserViewModelInput, UserViewModelOutput {
  static const firstNamePattern = r'^[a-zA-Z\s]{3,}$';
  static const lastNamePattern = r'^[a-zA-Z]{3,}$';

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
  // final StreamController _aadharNumberStreamController =
  //     StreamController<String>.broadcast();
  final StreamController _countryStreamController =
      StreamController<String>.broadcast();
  final StreamController _cityStreamController =
      StreamController<String>.broadcast();
  final StreamController _addressStreamController =
      StreamController<String>.broadcast();
  final StreamController _userNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _companyNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _brandNameStreamController =
      StreamController<String>.broadcast();
  final StreamController _stateAddressStreamController =
      StreamController<String>.broadcast();
  final StreamController _pincodeStreamController =
      StreamController<String>.broadcast();
  final StreamController _gstNumberStreamController =
      StreamController<String>.broadcast();
  final StreamController _isAllInputValidStreamController =
      StreamController<void>.broadcast();
  final StreamController isUserCreatedSuccessfullyStreamController =
      StreamController<bool>();

  var createNewUser = CreateNewUserObject(
      "", "", "", "", "", "+91", "", "", "", "", "", "", "", "", "", "", "");

  UserViewModel();

  @override
  void dispose() {
    _firstNameStreamController.close();
    _lastNameStreamController.close();
    _emailStreamController.close();
    _mobileNumberStreamController.close();
    _passwordStreamController.close();
    //_aadharNumberStreamController.close();
    _countryStreamController.close();
    _cityStreamController.close();
    _addressStreamController.close();

    _userNameStreamController.close();
    _isAllInputValidStreamController.close();
    isUserCreatedSuccessfullyStreamController.close();
    _stateAddressStreamController.close();
    _pincodeStreamController.close();
    _gstNumberStreamController.close();
  }

  @override
  void start() {}

  @override
  void submitRegister() async {
    // inputState.add(
    //     LoadingState(stateRendrerType: StateRendrerType.popupLoadingState));
    // final result = await _signUpUseCase.execute(SignUpUseCaseInput(
    //   firstName: signUpObject.firstName,
    //   lastName: signUpObject.lastName,
    //   email: signUpObject.email,
    //   mobileNumber: "${signUpObject.countryCode} ${signUpObject.mobileNumber}",
    //   password: signUpObject.password,
    //   aadharNumber: signUpObject.aadharNumber,
    //   country: signUpObject.country,
    //   city: signUpObject.city,
    //   address: signUpObject.address,
    //   tenancyType: signUpObject.tenancyType,
    //   garudaDomain: signUpObject.garudaDomain,
    //   userName: signUpObject.userName,
    //   companyName: signUpObject.companyName,
    //   brandName: signUpObject.brandName,
    // ));
    // result.fold((failure) => _handleSubmitFailure(failure),
    //     (data) => _handleSubmitSuccess(data));
  }

  // @override
  // setAadharNumber(String aadharNumber) {
  //   inputAadharNumber.add(aadharNumber);
  //   if (_isAadharNumberValid(aadharNumber)) {
  //     signUpObject = signUpObject.copyWith(aadharNumber: aadharNumber);
  //   } else {
  //     signUpObject = signUpObject.copyWith(aadharNumber: "");
  //   }
  //   _validateInputs();
  // }
  @override
  setOwneruser(String owner) {
    createNewUser = createNewUser.copyWith(owner: owner);
  }

  @override
  setUserType(String userType) {
    createNewUser = createNewUser.copyWith(userType: userType);
  }

  @override
  setGSTNumber(String gstNumber) {
    inputgstNumber.add(gstNumber);
    if (_isGSTNumberValid(gstNumber)) {
      createNewUser = createNewUser.copyWith(gstNumber: gstNumber);
    } else {
      createNewUser = createNewUser.copyWith(gstNumber: "");
    }
  }

  @override
  setPincode(String pincode) {
    inputPincode.add(pincode);
    if (_isPincodeValid(pincode)) {
      createNewUser = createNewUser.copyWith(pincode: pincode);
    } else {
      createNewUser = createNewUser.copyWith(pincode: "");
    }
  }

  @override
  setState(String state) {
    inputAddressState.add(state);
    if (_isAddressStateValid(state)) {
      createNewUser = createNewUser.copyWith(state: state);
    } else {
      createNewUser = createNewUser.copyWith(state: "");
    }
  }

  @override
  setAddress(String address) {
    inputAddress.add(address);
    if (_isAddressValid(address)) {
      createNewUser = createNewUser.copyWith(address: address);
    } else {
      createNewUser = createNewUser.copyWith(address: "");
    }
    _validateInputs();
  }

  @override
  setCity(String city) {
    inputCity.add(city);
    if (_isCityValid(city)) {
      createNewUser = createNewUser.copyWith(city: city);
    } else {
      createNewUser = createNewUser.copyWith(city: "");
    }
    _validateInputs();
  }

  @override
  setEmail(String email) {
    inputEmail.add(email);
    if (_isEmailValid(email)) {
      createNewUser = createNewUser.copyWith(email: email);
    } else {
      createNewUser = createNewUser.copyWith(email: "");
    }
    _validateInputs();
  }

  @override
  setFirstName(String firstName) {
    inputFirstName.add(firstName);
    if (_isFirstNameValid(firstName)) {
      createNewUser = createNewUser.copyWith(firstName: firstName);
    } else {
      createNewUser = createNewUser.copyWith(firstName: "");
    }
    _validateInputs();
  }

  @override
  setLastName(String lastName) {
    inputLastName.add(lastName);
    if (_isLastNameValid(lastName)) {
      createNewUser = createNewUser.copyWith(lastName: lastName);
    } else {
      createNewUser = createNewUser.copyWith(lastName: "");
    }
    _validateInputs();
  }

  @override
  setMobileNumber(String mobileNumber) {
    inputMobileNumber.add(mobileNumber);
    if (_isMobileNumberValid(mobileNumber)) {
      createNewUser = createNewUser.copyWith(mobileNumber: mobileNumber);
    } else {
      createNewUser = createNewUser.copyWith(mobileNumber: "");
    }
    _validateInputs();
  }

  @override
  setPassword(String password) {
    inputPassword.add(password);
    if (_isPasswordValid(password)) {
      createNewUser = createNewUser.copyWith(password: password);
    } else {
      createNewUser = createNewUser.copyWith(password: "");
    }
    _validateInputs();
  }

  @override
  setCountry(String country) {
    inputCountry.add(country);
    if (_isCountryValid(country)) {
      createNewUser = createNewUser.copyWith(country: country);
    } else {
      createNewUser = createNewUser.copyWith(country: "");
    }
    _validateInputs();
  }

  setCountryCode(String countryCode) {
    createNewUser = createNewUser.copyWith(countryCode: countryCode);
  }

  @override
  setUserName(String userName) {
    inputUserName.add(userName);
    if (_isUserNameValid(userName)) {
      createNewUser = createNewUser.copyWith(userName: userName);
    } else {
      createNewUser = createNewUser.copyWith(userName: "");
    }
    _validateInputs();
  }

  @override
  setCompanyName(String companyName) {
    inputCompanyName.add(companyName);
    if (_isCompanyNameValid(companyName)) {
      createNewUser = createNewUser.copyWith(companyName: companyName);
    } else {
      createNewUser = createNewUser.copyWith(companyName: "");
    }
    _validateInputs();
  }

  @override
  setBrandName(String brandName) {
    inputBrandName.add(brandName);
    if (_isBrandNameValid(brandName)) {
      createNewUser = createNewUser.copyWith(brandName: brandName);
    } else {
      createNewUser = createNewUser.copyWith(brandName: "");
    }
    _validateInputs();
  }

  // @override
  // Sink get inputAadharNumber => _aadharNumberStreamController.sink;

  @override
  Sink get inputAddress => _addressStreamController.sink;

  @override
  Sink get inputCity => _cityStreamController.sink;

  @override
  Sink get inputCountry => _countryStreamController.sink;

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
  Sink get inputUserName => _userNameStreamController.sink;

  @override
  Sink get inputCompanyName => _companyNameStreamController.sink;

  @override
  Sink get inputBrandName => _brandNameStreamController.sink;

  @override
  Sink get inputAllinputsAreValid => _isAllInputValidStreamController.sink;

  //-----------------Outputs-----------------
  @override
  Sink get inputAddressState => _stateAddressStreamController.sink;

  @override
  Sink get inputPincode => _pincodeStreamController.sink;

  @override
  Sink get inputgstNumber => _gstNumberStreamController.sink;

  @override
  Stream<String?> get outputErrorAddressState => outputIsAddressStateValid
      .map((isValid) => isValid ? null : "Please select state");

  @override
  Stream<String?> get outputErrorGSTNumber => outputIsGSTNumberValid
      .map((isValid) => isValid ? null : "Please enter valid GST Number");

  @override
  Stream<String?> get outputErrorPincode => outputIsPincodeValid
      .map((isValid) => isValid ? null : "Please enter valid Pincode");

  @override
  Stream<bool> get outputIsAddressStateValid => _addressStreamController.stream
      .map((address) => _isAddressStateValid(address));

  @override
  Stream<bool> get outputIsGSTNumberValid => _gstNumberStreamController.stream
      .map((gstNumber) => _isGSTNumberValid(gstNumber));

  @override
  Stream<bool> get outputIsPincodeValid => _pincodeStreamController.stream
      .map((pincode) => _isPincodeValid(pincode));
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

  // @override
  // Stream<bool> get outputIsAadharNumberValid =>
  //     _aadharNumberStreamController.stream
  //         .map((aadharNumber) => _isAadharNumberValid(aadharNumber));

  // @override
  // Stream<String?> get outputErrorAadharNumber =>
  //     outputIsAadharNumberValid.map((isAadharNumberValid) =>
  //         isAadharNumberValid ? null : "Invalid Aadhar Number");

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
  Stream<bool> get outputIsPasswordValid => _passwordStreamController.stream
      .map((password) => _isPasswordValid(password));

  @override
  Stream<String?> get outputErrorPassword =>
      outputIsPasswordValid.map((isConfirmPasswordValid) =>
          isConfirmPasswordValid ? null : "Invalid Password");

  @override
  Stream<bool> get allInputsValid =>
      _isAllInputValidStreamController.stream.map((_) => _isAllInputValid());

  @override
  Stream<bool> get outputIsCompanyNameValid =>
      _companyNameStreamController.stream
          .map((companyName) => _isCompanyNameValid(companyName));

  @override
  Stream<String?> get outputErrorCompanyName =>
      outputIsCompanyNameValid.map((isCompanyNameValid) =>
          isCompanyNameValid ? null : "Invalid Company Name");

  @override
  Stream<bool> get outputIsBrandNameValid => _brandNameStreamController.stream
      .map((brandName) => _isBrandNameValid(brandName));
  @override
  Stream<String?> get outputErrorBrandName => outputIsBrandNameValid.map(
      (isBrandNameValid) => isBrandNameValid ? null : "Invalid Brand Name");

//----------Private Methods----------------

  _isAllInputValid() {
    return createNewUser.firstName.isNotEmpty &&
        createNewUser.lastName.isNotEmpty &&
        createNewUser.email.isNotEmpty &&
        createNewUser.mobileNumber.isNotEmpty &&
        createNewUser.password.isNotEmpty &&
        // createNewUser.aadharNumber.isNotEmpty &&
        createNewUser.country.isNotEmpty &&
        createNewUser.city.isNotEmpty &&
        createNewUser.address.isNotEmpty &&
        createNewUser.userName.isNotEmpty &&
        createNewUser.companyName.isNotEmpty &&
        createNewUser.brandName.isNotEmpty &&
        createNewUser.gstNumber.isNotEmpty &&
        createNewUser.pincode.isNotEmpty &&
        createNewUser.state.isNotEmpty &&
        createNewUser.owner.isNotEmpty &&
        createNewUser.userType.isNotEmpty;
  }

  _validateInputs() {
    inputAllinputsAreValid.add(null);
  }

  _isGSTNumberValid(String gstNumber) {
    final pattern = RegExp(
        r'^[0-9]{2}[A-Z]{5}[0-9]{4}[A-Z]{1}[0-9]{1}[A-Z]{1}[0-9A-Z]{1}$');
    return pattern.hasMatch(gstNumber.trim());
  }

  _isAddressStateValid(String addressState) {
    final pattern = RegExp(r'^[a-zA-Z\s-]+$');
    return pattern.hasMatch(addressState.trim());
  }

  _isPincodeValid(String pinCode) {
    final pattern = RegExp(r'^[1-9][0-9]{5}$');
    return pattern.hasMatch(pinCode.trim());
  }

  _isFirstNameValid(String firstName) {
    final firstNameRegExp = RegExp(firstNamePattern);
    return firstNameRegExp.hasMatch(firstName.trim());
  }

  _isLastNameValid(String lastName) {
    final firstNameRegExp = RegExp(lastNamePattern);
    return firstNameRegExp.hasMatch(lastName.trim());
  }

  // _isAadharNumberValid(String aadharNumber) {
  //   final pattern = RegExp(r'^\d{12}$');
  //   return pattern.hasMatch(aadharNumber.trim());
  // }

  _isAddressValid(String address) {
    return address.length > 3;
  }

  _isCityValid(String city) {
    final pattern = RegExp(r'^[a-zA-Z\s-]+$');
    return pattern.hasMatch(city.trim());
  }

  // Future<bool> _checkDomainAvailiability(String domain) async {
  //   // return (await _checkDomainAvailiabilityUseCase.execute(
  //   //         CheckDomainAvailiabilityUseCaseInput(garudaDomain: domain)))
  //   //     .fold((l) => false, (r) => true);
  // }

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

  _handleSubmitFailure(Failure failure) {
    //Todo: Handle failure
  }

  _handleSubmitSuccess(GeneralSuccess data) {
    //Todo: Handle success
  }

  bool _isCountryValid(String country) {
    return country.isNotEmpty;
  }

  bool _isCompanyNameValid(String companyName) {
    return companyName.isNotEmpty;
  }

  bool _isBrandNameValid(String brandName) {
    return brandName.isNotEmpty;
  }
}

abstract class UserViewModelInput {
  setOwneruser(String owner);
  setUserType(String userType);
  setFirstName(String firstName);
  setLastName(String lastName);
  setEmail(String email);
  setMobileNumber(String mobileNumber);
  setPassword(String password);
  // setAadharNumber(String aadharNumber);
  setCountry(String country);
  setCity(String city);
  setAddress(String address);
  setUserName(String userName);
  setCompanyName(String companyName);
  setBrandName(String brandName);
  setPincode(String pincode);
  setState(String state);
  setGSTNumber(String gstNumber);

  void submitRegister();
  Sink get inputFirstName;
  Sink get inputLastName;
  Sink get inputEmail;
  Sink get inputMobileNumber;
  Sink get inputPassword;
  // Sink get inputAadharNumber;
  Sink get inputCountry;
  Sink get inputCity;
  Sink get inputAddress;
  Sink get inputUserName;
  Sink get inputAllinputsAreValid;
  Sink get inputCompanyName;
  Sink get inputBrandName;
  Sink get inputPincode;
  Sink get inputgstNumber;
  Sink get inputAddressState;
}

abstract class UserViewModelOutput {
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
  // Stream<String?> get outputErrorAadharNumber;
  Stream<bool> get outputIsCountryValid;
  Stream<bool> get outputIsCityValid;
  Stream<String?> get outputErrorCity;
  Stream<bool> get outputIsAddressValid;
  Stream<String?> get outputErrorAddress;
  Stream<bool> get outputIsUserNameValid;
  Stream<String?> get outputErrorUserName;
  Stream<bool> get allInputsValid;
  Stream<bool> get outputIsCompanyNameValid;
  Stream<String?> get outputErrorCompanyName;
  Stream<bool> get outputIsBrandNameValid;
  Stream<String?> get outputErrorBrandName;
  Stream<bool> get outputIsPincodeValid;
  Stream<String?> get outputErrorPincode;
  Stream<bool> get outputIsGSTNumberValid;
  Stream<String?> get outputErrorGSTNumber;
  Stream<bool> get outputIsAddressStateValid;
  Stream<String?> get outputErrorAddressState;
}
