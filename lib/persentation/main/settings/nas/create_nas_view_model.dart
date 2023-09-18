import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/usecase/create_newnasentry_usecase.dart';
import 'package:netify/persentation/base/baseviewmodel.dart';
import 'package:netify/persentation/common/freezed_data_classes.dart';
import 'package:netify/services/dialog_service.dart';
import 'package:netify/services/navigator_service.dart';

class NasEntryViewModel extends BaseViewModelInputsOutputs {
  final StreamController _nasNameController =
      StreamController<String?>.broadcast();

  final StreamController _nasSecretController =
      StreamController<String?>.broadcast();

  final StreamController _nasPortController =
      StreamController<String?>.broadcast();

  final StreamController _formValidController =
      StreamController<bool>.broadcast();

  final NasEntryUsecase _nasEntryUsecase;
  final NavigationService _navigationService;
  final DialogService _dialogService;
  var createNewNas = CreateNewNas("", "", "", 0, "", "", "", "");
  RegExp regexIp = RegExp(r'^[0-9]+(?:\.[0-9]+){3}$');
  RegExp regexPort = RegExp(r'^[0-9]+(?:\,[0-9]+){3}$');

  NasEntryViewModel(
    this._nasEntryUsecase,
    this._navigationService,
    this._dialogService,
  );
  @override
  void start() {}

  @override
  void dispose() {
    _nasNameController.close();
    _nasSecretController.close();
    _nasPortController.close();
    _formValidController.close();
  }

  void setNasName(String nasName) {
    if (_validateNasName(nasName)) {
      createNewNas = createNewNas.copyWith(nasName: nasName);
    } else {
      createNewNas = createNewNas.copyWith(nasName: "");
    }
    _validateCreateNas();
  }

  void setNasSecret(String nasSecret) {
    if (_validateNasSecret(nasSecret)) {
      createNewNas = createNewNas.copyWith(nasSecret: nasSecret);
    } else {
      createNewNas = createNewNas.copyWith(nasSecret: "");
    }
    _validateCreateNas();
  }

  void setNasType(String nasType) {
    createNewNas = createNewNas.copyWith(nasType: nasType);
    _validateCreateNas();
  }

  void setNasPorts(String nasPorts) {
    int port = int.tryParse(nasPorts) ?? 0;
    if (_validateNasPort(port)) {
      createNewNas = createNewNas.copyWith(ports: port);
    } else {
      createNewNas = createNewNas.copyWith(ports: 0);
    }
    _validateCreateNas();
  }

  void setNasServer(String nasServer) {
    createNewNas = createNewNas.copyWith(server: nasServer);
    _validateCreateNas();
  }

  void setNasCommunity(String nasCommunity) {
    createNewNas = createNewNas.copyWith(community: nasCommunity);
    _validateCreateNas();
  }

  void setNasDescription(String nasDescription) {
    createNewNas = createNewNas.copyWith(nasDescription: nasDescription);
    _validateCreateNas();
  }

  void setNasShortName(String nasShortName) {
    createNewNas = createNewNas.copyWith(shortName: nasShortName);
    _validateCreateNas();
  }

  void createNas(BuildContext context) {
    _createNas(context);
  }

  Sink get nasNameSink => _nasNameController.sink;
  Sink get nasSecretSink => _nasSecretController.sink;
  Sink get formValidSink => _formValidController.sink;
  Sink get nasPortSink => _nasPortController.sink;

  Stream<String?> get nasNameStream =>
      _nasNameController.stream.map((event) => event);
  Stream<String?> get nasSecretStream =>
      _nasSecretController.stream.map((event) => event);
  Stream<bool> get formValidStream =>
      _formValidController.stream.map((event) => event);
  Stream<String?> get nasPortStream =>
      _nasPortController.stream.map((event) => event);

  _validateNasName(String nasName) {
    if (regexIp.hasMatch(nasName)) {
      nasNameSink.add(null);
      return true;
    } else {
      nasNameSink.add("Please enter a valid IP");
      return false;
    }
  }

  _validateNasSecret(String nasSecret) {
    if (nasSecret.length > 5) {
      nasSecretSink.add(null);
      return true;
    } else {
      nasSecretSink
          .add("Please enter a valid secret length should be more than 5");
      return false;
    }
  }

  _validateCreateNas() {
    if (createNewNas.nasName.isNotEmpty && createNewNas.nasSecret.isNotEmpty) {
      formValidSink.add(true);
    } else {
      formValidSink.add(false);
    }
  }

  _validateNasPort(int nasPort) {
    if (regexPort.hasMatch(nasPort.toString())) {
      nasPortSink.add(null);
      return true;
    } else {
      nasPortSink.add("Please enter a valid port");
      return false;
    }
  }

  void _createNas(BuildContext context) async {
    _dialogService.showDialogOnScreen(
        context,
        DialogRequest(
            title: "Loading",
            description: "Loading",
            dialogType: DialogType.loading));
    var result = await _nasEntryUsecase.execute(NasEntryRequest(
        nasname: createNewNas.nasName,
        shortname: createNewNas.shortName,
        secret: createNewNas.nasSecret,
        type: createNewNas.nasType,
        ports: createNewNas.ports,
        server: createNewNas.server,
        community: createNewNas.community,
        description: createNewNas.nasDescription));

    result.fold((failure) {
      _handleSubmitFailure(failure, context);
    }, (success) {
      _handleSubmitSuccess(success, context);
    });
  }

  _handleSubmitFailure(Failure failure, BuildContext context) {
    Navigator.of(context).pop();
    _dialogService.showDialogOnScreen(
        context,
        DialogRequest(
            title: "Error",
            description: failure.message,
            dialogType: DialogType.error));
  }

  _handleSubmitSuccess(GeneralSuccess data, BuildContext context) {
    Navigator.of(context).pop();
    var successDialouge = _dialogService.showDialogOnScreen(
        context,
        DialogRequest(
            title: "Success",
            description: data.data[0].message,
            dialogType: DialogType.info));
    successDialouge.then((value) => _navigationService.goBack());
  }
}
