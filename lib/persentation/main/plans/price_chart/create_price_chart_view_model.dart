import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/plan_model.dart';
import 'package:netify/domain/usecase/create_operatorchart_usecase.dart';
import 'package:netify/domain/usecase/create_resellerchart_usecase.dart';
import 'package:netify/domain/usecase/getplanprofile_usecase.dart';
import 'package:netify/persentation/base/baseviewmodel.dart';
import 'package:netify/persentation/common/freezed_data_classes.dart';
import 'package:netify/services/dialog_service.dart';
import 'package:netify/services/navigator_service.dart';

class CreatePlanPageViewModel extends BaseViewModelInputsOutputs {
  final StreamController _planPriceController =
      StreamController<int?>.broadcast();
  final StreamController _resellerUsernameController =
      StreamController<String>.broadcast();
  final StreamController _operatorUsernameController =
      StreamController<String>.broadcast();
  final StreamController _planControllerValid =
      StreamController<bool>.broadcast();
  final StreamController _resellerPriceControllerValid =
      StreamController<bool>.broadcast();
  final StreamController _operatorPriceControllerValid =
      StreamController<bool>.broadcast();

  final _listOfPlansStreamController =
      StreamController<List<PlanProfileMetaPlan>>.broadcast();
  final _listOfResellerPlansStreamController =
      StreamController<List<PlanProfileMetaPlan>>.broadcast();
  final _listOfResellerStreamController =
      StreamController<List<String>>.broadcast();
  final _listOfOperatorStreamController =
      StreamController<List<String>>.broadcast();

  final StreamController _planOfferPriceController =
      StreamController<OfferPrice?>.broadcast();

  final GetPlanProfileUseCase _getPlanProfileUseCase;
  final DialogService _dialogService;
  final NavigationService _navigationService;
  final CreateOperatorPriceChartUsecase _createOperatorPriceChartUsecase;
  final CreateResellerPriceChartUsecase _createResellerPriceChartUsecase;
  late final Map<String, List<String>> resellermap;
  late final Map<String, List<PlanProfileMetaPlan>> resellerPlanMap;

  var createNewOperatorPriceChart =
      CreateOperatorPriceChart("", "", "", 0, 0, 0, 0);
  var createNewResellerPriceChart =
      CreateResellerPriceChart("", "", 0, 0, 0, 0);

  bool isTaxIncluded = false;

  late final double taxRate;
  CreatePlanPageViewModel(
      this._getPlanProfileUseCase,
      this._navigationService,
      this._createOperatorPriceChartUsecase,
      this._createResellerPriceChartUsecase,
      this._dialogService);

  @override
  void dispose() {
    _planPriceController.close();
    _resellerUsernameController.close();
    _operatorUsernameController.close();
    _planControllerValid.close();
    _resellerPriceControllerValid.close();
    _operatorPriceControllerValid.close();
    _listOfPlansStreamController.close();
    _listOfResellerPlansStreamController.close();
    _listOfResellerStreamController.close();
    _listOfOperatorStreamController.close();
    _planOfferPriceController.close();
  }

  @override
  void start() {
    _getPlansMetaData();
  }

  setPlanMargin(int value) {
    var enteredCost = double.tryParse(value.toString()) ?? 0;
    _planPriceController.sink.add(value);
    if (_validatePlanPrice(value) == null) {
      createNewResellerPriceChart =
          createNewResellerPriceChart.copyWith(planEnteredMargin: enteredCost);
      createNewOperatorPriceChart =
          createNewOperatorPriceChart.copyWith(planEnteredMargin: enteredCost);
    }
    calculateOfferPrice();
    _validateCreateOperatorPriceChart();
    _validateCreateResellerPriceChart();
  }

  setSelectedPlan(String value) {
    String planName = value.split("&&")[0];
    double planBasicCost = double.tryParse(value.split("&&")[1]) ?? 0;
    createNewResellerPriceChart = createNewResellerPriceChart.copyWith(
        planName: planName, planBasicCost: planBasicCost);
    createNewOperatorPriceChart = createNewOperatorPriceChart.copyWith(
        planName: planName, planBasicCost: planBasicCost);
    calculateOfferPrice();
    _validateCreateOperatorPriceChart();
    _validateCreateResellerPriceChart();
  }

  setResellerUsername(String value) {
    createNewResellerPriceChart = createNewResellerPriceChart.copyWith(
        resellerUserName: value, planName: "", planBasicCost: 0);
    createNewOperatorPriceChart = createNewOperatorPriceChart.copyWith(
        resellerUserName: value,
        planName: "",
        operatorUserName: "",
        planBasicCost: 0);
    _listOfResellerPlansStreamController.sink.add(resellerPlanMap[value]!);
    _listOfOperatorStreamController.sink.add(resellermap[value]!);
    _validateCreateOperatorPriceChart();
    _validateCreateResellerPriceChart();
  }

  setOperatorUsername(String value) {
    createNewOperatorPriceChart =
        createNewOperatorPriceChart.copyWith(operatorUserName: value);
    _validateCreateOperatorPriceChart();
  }

  setPlanOfferPrice(double value) {
    createNewResellerPriceChart =
        createNewResellerPriceChart.copyWith(planOfferedCost: value);
    createNewOperatorPriceChart =
        createNewOperatorPriceChart.copyWith(planOfferedCost: value);
    _validateCreateOperatorPriceChart();
    _validateCreateResellerPriceChart();
  }

  // setPlanBasePriceCost(double value) {
  //   createNewResellerPriceChart =
  //       createNewResellerPriceChart.copyWith(planBasicCost: value);
  //   createNewOperatorPriceChart =
  //       createNewOperatorPriceChart.copyWith(planBasicCost: value);
  //   _validateCreateOperatorPriceChart();
  //   _validateCreateResellerPriceChart();
  // }

  setTaxAmount(double value) {
    createNewResellerPriceChart =
        createNewResellerPriceChart.copyWith(taxAmount: value);
    createNewOperatorPriceChart =
        createNewOperatorPriceChart.copyWith(taxAmount: value);
    _validateCreateOperatorPriceChart();
    _validateCreateResellerPriceChart();
  }

  setIsTaxIncluded(bool value) {
    isTaxIncluded = value;
    calculateOfferPrice();
  }

  createNewResellerPriceChartSubmit(BuildContext context) {
    _createResellerPriceChart(context);
  }

  createNewOperatorPriceChartSubmit(BuildContext context) {
    _createOperatorPriceChart(context);
  }

  Sink get planPrice => _planPriceController.sink;
  Sink get resellerUsername => _resellerUsernameController.sink;
  Sink get operatorUsername => _operatorUsernameController.sink;
  Sink get inputPlanOfferPrice => _planOfferPriceController.sink;

  Stream<String?> get outputErrorPlanPriceStream =>
      _planPriceController.stream.map((event) => _validatePlanPrice(event));

  Stream<bool> get isAllPlanInputValid => _planControllerValid.stream.map(
        (event) => event,
      );
  Stream<bool> get isAllResellerPriceInputValid =>
      _resellerPriceControllerValid.stream.map(
        (event) => event,
      );
  Stream<bool> get isAllOperatorPriceInputValid =>
      _operatorPriceControllerValid.stream.map(
        (event) => event,
      );
  Stream<List<PlanProfileMetaPlan>> get listOfPlansStream =>
      _listOfPlansStreamController.stream.map((event) => event);
  Stream<List<PlanProfileMetaPlan>> get listOfResellerPlansStream =>
      _listOfResellerPlansStreamController.stream.map((event) => event);
  Stream<List<String>> get listOfResellerStream =>
      _listOfResellerStreamController.stream.map((event) => event);
  Stream<List<String>> get listOfOperatorStream =>
      _listOfOperatorStreamController.stream.map((event) => event);

  Stream<OfferPrice?> get outputPlanOfferPrice =>
      _planOfferPriceController.stream.map((event) => event);

  _validatePlanPrice(int? value) {
    if (value == null || value < 1) {
      return 'Please enter plan price above 0';
    }
    return null;
  }

  calculateOfferPrice() {
    if ((createNewResellerPriceChart.planEnteredMargin > 0 &&
            createNewResellerPriceChart.planBasicCost > 0) ||
        (createNewOperatorPriceChart.planEnteredMargin > 0 &&
            createNewOperatorPriceChart.planBasicCost > 0)) {
      if (createNewResellerPriceChart.planEnteredMargin > 0 &&
          createNewResellerPriceChart.planBasicCost > 0) {
        if (isTaxIncluded) {
          var finalAmount = createNewResellerPriceChart.planEnteredMargin +
              createNewResellerPriceChart.planBasicCost;

          var marginPrice = createNewResellerPriceChart.planEnteredMargin;
          var taxAmount = marginPrice * (taxRate / (100 + taxRate));
          inputPlanOfferPrice.add(OfferPrice(
              offerPrice: finalAmount,
              taxAmount: taxAmount,
              basePrice: createNewResellerPriceChart.planBasicCost,
              taxPercentage: taxRate));
          setPlanOfferPrice(finalAmount);
          setTaxAmount(taxAmount);
        } else {
          var taxAmount =
              createNewResellerPriceChart.planEnteredMargin * (taxRate / 100);
          var finalAmount = createNewResellerPriceChart.planEnteredMargin +
              createNewResellerPriceChart.planBasicCost +
              taxAmount;

          inputPlanOfferPrice.add(OfferPrice(
              offerPrice: finalAmount,
              taxAmount: taxAmount,
              basePrice: createNewResellerPriceChart.planBasicCost,
              taxPercentage: taxRate));
          setPlanOfferPrice(finalAmount);
          setTaxAmount(taxAmount);
        }
      } else {
        if (isTaxIncluded) {
          var finalAmount = createNewOperatorPriceChart.planEnteredMargin +
              createNewOperatorPriceChart.planBasicCost;
          var marginPrice = createNewOperatorPriceChart.planEnteredMargin;
          var taxAmount = marginPrice * (taxRate / (100 + taxRate));
          inputPlanOfferPrice.add(OfferPrice(
              offerPrice: finalAmount,
              taxAmount: taxAmount,
              basePrice: createNewOperatorPriceChart.planBasicCost,
              taxPercentage: taxRate));
          setPlanOfferPrice(finalAmount);
          setTaxAmount(taxAmount);
        } else {
          var taxAmount =
              createNewOperatorPriceChart.planEnteredMargin * (taxRate / 100);
          var finalAmount = createNewOperatorPriceChart.planEnteredMargin +
              createNewOperatorPriceChart.planBasicCost +
              taxAmount;

          inputPlanOfferPrice.add(OfferPrice(
              offerPrice: finalAmount,
              taxAmount: taxAmount,
              basePrice: createNewOperatorPriceChart.planBasicCost,
              taxPercentage: taxRate));
          setPlanOfferPrice(finalAmount);
          setTaxAmount(taxAmount);
        }
      }
    } else {
      inputPlanOfferPrice.add(null);
    }
  }

  _validateCreateResellerPriceChart() {
    if (createNewResellerPriceChart.resellerUserName.isEmpty ||
        createNewResellerPriceChart.planBasicCost < 1 ||
        createNewResellerPriceChart.planOfferedCost < 1 ||
        createNewResellerPriceChart.taxAmount < 1 ||
        createNewResellerPriceChart.planName.isEmpty) {
      _resellerPriceControllerValid.sink.add(false);
    } else {
      _resellerPriceControllerValid.sink.add(true);
    }
  }

  _validateCreateOperatorPriceChart() {
    if (createNewOperatorPriceChart.operatorUserName.isEmpty ||
        createNewOperatorPriceChart.planBasicCost < 1 ||
        createNewOperatorPriceChart.planOfferedCost < 1 ||
        createNewOperatorPriceChart.taxAmount < 1 ||
        createNewOperatorPriceChart.planName.isEmpty ||
        createNewOperatorPriceChart.resellerUserName.isEmpty) {
      _operatorPriceControllerValid.sink.add(false);
    } else {
      _operatorPriceControllerValid.sink.add(true);
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
    taxRate = planProfile.taxRate;
    _listOfPlansStreamController.sink.add(planProfile.planList);
    _listOfResellerStreamController.sink
        .add(planProfile.resellerMap.keys.toList());
    resellermap = planProfile.resellerMap;
    resellerPlanMap = planProfile.resellerPlanMap;
  }

  _createResellerPriceChart(BuildContext context) async {
    _dialogService.showDialogOnScreen(
        context,
        DialogRequest(
            title: "Loading",
            description: "Loading",
            dialogType: DialogType.loading));
    var result = await _createResellerPriceChartUsecase.execute(
        CreateResellerPriceChartRequest(
            planName: createNewResellerPriceChart.planName,
            resellerUserName: createNewResellerPriceChart.resellerUserName,
            planBasicCost: createNewResellerPriceChart.planBasicCost,
            planOfferedCost: createNewResellerPriceChart.planOfferedCost,
            taxAmount: createNewResellerPriceChart.taxAmount));
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

  _createOperatorPriceChart(BuildContext context) async {
    _dialogService.showDialogOnScreen(
        context,
        DialogRequest(
            title: "Loading",
            description: "Loading",
            dialogType: DialogType.loading));
    var result = await _createOperatorPriceChartUsecase.execute(
        CreateOperatorPriceChartRequest(
            planName: createNewOperatorPriceChart.planName,
            resellerUserName: createNewOperatorPriceChart.resellerUserName,
            operatorUserName: createNewOperatorPriceChart.operatorUserName,
            planBasicCost: createNewOperatorPriceChart.planBasicCost,
            planOfferedCost: createNewOperatorPriceChart.planOfferedCost,
            taxAmount: createNewOperatorPriceChart.taxAmount));

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
