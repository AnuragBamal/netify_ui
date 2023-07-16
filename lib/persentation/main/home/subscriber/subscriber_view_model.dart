import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/home_model.dart';
import 'package:netify/domain/usecase/create_subscriber_usecase.dart';
import 'package:netify/domain/usecase/getresellermap_usecase.dart';
import 'package:netify/persentation/base/baseviewmodel.dart';
import 'package:netify/persentation/common/freezed_data_classes.dart';
import 'package:netify/services/dialog_service.dart';
import 'package:netify/services/navigator_service.dart';
import 'package:rxdart/rxdart.dart';

class SubscriberViewModel extends BaseViewModelInputsOutputs {
  static const firstNamePattern = r'^[a-zA-Z\s]{3,}$';
  static const lastNamePattern = r'^[a-zA-Z]{3,}$';

  final _firstNameController = StreamController<String?>.broadcast();
  final _lastNameController = StreamController<String?>.broadcast();
  final _emailController = StreamController<String?>.broadcast();
  final _mobileNumberController = StreamController<String?>.broadcast();
  final _userNameController = StreamController<String?>.broadcast();
  final _passwordController = StreamController<String?>.broadcast();
  final _companyNameController = StreamController<String?>.broadcast();
  final _brandNameController = StreamController<String?>.broadcast();
  final _gstNumberController = StreamController<String?>.broadcast();

  final _addressController = StreamController<String?>.broadcast();
  final _cityController = StreamController<String?>.broadcast();
  final _stateController = StreamController<String?>.broadcast();
  final _countryController = StreamController<String?>.broadcast();
  final _pinCodeController = StreamController<String?>.broadcast();

  final _billingAddressController = StreamController<String?>.broadcast();
  final _billingCityController = StreamController<String?>.broadcast();
  final _billingStateController = StreamController<String?>.broadcast();
  final _billingCountryController = StreamController<String?>.broadcast();
  final _billingPinCodeController = StreamController<String?>.broadcast();

  final _isFormValidController = StreamController<bool>.broadcast();
  final isBillingSameController = BehaviorSubject<bool>.seeded(false);
  final _resellerController = StreamController<List<String>>.broadcast();
  final _operatorController = StreamController<List<String>?>.broadcast();
  final domainNameStreamController = BehaviorSubject<String>.seeded("");

  Map<String, List<String>> resellermap = {};
  final GetResellerMapUseCase _getResellerMapUseCase;
  late ResellerOperatorMap resellerOperatorMap;
  final NavigationService _navigationService;
  final DialogService _dialogService;
  final CreateSubscriberUseCase _subscriberUseCase;

  SubscriberViewModel(this._getResellerMapUseCase, this._navigationService,
      this._dialogService, this._subscriberUseCase);
  var createNewSubscriber = CreateNewSubscriber("", "", "", "", "", "+91", "",
      "", "", "", "", "", "", "", "", "", "", "", "", "", "", "", false);
  @override
  void dispose() {
    _firstNameController.close();
    _lastNameController.close();
    _emailController.close();
    _mobileNumberController.close();
    _userNameController.close();
    _passwordController.close();
    _companyNameController.close();
    _brandNameController.close();
    _gstNumberController.close();
    _addressController.close();
    _cityController.close();
    _stateController.close();
    _countryController.close();
    _pinCodeController.close();
    _billingAddressController.close();
    _billingCityController.close();
    _billingStateController.close();
    _billingCountryController.close();
    _billingPinCodeController.close();
    _isFormValidController.close();
    isBillingSameController.close();
    domainNameStreamController.close();
    _resellerController.close();
    _operatorController.close();
  }

  @override
  void start() {
    _getResellerMap();
  }

  setIsBillingSame(bool flag) {
    isBillingSameController.add(flag);
    createNewSubscriber =
        createNewSubscriber.copyWith(isSameAsPermanentAddress: flag);
    if (flag) {
      createNewSubscriber = createNewSubscriber.copyWith(
          billingAddress: createNewSubscriber.address,
          billingCity: createNewSubscriber.city,
          billingState: createNewSubscriber.state,
          billingCountry: createNewSubscriber.country,
          billingPincode: createNewSubscriber.pincode);
    } else {
      createNewSubscriber = createNewSubscriber.copyWith(
          billingAddress: "",
          billingCity: "",
          billingState: "",
          billingCountry: "",
          billingPincode: "");
    }
    _validateForm();
  }

  setFirstName(String? firstName) {
    if (_validateFirstName(firstName!)) {
      createNewSubscriber = createNewSubscriber.copyWith(firstName: firstName);
    } else {
      createNewSubscriber = createNewSubscriber.copyWith(firstName: "");
    }
    _validateForm();
  }

  setLastName(String? lastName) {
    if (_validateLastName(lastName!)) {
      createNewSubscriber = createNewSubscriber.copyWith(lastName: lastName);
    } else {
      createNewSubscriber = createNewSubscriber.copyWith(lastName: "");
    }
    _validateForm();
  }

  setEmail(String? email) {
    if (_validateEmail(email!)) {
      createNewSubscriber = createNewSubscriber.copyWith(email: email);
    } else {
      createNewSubscriber = createNewSubscriber.copyWith(email: "");
    }
    _validateForm();
  }

  setMobileNumber(String? mobileNumber) {
    if (_validateMobileNumber(mobileNumber!)) {
      createNewSubscriber =
          createNewSubscriber.copyWith(mobileNumber: mobileNumber);
    } else {
      createNewSubscriber = createNewSubscriber.copyWith(mobileNumber: "");
    }
    _validateForm();
  }

  setUserName(String? userName) {
    if (_validateUserName(userName!)) {
      createNewSubscriber = createNewSubscriber.copyWith(
          userName: "$userName@${domainNameStreamController.value}");
    } else {
      createNewSubscriber = createNewSubscriber.copyWith(userName: "");
    }
    _validateForm();
  }

  setPassword(String? password) {
    if (_validatePassword(password!)) {
      createNewSubscriber = createNewSubscriber.copyWith(password: password);
    } else {
      createNewSubscriber = createNewSubscriber.copyWith(password: "");
    }
    _validateForm();
  }

  setCompanyName(String? companyName) {
    if (_validateCompanyName(companyName!)) {
      createNewSubscriber =
          createNewSubscriber.copyWith(companyName: companyName);
    } else {
      createNewSubscriber = createNewSubscriber.copyWith(companyName: "");
    }
    _validateForm();
  }

  setBrandName(String? brandName) {
    if (_validateBrandName(brandName!)) {
      createNewSubscriber = createNewSubscriber.copyWith(brandName: brandName);
    } else {
      createNewSubscriber = createNewSubscriber.copyWith(brandName: "");
    }
    _validateForm();
  }

  setGstNumber(String? gstNumber) {
    if (_validateGstNumber(gstNumber!)) {
      createNewSubscriber = createNewSubscriber.copyWith(gstNumber: gstNumber);
    } else {
      createNewSubscriber = createNewSubscriber.copyWith(gstNumber: "");
    }
    _validateForm();
  }

  setAddress(String? address) {
    if (_validateAddress(address!)) {
      createNewSubscriber = createNewSubscriber.copyWith(address: address);
    } else {
      createNewSubscriber = createNewSubscriber.copyWith(address: "");
    }
    _validateForm();
  }

  setCity(String? city) {
    if (_validateCity(city!)) {
      createNewSubscriber = createNewSubscriber.copyWith(city: city);
    } else {
      createNewSubscriber = createNewSubscriber.copyWith(city: "");
    }
    _validateForm();
  }

  setState(String? state) {
    if (_validateState(state!)) {
      createNewSubscriber = createNewSubscriber.copyWith(state: state);
    } else {
      createNewSubscriber = createNewSubscriber.copyWith(state: "");
    }
    _validateForm();
  }

  setCountry(String? country) {
    if (_validateCountry(country!)) {
      createNewSubscriber = createNewSubscriber.copyWith(country: country);
    } else {
      createNewSubscriber = createNewSubscriber.copyWith(country: "");
    }
    _validateForm();
  }

  setPinCode(String? pinCode) {
    if (_validatePinCode(pinCode!)) {
      createNewSubscriber = createNewSubscriber.copyWith(pincode: pinCode);
    } else {
      createNewSubscriber = createNewSubscriber.copyWith(pincode: "");
    }
    _validateForm();
  }

  setBillingAddress(String? billingAddress) {
    if (_validateBillingAddress(billingAddress!)) {
      createNewSubscriber =
          createNewSubscriber.copyWith(billingAddress: billingAddress);
    } else {
      createNewSubscriber = createNewSubscriber.copyWith(billingAddress: "");
    }
    _validateForm();
  }

  setBillingCity(String? billingCity) {
    if (_validateBillingCity(billingCity!)) {
      createNewSubscriber =
          createNewSubscriber.copyWith(billingCity: billingCity);
    } else {
      createNewSubscriber = createNewSubscriber.copyWith(billingCity: "");
    }
    _validateForm();
  }

  setBillingState(String? billingState) {
    if (_validateBillingState(billingState!)) {
      createNewSubscriber =
          createNewSubscriber.copyWith(billingState: billingState);
    } else {
      createNewSubscriber = createNewSubscriber.copyWith(billingState: "");
    }
    _validateForm();
  }

  setBillingCountry(String? billingCountry) {
    if (_validateBillingCountry(billingCountry!)) {
      createNewSubscriber =
          createNewSubscriber.copyWith(billingCountry: billingCountry);
    } else {
      createNewSubscriber = createNewSubscriber.copyWith(billingCountry: "");
    }
    _validateForm();
  }

  setBillingPinCode(String? billingPinCode) {
    if (_validateBillingPinCode(billingPinCode!)) {
      createNewSubscriber =
          createNewSubscriber.copyWith(billingPincode: billingPinCode);
    } else {
      createNewSubscriber = createNewSubscriber.copyWith(billingPincode: "");
    }
    _validateForm();
  }

  setCountryCode(String countryCode) {
    createNewSubscriber =
        createNewSubscriber.copyWith(countryCode: countryCode);
  }

  setReseller(String reseller) {
    createNewSubscriber =
        createNewSubscriber.copyWith(resellerUserName: reseller);
    createNewSubscriber = createNewSubscriber.copyWith(operatorUserName: "");
    _operatorController.sink.add(resellermap[reseller]!);
    _validateForm();
  }

  setOperator(String operator) {
    createNewSubscriber =
        createNewSubscriber.copyWith(operatorUserName: operator);
    _validateForm();
  }

  createNewSubscriberSubmit(BuildContext context) {
    _submitForm(context);
  }

  Sink get inputFirstName => _firstNameController.sink;
  Sink get inputLastName => _lastNameController.sink;
  Sink get inputEmail => _emailController.sink;
  Sink get inputMobileNumber => _mobileNumberController.sink;
  Sink get inputUserName => _userNameController.sink;
  Sink get inputPassword => _passwordController.sink;
  Sink get inputCompanyName => _companyNameController.sink;
  Sink get inputBrandName => _brandNameController.sink;
  Sink get inputGstNumber => _gstNumberController.sink;
  Sink get inputAddress => _addressController.sink;
  Sink get inputCity => _cityController.sink;
  Sink get inputState => _stateController.sink;
  Sink get inputCountry => _countryController.sink;
  Sink get inputPinCode => _pinCodeController.sink;
  Sink get inputBillingAddress => _billingAddressController.sink;
  Sink get inputBillingCity => _billingCityController.sink;
  Sink get inputBillingState => _billingStateController.sink;
  Sink get inputBillingCountry => _billingCountryController.sink;
  Sink get inputBillingPinCode => _billingPinCodeController.sink;

  Stream<String?> get outputFirstName => _firstNameController.stream;
  Stream<String?> get outputLastName => _lastNameController.stream;
  Stream<String?> get outputEmail => _emailController.stream;
  Stream<String?> get outputMobileNumber => _mobileNumberController.stream;
  Stream<String?> get outputUserName => _userNameController.stream;
  Stream<String?> get outputPassword => _passwordController.stream;
  Stream<String?> get outputCompanyName => _companyNameController.stream;
  Stream<String?> get outputBrandName => _brandNameController.stream;
  Stream<String?> get outputGstNumber => _gstNumberController.stream;
  Stream<String?> get outputAddress => _addressController.stream;
  Stream<String?> get outputCity => _cityController.stream;
  Stream<String?> get outputState => _stateController.stream;
  Stream<String?> get outputCountry => _countryController.stream;
  Stream<String?> get outputPinCode => _pinCodeController.stream;
  Stream<String?> get outputBillingAddress => _billingAddressController.stream;
  Stream<String?> get outputBillingCity => _billingCityController.stream;
  Stream<String?> get outputBillingState => _billingStateController.stream;
  Stream<String?> get outputBillingCountry => _billingCountryController.stream;
  Stream<String?> get outputBillingPinCode => _billingPinCodeController.stream;
  Stream<bool> get isAllInputValid =>
      _isFormValidController.stream.map((event) => event);
  Stream<List<String>> get outputResellerList => _resellerController.stream;
  Stream<List<String>?> get outputOperatorList => _operatorController.stream;

  bool _validateFirstName(String firstName) {
    if (firstName.isEmpty) {
      _firstNameController.add('First Name is required');
      return false;
    } else if (!RegExp(firstNamePattern).hasMatch(firstName)) {
      _firstNameController.add('Enter a valid First Name');
      return false;
    } else {
      _firstNameController.add(null);
      return true;
    }
  }

  bool _validateLastName(String lastName) {
    if (lastName.isEmpty) {
      _lastNameController.add('Last Name is required');
      return false;
    } else if (!RegExp(lastNamePattern).hasMatch(lastName)) {
      _lastNameController.add('Enter a valid Last Name');
      return false;
    } else {
      _lastNameController.add(null);
      return true;
    }
  }

  bool _validateEmail(String email) {
    if (email.isEmpty) {
      _emailController.add('Email is required');
      return false;
    } else if (!RegExp(r'^[a-zA-Z0-9.]+@[a-zA-Z0-9]+\.[a-zA-Z]+')
        .hasMatch(email)) {
      _emailController.add('Enter a valid Email');
      return false;
    } else {
      _emailController.add(null);
      return true;
    }
  }

  bool _validateMobileNumber(String mobileNumber) {
    if (mobileNumber.isEmpty) {
      _mobileNumberController.add('Mobile Number is required');
      return false;
    } else if (!RegExp(r'^[0-9]{10}$').hasMatch(mobileNumber)) {
      _mobileNumberController.add('Enter a valid Mobile Number');
      return false;
    } else {
      _mobileNumberController.add(null);
      return true;
    }
  }

  bool _validateUserName(String userName) {
    if (userName.isEmpty) {
      _userNameController.add('User Name is required');
      return false;
    } else if (!RegExp(r'^[a-zA-Z0-9]{3,}$').hasMatch(userName)) {
      _userNameController.add('Enter a valid User Name');
      return false;
    } else {
      _userNameController.add(null);
      return true;
    }
  }

  bool _validatePassword(String password) {
    if (password.isEmpty) {
      _passwordController.add('Password is required');
      return false;
    } else if (!RegExp(
            r'^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[\W_])[A-Za-z\d\W_]{8,}$')
        .hasMatch(password)) {
      _passwordController.add('Enter a valid Password');
      return false;
    } else {
      _passwordController.add(null);
      return true;
    }
  }

  bool _validateCompanyName(String companyName) {
    if (companyName.isEmpty) {
      _companyNameController.add('Company Name is required');
      return false;
    } else if (!RegExp(r'^[a-zA-Z0-9 ]{3,}$').hasMatch(companyName)) {
      _companyNameController.add('Enter a valid Company Name');
      return false;
    } else {
      _companyNameController.add(null);
      return true;
    }
  }

  bool _validateBrandName(String brandName) {
    if (brandName.isEmpty) {
      _brandNameController.add('Brand Name is required');
      return false;
    } else if (!RegExp(r'^[a-zA-Z0-9 ]{3,}$').hasMatch(brandName)) {
      _brandNameController.add('Enter a valid Brand Name');
      return false;
    } else {
      _brandNameController.add(null);
      return true;
    }
  }

  bool _validateGstNumber(String gstNumber) {
    if (gstNumber.isEmpty) {
      _gstNumberController.add('GST Number is required');
      return false;
    } else if (!RegExp(r'^[a-zA-Z0-9]{15}$').hasMatch(gstNumber)) {
      _gstNumberController.add('Enter a valid GST Number');
      return false;
    } else {
      _gstNumberController.add(null);
      return true;
    }
  }

  bool _validateAddress(String address) {
    if (address.isEmpty) {
      _addressController.add('Address is required');
      return false;
    } else if (!RegExp(r'^[a-zA-Z0-9 ]{3,}$').hasMatch(address)) {
      _addressController.add('Enter a valid Address');
      return false;
    } else {
      _addressController.add(null);
      return true;
    }
  }

  bool _validateCity(String city) {
    if (city.isEmpty) {
      _cityController.add('City is required');
      return false;
    } else if (!RegExp(r'^[a-zA-Z ]{3,}$').hasMatch(city)) {
      _cityController.add('Enter a valid City');
      return false;
    } else {
      _cityController.add(null);
      return true;
    }
  }

  bool _validateState(String state) {
    if (state.isEmpty) {
      _stateController.add('State is required');
      return false;
    } else if (!RegExp(r'^[a-zA-Z ]{3,}$').hasMatch(state)) {
      _stateController.add('Enter a valid State');
      return false;
    } else {
      _stateController.add(null);
      return true;
    }
  }

  bool _validateCountry(String country) {
    if (country.isEmpty) {
      _countryController.add('Country is required');
      return false;
    } else if (!RegExp(r'^[a-zA-Z ]{3,}$').hasMatch(country)) {
      _countryController.add('Enter a valid Country');
      return false;
    } else {
      _countryController.add(null);
      return true;
    }
  }

  bool _validatePinCode(String pinCode) {
    if (pinCode.isEmpty) {
      _pinCodeController.add('Pin Code is required');
      return false;
    } else if (!RegExp(r'^[0-9]{6}$').hasMatch(pinCode)) {
      _pinCodeController.add('Enter a valid Pin Code');
      return false;
    } else {
      _pinCodeController.add(null);
      return true;
    }
  }

  bool _validateBillingAddress(String billingAddress) {
    if (billingAddress.isEmpty) {
      _billingAddressController.add('Billing Address is required');
      return false;
    } else if (!RegExp(r'^[a-zA-Z0-9 ]{3,}$').hasMatch(billingAddress)) {
      _billingAddressController.add('Enter a valid Billing Address');
      return false;
    } else {
      _billingAddressController.add(null);
      return true;
    }
  }

  bool _validateBillingCity(String billingCity) {
    if (billingCity.isEmpty) {
      _billingCityController.add('Billing City is required');
      return false;
    } else if (!RegExp(r'^[a-zA-Z ]{3,}$').hasMatch(billingCity)) {
      _billingCityController.add('Enter a valid Billing City');
      return false;
    } else {
      _billingCityController.add(null);
      return true;
    }
  }

  bool _validateBillingState(String billingState) {
    if (billingState.isEmpty) {
      _billingStateController.add('Billing State is required');
      return false;
    } else if (!RegExp(r'^[a-zA-Z ]{3,}$').hasMatch(billingState)) {
      _billingStateController.add('Enter a valid Billing State');
      return false;
    } else {
      _billingStateController.add(null);
      return true;
    }
  }

  bool _validateBillingCountry(String billingCountry) {
    if (billingCountry.isEmpty) {
      _billingCountryController.add('Billing Country is required');
      return false;
    } else if (!RegExp(r'^[a-zA-Z ]{3,}$').hasMatch(billingCountry)) {
      _billingCountryController.add('Enter a valid Billing Country');
      return false;
    } else {
      _billingCountryController.add(null);
      return true;
    }
  }

  bool _validateBillingPinCode(String billingPinCode) {
    if (billingPinCode.isEmpty) {
      _billingPinCodeController.add('Billing Pin Code is required');
      return false;
    } else if (!RegExp(r'^[0-9]{6}$').hasMatch(billingPinCode)) {
      _billingPinCodeController.add('Enter a valid Billing Pin Code');
      return false;
    } else {
      _billingPinCodeController.add(null);
      return true;
    }
  }

  _validateForm() {
    if (createNewSubscriber.firstName.isNotEmpty &&
        createNewSubscriber.lastName.isNotEmpty &&
        createNewSubscriber.userName.isNotEmpty &&
        createNewSubscriber.password.isNotEmpty &&
        createNewSubscriber.operatorUserName.isNotEmpty &&
        createNewSubscriber.resellerUserName.isNotEmpty &&
        createNewSubscriber.companyName.isNotEmpty &&
        createNewSubscriber.brandName.isNotEmpty &&
        createNewSubscriber.gstNumber.isNotEmpty &&
        createNewSubscriber.address.isNotEmpty &&
        createNewSubscriber.city.isNotEmpty &&
        createNewSubscriber.state.isNotEmpty &&
        createNewSubscriber.country.isNotEmpty &&
        createNewSubscriber.pincode.isNotEmpty &&
        createNewSubscriber.billingAddress.isNotEmpty &&
        createNewSubscriber.billingCity.isNotEmpty &&
        createNewSubscriber.billingState.isNotEmpty &&
        createNewSubscriber.billingCountry.isNotEmpty &&
        createNewSubscriber.billingPincode.isNotEmpty) {
      _isFormValidController.sink.add(true);
    } else {
      _isFormValidController.sink.add(false);
    }
  }

  _getResellerMap() async {
    await _getResellerMapUseCase.execute().then((value) {
      value.fold((failure) {}, (success) {
        _resellerController.sink.add(success.data[0].resellerMap.keys.toList());
        resellermap = success.data[0].resellerMap;
        domainNameStreamController.add(success.data[0].garudaDomain);
      });
    });
  }

  _submitForm(BuildContext context) async {
    _dialogService.showDialogOnScreen(
        context,
        DialogRequest(
            title: "Loading",
            description: "Loading",
            dialogType: DialogType.loading));
    var result = await _subscriberUseCase.execute(CreateSubscriberRequest(
        userName: createNewSubscriber.userName,
        password: createNewSubscriber.password,
        firstName: createNewSubscriber.firstName,
        lastName: createNewSubscriber.lastName,
        email: createNewSubscriber.email,
        operatorUserName: createNewSubscriber.operatorUserName,
        resellerUserName: createNewSubscriber.resellerUserName,
        mobileNumber: createNewSubscriber.mobileNumber,
        streetAddress: createNewSubscriber.address,
        city: createNewSubscriber.city,
        state: createNewSubscriber.state,
        postalCode: createNewSubscriber.pincode,
        country: createNewSubscriber.country,
        isSameAsPermanentAddress: createNewSubscriber.isSameAsPermanentAddress,
        billingStreetAddress: createNewSubscriber.billingAddress,
        billingCity: createNewSubscriber.billingCity,
        billingState: createNewSubscriber.billingState,
        billingCountry: createNewSubscriber.billingCountry,
        billingPostalCode: createNewSubscriber.billingPincode,
        companyName: createNewSubscriber.companyName,
        brandName: createNewSubscriber.brandName,
        gstNumber: createNewSubscriber.gstNumber,
        files: []));
    result.fold((failure) {
      Navigator.of(context).pop();
      _dialogService.showDialogOnScreen(
          context,
          DialogRequest(
              title: "Error",
              description: failure.message,
              dialogType: DialogType.error));
    }, (success) {
      Navigator.of(context).pop();
      var successDialouge = _dialogService.showDialogOnScreen(
          context,
          DialogRequest(
              title: "Success",
              description: success.data[0].message,
              dialogType: DialogType.info));
      successDialouge.then((value) => _navigationService.goBack());
    });
  }
}
