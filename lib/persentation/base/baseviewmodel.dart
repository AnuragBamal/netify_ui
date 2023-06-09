import 'dart:async';

import 'package:netify/persentation/common/state_rendrer/state_rendrer_implementor.dart';

abstract class BaseViewModel extends BaseViewModelInputsOutputs {
  //shared variables and functions that will be used in all viewmodels
  final StreamController _inputStreamController =
      StreamController<FlowState>.broadcast();

  @override
  Stream<FlowState> get outputState =>
      _inputStreamController.stream.map((flowstate) => flowstate);

  @override
  Sink get inputState => _inputStreamController.sink;

  @override
  void dispose() {
    _inputStreamController.close();
  }
}

abstract class BaseViewModelInputsOutputs {
  void start(); //will becalled with init of view model
  void dispose(); // will be called when view model is disposed
  Sink get inputState;
  Stream<FlowState> get outputState;
}
