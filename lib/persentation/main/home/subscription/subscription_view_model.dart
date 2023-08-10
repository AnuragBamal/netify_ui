import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/home_model.dart';
import 'package:netify/domain/model/plan_model.dart';
import 'package:netify/domain/usecase/create_subscription_usecase.dart';
import 'package:netify/domain/usecase/getsubscription_metadata_usecase.dart';
import 'package:netify/persentation/base/baseviewmodel.dart';
import 'package:netify/persentation/common/freezed_data_classes.dart';
import 'package:netify/services/dialog_service.dart';
import 'package:netify/services/navigator_service.dart';
import 'package:rxdart/rxdart.dart';

class SubscriptionViewModel extends BaseViewModelInputsOutputs {
  static const firstNamePattern = r'^[a-zA-Z\s]{3,}$';
  static const lastNamePattern = r'^[a-zA-Z]{3,}$';

  final _userNameController = StreamController<String?>.broadcast();
  final _passwordController = StreamController<String?>.broadcast();

  final _addressController = StreamController<String?>.broadcast();
  final _cityController = StreamController<String?>.broadcast();
  final _stateController = StreamController<String?>.broadcast();
  final _countryController = StreamController<String?>.broadcast();
  final _pinCodeController = StreamController<String?>.broadcast();

  final _isFormValidController = StreamController<bool>.broadcast();
  final isBillingSameController = BehaviorSubject<bool>.seeded(false);
  final _resellerController = StreamController<List<String>>.broadcast();
  final _operatorController = StreamController<List<String>?>.broadcast();
  final _subscriberController =
      StreamController<List<SubscriberMapInfo>?>.broadcast();
  final _planController = BehaviorSubject<List<PlanProfileMetaPlan>?>();

  final _networkTypeController = StreamController<List<String>?>.broadcast();

  final _ipTypeController = StreamController<List<String>?>.broadcast();

  final _availiableIpController = BehaviorSubject<List<String>?>();

  final _isStaticIpController = BehaviorSubject<bool>.seeded(false);

  final StreamController _planBasePriceController =
      StreamController<String?>.broadcast();

  final StreamController _planOfferPriceController =
      StreamController<OfferPrice?>.broadcast();

  late final Map<String, List<String>> resellermap;
  late final Map<String, List<SubscriberMapInfo>> operatorSubscriberMap;
  late final Map<String, List<PlanProfileMetaPlan>> operatorPlanMap;
  late final List<String> networkType;
  late final List<String> ipType;
  late final List<String> availiableIps;
  final GetSubscriptionMetaUsecase _subscriptionMetaUsecase;
  final NavigationService _navigationService;
  final DialogService _dialogService;
  final CreateSubscriptionUseCase _subscriptionUseCase;

  bool isTaxIncluded = false;
  late final double taxRate;

  SubscriptionViewModel(this._subscriptionMetaUsecase, this._navigationService,
      this._dialogService, this._subscriptionUseCase);
  var createNewSubscription = CreateNewSubscription("", "", "", "", "", "", "",
      "", "", false, false, "", "", "", "", "", 0, 0, 0, 0);
  @override
  void dispose() {
    _userNameController.close();
    _passwordController.close();
    _addressController.close();
    _cityController.close();
    _stateController.close();
    _countryController.close();
    _pinCodeController.close();
    _isFormValidController.close();
    isBillingSameController.close();
    _resellerController.close();
    _operatorController.close();
    _subscriberController.close();
    _planController.close();
    _networkTypeController.close();
    _ipTypeController.close();
    _availiableIpController.close();
    _isStaticIpController.close();
    _planOfferPriceController.close();
  }

  @override
  void start() {
    _getSubscriberMetadata();
  }

  setIsAddressSameAsBilling(bool flag) {
    isBillingSameController.add(flag);
    if (flag) {
      createNewSubscription = createNewSubscription.copyWith(
          isInstallationAddressSameAsBilling: flag);
      createNewSubscription = createNewSubscription.copyWith(
          isInstallationAddressSameAsPermanent: false);
    } else {
      createNewSubscription = createNewSubscription.copyWith(
          isInstallationAddressSameAsBilling: flag);
    }

    _validateForm();
  }

  setIsAddressSameAsPermanent(bool flag) {
    isBillingSameController.add(flag);
    if (flag) {
      createNewSubscription = createNewSubscription.copyWith(
          isInstallationAddressSameAsPermanent: flag);
      createNewSubscription = createNewSubscription.copyWith(
          isInstallationAddressSameAsBilling: false);
    } else {
      createNewSubscription = createNewSubscription.copyWith(
          isInstallationAddressSameAsPermanent: flag);
    }

    _validateForm();
  }

  setUserName(String? userName) {
    if (_validateUserName(userName!)) {
      createNewSubscription =
          createNewSubscription.copyWith(userName: userName);
    } else {
      createNewSubscription = createNewSubscription.copyWith(userName: "");
    }
    _validateForm();
  }

  setPassword(String? password) {
    if (_validatePassword(password!)) {
      createNewSubscription =
          createNewSubscription.copyWith(password: password);
    } else {
      createNewSubscription = createNewSubscription.copyWith(password: "");
    }
    _validateForm();
  }

  setAddress(String? address) {
    if (_validateAddress(address!)) {
      createNewSubscription = createNewSubscription.copyWith(address: address);
    } else {
      createNewSubscription = createNewSubscription.copyWith(address: "");
    }
    _validateForm();
  }

  setCity(String? city) {
    if (_validateCity(city!)) {
      createNewSubscription = createNewSubscription.copyWith(city: city);
    } else {
      createNewSubscription = createNewSubscription.copyWith(city: "");
    }
    _validateForm();
  }

  setState(String? state) {
    if (_validateState(state!)) {
      createNewSubscription = createNewSubscription.copyWith(state: state);
    } else {
      createNewSubscription = createNewSubscription.copyWith(state: "");
    }
    _validateForm();
  }

  setCountry(String? country) {
    if (_validateCountry(country!)) {
      createNewSubscription = createNewSubscription.copyWith(country: country);
    } else {
      createNewSubscription = createNewSubscription.copyWith(country: "");
    }
    _validateForm();
  }

  setPinCode(String? pinCode) {
    if (_validatePinCode(pinCode!)) {
      createNewSubscription = createNewSubscription.copyWith(pincode: pinCode);
    } else {
      createNewSubscription = createNewSubscription.copyWith(pincode: "");
    }
    _validateForm();
  }

  setReseller(String reseller) {
    createNewSubscription =
        createNewSubscription.copyWith(resellerUserName: reseller);
    createNewSubscription =
        createNewSubscription.copyWith(operatorUserName: "");
    createNewSubscription = createNewSubscription.copyWith(subscriberId: "");
    createNewSubscription = createNewSubscription.copyWith(planName: "");
    _subscriberController.sink.add(null);
    _planController.sink.add(null);
    _operatorController.sink.add(resellermap[reseller]!);
    _validateForm();
  }

  setOperator(String operator) {
    createNewSubscription =
        createNewSubscription.copyWith(operatorUserName: operator);
    createNewSubscription = createNewSubscription.copyWith(subscriberId: "");
    createNewSubscription = createNewSubscription.copyWith(planName: "");
    _subscriberController.sink.add(operatorSubscriberMap[operator]!);
    _planController.sink.add(operatorPlanMap[operator]!);
    _validateForm();
  }

  setSubscriber(String subscriber) {
    createNewSubscription =
        createNewSubscription.copyWith(subscriberId: subscriber);
    _validateForm();
  }

  setPlanName(String planName) {
    createNewSubscription = createNewSubscription.copyWith(planName: planName);
    _validateForm();
  }

  setNetworkType(String networkType) {
    createNewSubscription =
        createNewSubscription.copyWith(networkType: networkType);
    _validateForm();
  }

  setIpType(String ipType) {
    createNewSubscription = createNewSubscription.copyWith(ipType: ipType);
    if (ipType.toLowerCase() == "static") {
      _isStaticIpController.add(true);
    } else {
      _isStaticIpController.add(false);
    }
    _validateForm();
  }

  setStaticIp(String staticIp) {
    createNewSubscription =
        createNewSubscription.copyWith(assignedIp: staticIp);
    _validateForm();
  }

  setPlanEnteredPrice(String value) {
    double price = double.tryParse(value) ?? 0;
    if (_validateBasePrice(price)) {
      createNewSubscription =
          createNewSubscription.copyWith(planEnteredCost: price);
      calculateOfferPrice();
    } else {
      createNewSubscription =
          createNewSubscription.copyWith(planEnteredCost: 0);
      inputPlanOfferPrice.add(null);
    }
    _validateForm();
  }

  setPlanOfferPrice(double value) {
    createNewSubscription =
        createNewSubscription.copyWith(planOfferedCost: value);
    _validateForm();
  }

  setPlanBasePriceCost(double value) {
    createNewSubscription =
        createNewSubscription.copyWith(planBasicCost: value);
    _validateForm();
  }

  setTaxAmount(double value) {
    createNewSubscription = createNewSubscription.copyWith(taxAmount: value);
    _validateForm();
  }

  setIsTaxIncluded(bool value) {
    isTaxIncluded = value;
    calculateOfferPrice();
  }

  createNewSubscriptionSubmit(BuildContext context) {
    _submitForm(context);
  }

  Sink get inputUserName => _userNameController.sink;
  Sink get inputPassword => _passwordController.sink;

  Sink get inputAddress => _addressController.sink;
  Sink get inputCity => _cityController.sink;
  Sink get inputState => _stateController.sink;
  Sink get inputCountry => _countryController.sink;
  Sink get inputPinCode => _pinCodeController.sink;
  Sink get inputPlanBasePrice => _planBasePriceController.sink;

  Sink get inputPlanOfferPrice => _planOfferPriceController.sink;

  Stream<String?> get outputUserName => _userNameController.stream;
  Stream<String?> get outputPassword => _passwordController.stream;

  Stream<String?> get outputAddress => _addressController.stream;
  Stream<String?> get outputCity => _cityController.stream;
  Stream<String?> get outputState => _stateController.stream;
  Stream<String?> get outputCountry => _countryController.stream;
  Stream<String?> get outputPinCode => _pinCodeController.stream;

  Stream<bool> get isAllInputValid =>
      _isFormValidController.stream.map((event) => event);
  Stream<List<String>> get outputResellerList => _resellerController.stream;
  Stream<List<String>?> get outputOperatorList => _operatorController.stream;
  Stream<List<PlanProfileMetaPlan>?> get outputPlanList =>
      _planController.stream;
  Stream<List<SubscriberMapInfo>?> get outputSubscriberList =>
      _subscriberController.stream;

  Stream<List<String>?> get outputNetworkTypeList =>
      _networkTypeController.stream;
  Stream<List<String>?> get outputIpTypeList => _ipTypeController.stream;
  Stream<List<String>?> get outputStaticIpList =>
      _availiableIpController.stream;
  Stream<bool> get outputIsStaticIpSelected => _isStaticIpController.stream;

  Stream<String?> get outputPlanBasePrice =>
      _planBasePriceController.stream.map((event) => event);
  Stream<OfferPrice?> get outputPlanOfferPrice =>
      _planOfferPriceController.stream.map((event) => event);
  // Stream<List<String>> get outputBillingCycle => _billingCycleController.stream;
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

  _validateBasePrice(double? value) {
    if (value == null || value <= 0) {
      inputPlanBasePrice.add("Please enter plan base price.");
      return false;
    }
    inputPlanBasePrice.add(null);
    return true;
  }

  bool _validatePassword(String password) {
    if (password.isEmpty) {
      _passwordController.add('Password is required');
      return false;
    } else if (!RegExp(r'^[a-zA-Z0-9]{3,}$').hasMatch(password)) {
      _passwordController.add('Enter a valid Password');
      return false;
    } else {
      _passwordController.add(null);
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

  calculateOfferPrice() {
    if (createNewSubscription.planEnteredCost > 0 ||
        createNewSubscription.planEnteredCost > 0) {
      if (createNewSubscription.planEnteredCost > 0) {
        if (isTaxIncluded) {
          var finalAmount = createNewSubscription.planEnteredCost;
          var basePrice = finalAmount / (1 + (taxRate / 100));
          var taxAmount = finalAmount - basePrice;
          inputPlanOfferPrice.add(OfferPrice(
              offerPrice: finalAmount,
              taxAmount: taxAmount,
              basePrice: basePrice,
              taxPercentage: taxRate));
          setPlanOfferPrice(finalAmount);
          setPlanBasePriceCost(basePrice);
          setTaxAmount(taxAmount);
        } else {
          var finalAmount = createNewSubscription.planEnteredCost +
              (createNewSubscription.planEnteredCost * (taxRate / 100));
          var basePrice = createNewSubscription.planEnteredCost;
          var taxAmount = finalAmount - basePrice;
          inputPlanOfferPrice.add(OfferPrice(
              offerPrice: finalAmount,
              taxAmount: taxAmount,
              basePrice: basePrice,
              taxPercentage: taxRate));
          setPlanOfferPrice(finalAmount);
          setPlanBasePriceCost(basePrice);
          setTaxAmount(taxAmount);
        }
      } else {
        if (isTaxIncluded) {
          var finalAmount = createNewSubscription.planEnteredCost;
          var basePrice = finalAmount / (1 + (taxRate / 100));
          var taxAmount = finalAmount - basePrice;
          inputPlanOfferPrice.add(OfferPrice(
              offerPrice: finalAmount,
              taxAmount: taxAmount,
              basePrice: basePrice,
              taxPercentage: taxRate));
          setPlanOfferPrice(finalAmount);
          setPlanBasePriceCost(basePrice);
          setTaxAmount(taxAmount);
        } else {
          var finalAmount = createNewSubscription.planEnteredCost +
              (createNewSubscription.planEnteredCost * (taxRate / 100));
          var basePrice = createNewSubscription.planEnteredCost;
          var taxAmount = finalAmount - basePrice;
          inputPlanOfferPrice.add(OfferPrice(
              offerPrice: finalAmount,
              taxAmount: taxAmount,
              basePrice: basePrice,
              taxPercentage: taxRate));
          setPlanOfferPrice(finalAmount);
          setPlanBasePriceCost(basePrice);
          setTaxAmount(taxAmount);
        }
      }
    } else {
      inputPlanOfferPrice.add(null);
    }
  }

  _validateForm() {
    if (createNewSubscription.userName.isNotEmpty &&
        createNewSubscription.password.isNotEmpty &&
        ((createNewSubscription.address.isNotEmpty &&
                createNewSubscription.city.isNotEmpty &&
                createNewSubscription.state.isNotEmpty &&
                createNewSubscription.country.isNotEmpty &&
                createNewSubscription.pincode.isNotEmpty) ||
            createNewSubscription.isInstallationAddressSameAsBilling ||
            createNewSubscription.isInstallationAddressSameAsPermanent) &&
        createNewSubscription.resellerUserName.isNotEmpty &&
        createNewSubscription.subscriberId.isNotEmpty &&
        createNewSubscription.operatorUserName.isNotEmpty &&
        createNewSubscription.planName.isNotEmpty &&
        createNewSubscription.networkType.isNotEmpty &&
        createNewSubscription.ipType.isNotEmpty &&
        createNewSubscription.planBasicCost > 0 &&
        createNewSubscription.planOfferedCost > 0 &&
        createNewSubscription.taxAmount > 0 &&
        ((createNewSubscription.ipType.toLowerCase() == 'static' &&
                createNewSubscription.assignedIp.isNotEmpty) ||
            createNewSubscription.ipType.toLowerCase() != 'static')) {
      _isFormValidController.sink.add(true);
    } else {
      _isFormValidController.sink.add(false);
    }
  }

  _getSubscriberMetadata() async {
    var result = await _subscriptionMetaUsecase.execute();
    result.fold((failure) {}, (success) {
      _resellerController.sink
          .add(success.data[0].resellerOperatorMap.keys.toList());
      _networkTypeController.sink.add(success.data[0].networkType);
      _ipTypeController.sink.add(success.data[0].ipType);
      _availiableIpController.sink.add(success.data[0].availiableIps);
      resellermap = success.data[0].resellerOperatorMap;
      operatorPlanMap = success.data[0].operatorPlanMap;
      operatorSubscriberMap = success.data[0].operatorSubscriberMap;
      networkType = success.data[0].networkType;
      ipType = success.data[0].ipType;
      availiableIps = success.data[0].availiableIps;
      taxRate = success.data[0].taxRate;
    });
  }

  _submitForm(BuildContext context) async {
    _dialogService.showDialogOnScreen(
        context,
        DialogRequest(
            title: "Loading",
            description: "Loading",
            dialogType: DialogType.loading));
    var result = await _subscriptionUseCase.execute(CreateSubscriptionRequest(
      userName: createNewSubscription.userName,
      password: createNewSubscription.password,
      installationStreetAddress: createNewSubscription.address,
      installationCity: createNewSubscription.city,
      installationState: createNewSubscription.state,
      installationCountry: createNewSubscription.country,
      installationPostalCode: createNewSubscription.pincode,
      installationAddressSameAsBilling:
          createNewSubscription.isInstallationAddressSameAsBilling,
      installationAddressSameAsPermanent:
          createNewSubscription.isInstallationAddressSameAsPermanent,
      resellerUserName: createNewSubscription.resellerUserName,
      customerId: createNewSubscription.subscriberId,
      operatorUserName: createNewSubscription.operatorUserName,
      planId: createNewSubscription.planName,
      networkType: createNewSubscription.networkType,
      ipType: createNewSubscription.ipType,
      assignedIp: createNewSubscription.assignedIp,
      basePrice: createNewSubscription.planBasicCost,
      offeredPrice: createNewSubscription.planOfferedCost,
      taxAmount: createNewSubscription.taxAmount,
    ));
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

class OfferPrice {
  double offerPrice;
  double taxAmount;
  double basePrice;
  double taxPercentage;

  OfferPrice(
      {required this.offerPrice,
      required this.taxAmount,
      required this.basePrice,
      required this.taxPercentage});
}
