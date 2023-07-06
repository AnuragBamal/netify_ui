import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/home_model.dart';
import 'package:netify/domain/usecase/create_operatorchart_usecase.dart';
import 'package:netify/domain/usecase/create_plan_usecase.dart';
import 'package:netify/domain/usecase/create_resellerchart_usecase.dart';
import 'package:netify/domain/usecase/getplanprofile_usecase.dart';
import 'package:netify/persentation/base/baseviewmodel.dart';
import 'package:netify/persentation/common/freezed_data_classes.dart';
import 'package:netify/services/dialog_service.dart';
import 'package:netify/services/navigator_service.dart';

class CreatePlanPageViewModel extends BaseViewModelInputsOutputs {
  final StreamController _planNameController =
      StreamController<String?>.broadcast();
  final StreamController _planDescriptionController =
      StreamController<String?>.broadcast();
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
      StreamController<List<String>>.broadcast();
  final _listOfResellerPlansStreamController =
      StreamController<List<PlanProfileMetaPlan>>.broadcast();
  final _listOfResellerStreamController =
      StreamController<List<String>>.broadcast();
  final _listOfOperatorStreamController =
      StreamController<List<String>>.broadcast();

  final GetPlanProfileUseCase _getPlanProfileUseCase;
  final DialogService _dialogService;
  final NavigationService _navigationService;
  final CreateOperatorPriceChartUsecase _createOperatorPriceChartUsecase;
  final CreatePlanUseCase _createPlanUseCase;
  final CreateResellerPriceChartUsecase _createResellerPriceChartUsecase;
  late final Map<String, List<String>> resellermap;
  late final Map<String, List<PlanProfileMetaPlan>> resellerPlanMap;
  var createNewPlan = CreatePlan("", "");
  var createNewOperatorPriceChart = CreateOperatorPriceChart("", "", "", 0);
  var createNewResellerPriceChart = CreateResellerPriceChart("", "", 0);
  CreatePlanPageViewModel(
      this._getPlanProfileUseCase,
      this._navigationService,
      this._createOperatorPriceChartUsecase,
      this._createPlanUseCase,
      this._createResellerPriceChartUsecase,
      this._dialogService);

  @override
  void dispose() {
    _planNameController.close();
    _planDescriptionController.close();
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
  }

  @override
  void start() {
    _getPlansMetaData();
  }

  setPlanName(String value) {
    _planNameController.sink.add(value);
    if (_validatePlanName(value) == null) {
      createNewPlan = createNewPlan.copyWith(planName: value);
    }
    _validateCreatePlan();
  }

  setPlanDescription(String value) {
    _planDescriptionController.sink.add(value);
    if (_validatePlanDescription(value) == null) {
      createNewPlan = createNewPlan.copyWith(planDescription: value);
    }
    _validateCreatePlan();
  }

  setPlanPrice(int value) {
    _planPriceController.sink.add(value);
    if (_validatePlanPrice(value) == null) {
      createNewResellerPriceChart =
          createNewResellerPriceChart.copyWith(price: value);
      createNewOperatorPriceChart =
          createNewOperatorPriceChart.copyWith(price: value);
    }
    _validateCreateOperatorPriceChart();
    _validateCreateResellerPriceChart();
  }

  setSelectedPlan(String value) {
    createNewResellerPriceChart =
        createNewResellerPriceChart.copyWith(planName: value);
    createNewOperatorPriceChart =
        createNewOperatorPriceChart.copyWith(planName: value);
    _validateCreateOperatorPriceChart();
    _validateCreateResellerPriceChart();
  }

  setResellerUsername(String value) {
    createNewResellerPriceChart = createNewResellerPriceChart.copyWith(
        resellerUserName: value, planName: "");
    createNewOperatorPriceChart = createNewOperatorPriceChart.copyWith(
        resellerUserName: value, planName: "", operatorUserName: "");
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

  createNewPlanSubmit(BuildContext context) {
    _createPlan(context);
  }

  createNewResellerPriceChartSubmit(BuildContext context) {
    _createResellerPriceChart(context);
  }

  createNewOperatorPriceChartSubmit(BuildContext context) {
    _createOperatorPriceChart(context);
  }

  Sink get planName => _planNameController.sink;
  Sink get planDescription => _planDescriptionController.sink;
  Sink get planPrice => _planPriceController.sink;
  Sink get resellerUsername => _resellerUsernameController.sink;
  Sink get operatorUsername => _operatorUsernameController.sink;

  Stream<String?> get outputErrorPlanNameStream =>
      _planNameController.stream.map((event) => _validatePlanName(event));
  Stream<String?> get outputErrorPlanDescriptionStream =>
      _planDescriptionController.stream
          .map((event) => _validatePlanDescription(event));
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
  Stream<List<String>> get listOfPlansStream =>
      _listOfPlansStreamController.stream.map((event) => event);
  Stream<List<PlanProfileMetaPlan>> get listOfResellerPlansStream =>
      _listOfResellerPlansStreamController.stream.map((event) => event);
  Stream<List<String>> get listOfResellerStream =>
      _listOfResellerStreamController.stream.map((event) => event);
  Stream<List<String>> get listOfOperatorStream =>
      _listOfOperatorStreamController.stream.map((event) => event);

  _validatePlanName(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter plan name';
    }
    return null;
  }

  _validatePlanDescription(String? value) {
    if (value == null || value.isEmpty) {
      return 'Please enter plan description';
    }
    return null;
  }

  _validatePlanPrice(int? value) {
    if (value == null || value < 1) {
      return 'Please enter plan price above 0';
    }
    return null;
  }

  _validateCreatePlan() {
    if (createNewPlan.planName.isEmpty ||
        createNewPlan.planDescription.isEmpty) {
      _planControllerValid.sink.add(false);
    } else {
      _planControllerValid.sink.add(true);
    }
  }

  _validateCreateResellerPriceChart() {
    if (createNewResellerPriceChart.resellerUserName.isEmpty ||
        createNewResellerPriceChart.price < 1 ||
        createNewResellerPriceChart.planName.isEmpty) {
      _resellerPriceControllerValid.sink.add(false);
    } else {
      _resellerPriceControllerValid.sink.add(true);
    }
  }

  _validateCreateOperatorPriceChart() {
    if (createNewOperatorPriceChart.operatorUserName.isEmpty ||
        createNewOperatorPriceChart.price < 1 ||
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
    _listOfPlansStreamController.sink.add(planProfile.planList);
    _listOfResellerStreamController.sink
        .add(planProfile.resellerMap.keys.toList());
    resellermap = planProfile.resellerMap;
    resellerPlanMap = planProfile.resellerPlanMap;
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
        planDescription: createNewPlan.planDescription));
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
            price: createNewResellerPriceChart.price));
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
            price: createNewOperatorPriceChart.price));

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
