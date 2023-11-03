import 'dart:async';
import 'package:flutter/material.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/enum_model.dart';
import 'package:netify/domain/model/plan_model.dart';
import 'package:netify/domain/usecase/create_plan_usecase.dart';
import 'package:netify/domain/usecase/getplanprofile_usecase.dart';
import 'package:netify/persentation/base/baseviewmodel.dart';
import 'package:netify/persentation/common/freezed_data_classes.dart';
import 'package:netify/services/dialog_service.dart';
import 'package:netify/services/navigator_service.dart';
import 'package:rxdart/rxdart.dart';

class CreatePlanViewModel extends BaseViewModelInputsOutputs {
  final StreamController _planNameController =
      StreamController<String?>.broadcast();
  final StreamController _planDescriptionController =
      StreamController<String?>.broadcast();
  final StreamController _planTypeController =
      StreamController<String?>.broadcast();
  final StreamController _planValidityController =
      StreamController<String?>.broadcast();

  final StreamController _planBasePriceController =
      StreamController<String?>.broadcast();

  final StreamController _planOfferPriceController =
      StreamController<OfferPrice?>.broadcast();

  final StreamController _planUploadSpeedController =
      StreamController<String?>.broadcast();

  final StreamController _planDownloadSpeedController =
      StreamController<String?>.broadcast();

  final StreamController _planDataLimitController =
      StreamController<String?>.broadcast();

  final StreamController _planFUPUploadSpeedController =
      StreamController<String?>.broadcast();

  final StreamController _planFUPDownloadSpeedController =
      StreamController<String?>.broadcast();

  final StreamController _planFUPDataLimitController =
      StreamController<String?>.broadcast();

  final _isIntiallizedController = BehaviorSubject<bool>.seeded(false);

  final StreamController _formValidController =
      StreamController<bool>.broadcast();

  late final List<String> planSpeedUnit;
  late final List<String> planDataLimitUnit;
  late final List<String> planValidityUnit;
  late final List<String> planType;
  late final double taxRate;
  bool isTaxIncluded = false;

  final GetPlanProfileUseCase _getPlanProfileUseCase;
  final DialogService _dialogService;
  final NavigationService _navigationService;
  final CreatePlanUseCase _createPlanUseCase;

  var createNewPlan = CreatePlan("", "", "", 0.0, 0.0, 0.0, 0.0, 0, "", 0, "",
      0, "", 0, "", 0, 0, "", "", 0, "", 0, 0, 1, 0);

  CreatePlanViewModel(
    this._getPlanProfileUseCase,
    this._dialogService,
    this._navigationService,
    this._createPlanUseCase,
  );

  @override
  void dispose() {
    _planNameController.close();
    _planDescriptionController.close();
    _planTypeController.close();
    _planValidityController.close();
    _planBasePriceController.close();
    _planOfferPriceController.close();
    _isIntiallizedController.close();
    _formValidController.close();
  }

  @override
  void start() {
    _getPlansMetaData();
  }

  setPlanName(String value) {
    _planNameController.sink.add(value);
    if (_validatePlanName(value)) {
      createNewPlan = createNewPlan.copyWith(planName: value);
    }
    _validateCreatePlan();
  }

  setPlanDescription(String value) {
    _planDescriptionController.sink.add(value);
    if (_validatePlanDescription(value)) {
      createNewPlan = createNewPlan.copyWith(planDescription: value);
    }
    _validateCreatePlan();
  }

  setPlanEnteredPrice(String value) {
    double price = double.tryParse(value) ?? 0;
    if (_validateBasePrice(price)) {
      createNewPlan = createNewPlan.copyWith(planEnteredCost: price);
      calculateOfferPrice();
    } else {
      createNewPlan = createNewPlan.copyWith(planEnteredCost: 0);
      inputPlanOfferPrice.add(null);
    }
    _validateCreatePlan();
  }

  setPlanOfferPrice(double value) {
    createNewPlan = createNewPlan.copyWith(planOfferedCost: value);
    _validateCreatePlan();
  }

  setPlanBasePriceCost(double value) {
    createNewPlan = createNewPlan.copyWith(planBasicCost: value);
    _validateCreatePlan();
  }

  setTaxAmount(double value) {
    createNewPlan = createNewPlan.copyWith(taxAmount: value);
    _validateCreatePlan();
  }

  setIsTaxIncluded(bool value) {
    isTaxIncluded = value;
    calculateOfferPrice();
  }

  setPlanDownloadSpeed(String downloadSpeed) {
    int value = int.tryParse(downloadSpeed) ?? 0;
    if (value > 0) {
      _planDownloadSpeedController.sink.add(null);
      createNewPlan = createNewPlan.copyWith(downloadSpeed: value);
    } else {
      _planDownloadSpeedController.sink.add("Enter Valid Speed.");
      createNewPlan = createNewPlan.copyWith(downloadSpeed: 0);
    }
    _validateCreatePlan();
  }

  setPlanUploadSpeed(String uploadSpeed) {
    int value = int.tryParse(uploadSpeed) ?? 0;
    if (value > 0) {
      _planUploadSpeedController.sink.add(null);
      createNewPlan = createNewPlan.copyWith(uploadSpeed: value);
    } else {
      _planUploadSpeedController.sink.add("Enter Valid Speed.");
      createNewPlan = createNewPlan.copyWith(uploadSpeed: 0);
    }
    _validateCreatePlan();
  }

  setPlanDownloadSpeedUnit(String value) {
    createNewPlan = createNewPlan.copyWith(downloadSpeedUnit: value);
    _validateCreatePlan();
  }

  setPlanUploadSpeedUnit(String value) {
    createNewPlan = createNewPlan.copyWith(uploadSpeedUnit: value);
    _validateCreatePlan();
  }

  setPlanValidity(String value) {
    int validity = int.tryParse(value) ?? 0;
    if (_verifyPlanValidity(validity)) {
      createNewPlan = createNewPlan.copyWith(planValidity: validity);
    }
    _validateCreatePlan();
  }

  setPlanValidityUnit(String value) {
    createNewPlan = createNewPlan.copyWith(planValidityUnit: value);
    _validateCreatePlan();
  }

  setPlanType(String value) {
    createNewPlan = createNewPlan.copyWith(planType: value);
    inputPlanType.add(value);
    _validateCreatePlan();
  }

  setPlanDataLimit(String dataLimit) {
    int value = int.tryParse(dataLimit) ?? 0;
    if (value > 0) {
      _planDataLimitController.sink.add(null);
      createNewPlan = createNewPlan.copyWith(dataLimit: value);
    } else {
      _planDataLimitController.sink.add("Enter Valid Data Limit");
      createNewPlan = createNewPlan.copyWith(dataLimit: 0);
    }
    _validateCreatePlan();
  }

  setPlanDataLimitUnit(String value) {
    createNewPlan = createNewPlan.copyWith(dataLimitUnit: value);
    _validateCreatePlan();
  }

  setPlanFUPDownloadSpeed(String downloadSpeed) {
    int value = int.tryParse(downloadSpeed) ?? 0;
    if (value > 0) {
      _planFUPDownloadSpeedController.sink.add(null);
      createNewPlan = createNewPlan.copyWith(downloadSpeedFUP: value);
    } else {
      _planFUPDownloadSpeedController.sink.add("Enter Valid Download Speed");
      createNewPlan = createNewPlan.copyWith(downloadSpeedFUP: 0);
    }
    _validateCreatePlan();
  }

  setPlanFUPUploadSpeed(String uploadSpeed) {
    int value = int.tryParse(uploadSpeed) ?? 0;
    if (value > 0) {
      _planFUPUploadSpeedController.sink.add(null);
      createNewPlan = createNewPlan.copyWith(uploadSpeedFUP: value);
    } else {
      _planFUPUploadSpeedController.sink.add("Enter Valid Upload Speed");
      createNewPlan = createNewPlan.copyWith(uploadSpeedFUP: 0);
    }
    _validateCreatePlan();
  }

  setPlanFUPDownloadSpeedUnit(String value) {
    createNewPlan = createNewPlan.copyWith(downloadSpeedFUPUnit: value);
    _validateCreatePlan();
  }

  setPlanFUPUploadSpeedUnit(String value) {
    createNewPlan = createNewPlan.copyWith(uploadSpeedFUPUnit: value);
    _validateCreatePlan();
  }

  setPlanFUPDataLimit(String dataLimit) {
    int value = int.tryParse(dataLimit) ?? 0;
    if (value > 0) {
      _planFUPDataLimitController.sink.add(null);
      createNewPlan = createNewPlan.copyWith(dataLimitFUP: value);
    } else {
      _planFUPDataLimitController.sink.add("Enter Valid Data Limit");
      createNewPlan = createNewPlan.copyWith(dataLimitFUP: 0);
    }
    _validateCreatePlan();
  }

  setPlanFUPDataLimitUnit(String value) {
    createNewPlan = createNewPlan.copyWith(dataLimitFUPUnit: value);
    _validateCreatePlan();
  }

  setmaxSessionTimeInHours(String maxSessionString) {
    double value = double.tryParse(maxSessionString) ?? 0;
    if (value > 0) {
      createNewPlan =
          createNewPlan.copyWith(maxSessionTimeInsec: (value * 3600).toInt());
    }
    _validateCreatePlan();
  }

  setMaxDataTransferInGB(String maxDataTransferString) {
    double value = double.tryParse(maxDataTransferString) ?? 0;
    if (value > 0) {
      createNewPlan =
          createNewPlan.copyWith(maxDataTransferInSession: (value).toInt());
    }
    _validateCreatePlan();
  }

  setMaxConcurrentSession(String maxConcurrentSessionString) {
    int value = int.tryParse(maxConcurrentSessionString) ?? 0;
    if (value > 0) {
      createNewPlan =
          createNewPlan.copyWith(maxSimultaneousUser: (value).toInt());
    }
    _validateCreatePlan();
  }

  setGracePeriodInDays(String gracePeriodString) {
    int value = int.tryParse(gracePeriodString) ?? 0;
    if (value > 0) {
      createNewPlan = createNewPlan.copyWith(gracePeriodInDays: value);
    }
    _validateCreatePlan();
  }

  createNewPlanSubmit(BuildContext context) {
    _createPlan(context);
  }

  Sink get inputPlanName => _planNameController.sink;
  Sink get inputPlanDescription => _planDescriptionController.sink;
  Sink get inputPlanType => _planTypeController.sink;
  Sink get inputIsIntiallized => _isIntiallizedController.sink;
  Sink get inputIsFormValid => _formValidController.sink;
  Sink get inputPlanValidity => _planValidityController.sink;
  Sink get inputPlanBasePrice => _planBasePriceController.sink;
  Sink get inputPlanOfferPrice => _planOfferPriceController.sink;

  Stream<String?> get outputPlanName =>
      _planNameController.stream.map((event) => event);
  Stream<String?> get outputPlanDescription =>
      _planDescriptionController.stream.map((event) => event);
  Stream<String?> get outputPlanType =>
      _planTypeController.stream.map((event) => event);
  Stream<bool> get outputIsIntiallized => _isIntiallizedController.stream;
  Stream<bool> get outputIsFormValid =>
      _formValidController.stream.map((event) => event);
  Stream<String?> get outputPlanValidity =>
      _planValidityController.stream.map((event) => event);
  Stream<String?> get outputPlanBasePrice =>
      _planBasePriceController.stream.map((event) => event);
  Stream<OfferPrice?> get outputPlanOfferPrice =>
      _planOfferPriceController.stream.map((event) => event);
  Stream<String?> get outputPlanDataLimit =>
      _planDataLimitController.stream.map((event) => event);
  Stream<String?> get outputPlanUploadSpeed =>
      _planUploadSpeedController.stream.map((event) => event);
  Stream<String?> get outputPlanDownloadSpeed =>
      _planDownloadSpeedController.stream.map((event) => event);
  Stream<String?> get outputPlanFUPDownloadSpeed =>
      _planFUPDownloadSpeedController.stream.map((event) => event);
  Stream<String?> get outputPlanFUPUploadSpeed =>
      _planFUPUploadSpeedController.stream.map((event) => event);
  Stream<String?> get outputPlanFUPDataLimit =>
      _planFUPDataLimitController.stream.map((event) => event);

  _validatePlanName(String? value) {
    if (value == null || value.isEmpty) {
      inputPlanName.add("Please enter plan name.");
      return false;
    }
    inputPlanName.add(null);
    return true;
  }

  _validateBasePrice(double? value) {
    if (value == null || value <= 0) {
      inputPlanBasePrice.add("Please enter plan base price.");
      return false;
    }
    inputPlanBasePrice.add(null);
    return true;
  }

  _validateCreatePlan() {
    if (createNewPlan.planName.isNotEmpty &&
        createNewPlan.planValidity > 0 &&
        createNewPlan.planValidityUnit.isNotEmpty &&
        createNewPlan.planBasicCost > 0 &&
        createNewPlan.planOfferedCost > 0 &&
        createNewPlan.planType.isNotEmpty &&
        createNewPlan.uploadSpeed > 0 &&
        createNewPlan.uploadSpeedUnit.isNotEmpty &&
        createNewPlan.downloadSpeed > 0 &&
        createNewPlan.downloadSpeedUnit.isNotEmpty &&
        ((createNewPlan.dataLimit > 0 &&
                createNewPlan.dataLimitUnit.isNotEmpty) ||
            createNewPlan.planType == PlanType.unlimited) &&
        (createNewPlan.planType == PlanType.fup
            ? (createNewPlan.uploadSpeedFUP > 0 &&
                createNewPlan.uploadSpeedFUPUnit.isNotEmpty &&
                createNewPlan.downloadSpeedFUP > 0 &&
                createNewPlan.downloadSpeedFUPUnit.isNotEmpty)
            : true)) {
      inputIsFormValid.add(true);
    } else {
      inputIsFormValid.add(false);
    }
  }

  _verifyPlanValidity(int? value) {
    if (value == null || value <= 0) {
      inputPlanValidity.add("Enter a value greater than 0.");
      return false;
    }
    inputPlanValidity.add(null);
    return true;
  }

  _validatePlanDescription(String? value) {
    if (value == null || value.isEmpty) {
      inputPlanDescription.add("Please enter plan description.");
      return false;
    }
    inputPlanDescription.add(null);
    return true;
  }

  calculateOfferPrice() {
    if (createNewPlan.planEnteredCost > 0) {
      if (isTaxIncluded) {
        var finalAmount = createNewPlan.planEnteredCost;
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
        var finalAmount = createNewPlan.planEnteredCost +
            (createNewPlan.planEnteredCost * (taxRate / 100));
        var basePrice = createNewPlan.planEnteredCost;
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
      inputPlanOfferPrice.add(null);
    }
  }

  _getPlansMetaData() async {
    var result = await _getPlanProfileUseCase.execute();
    result.fold((failure) {
      //TODO: Handle Failure
    }, (planProfile) {
      _intiallizePlanSectionMetadata(planProfile.data[0]);
    });
  }

  _intiallizePlanSectionMetadata(PlanProfileMeta planProfile) {
    planSpeedUnit = planProfile.planSpeedUnit;
    planDataLimitUnit = planProfile.planDataLimitUnit;
    planValidityUnit = planProfile.planValidityUnit;
    planType = planProfile.planType;
    taxRate = planProfile.taxRate;
    _isIntiallizedController.sink.add(true);
  }

  _createPlan(BuildContext context) async {
    _dialogService.showDialogOnScreen(
        context,
        DialogRequest(
            title: "Loading",
            description: "Loading",
            dialogType: DialogType.loading));
    var result = await _createPlanUseCase.execute(CreatePlanRequest(
        planName: createNewPlan.planName,
        planDescription: createNewPlan.planDescription,
        planType: createNewPlan.planType,
        planValidity: createNewPlan.planValidity,
        planValidityUnit: createNewPlan.planValidityUnit,
        planBasicCost: createNewPlan.planBasicCost,
        planOfferedCost: createNewPlan.planOfferedCost,
        taxAmount: createNewPlan.taxAmount,
        downloadSpeed: createNewPlan.downloadSpeed,
        downloadSpeedUnit: createNewPlan.downloadSpeedUnit,
        uploadSpeed: createNewPlan.uploadSpeed,
        uploadSpeedUnit: createNewPlan.uploadSpeedUnit,
        dataLimit: createNewPlan.dataLimit,
        dataLimitUnit: createNewPlan.dataLimitUnit,
        downloadSpeedFUP: createNewPlan.downloadSpeedFUP,
        uploadSpeedFUP: createNewPlan.uploadSpeedFUP,
        downloadSpeedFUPUnit: createNewPlan.downloadSpeedFUPUnit,
        uploadSpeedFUPUnit: createNewPlan.uploadSpeedFUPUnit,
        dataLimitFUP: createNewPlan.dataLimitFUP,
        dataLimitFUPUnit: createNewPlan.dataLimitFUPUnit,
        maxSessionTimeInsec: createNewPlan.maxSessionTimeInsec,
        maxDataTransferInSession: createNewPlan.maxDataTransferInSession,
        maxSimultaneousUser: createNewPlan.maxSimultaneousUser,
        gracePeriodInDays: createNewPlan.gracePeriodInDays));
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
