import 'dart:async';

import 'package:flutter/material.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/enum_model.dart';
import 'package:netify/domain/model/home_model.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/model/wallet_model.dart';
import 'package:netify/domain/usecase/get_payment_metadata_usecase.dart';
import 'package:netify/domain/usecase/getdashboard_usecase.dart';
import 'package:netify/domain/usecase/getuserwallet_usecase.dart';
import 'package:netify/domain/usecase/w2w_transfer_usecase.dart';
import 'package:netify/persentation/base/baseviewmodel.dart';
import 'package:netify/persentation/common/freezed_data_classes.dart';
import 'package:netify/services/dialog_service.dart';
import 'package:netify/services/navigator_service.dart';
import 'package:rxdart/rxdart.dart';

class PaymentsPageViewModel extends BaseViewModelInputsOutputs {
  final StreamController _dashboardController =
      StreamController<List<DashboardItem>>.broadcast();
  final StreamController _sliderDisplayObjectController =
      StreamController<SliderDisplayObject>.broadcast();
  final _userWalletStreamController = BehaviorSubject<UserWallet>();
  final _transactionStreamController = BehaviorSubject<List<Transaction>>();
  final StreamController _activateW2wTransfer =
      StreamController<bool>.broadcast();
  final StreamController _payeeNameController =
      StreamController<String?>.broadcast();
  final StreamController _amountController =
      StreamController<String?>.broadcast();

  final GetDashboardUseCase _getDashboardUseCase;
  final GetPaymentMetadataUseCase _getPaymentProfileMetadataUseCase;
  final GetUserWalletUseCase _getUserWalletUseCase;
  final DialogService _dialogService;
  final W2WTransferUsecase _w2WTransferUsecase;
  final NavigationService _navigationService;
  late final Map<int, MainPageModel> _screenIndex;
  late final String _loggedInUser;
  String _currentFilter = "";
  String _filterSearchValue = "";
  var w2wTransfer = W2wTransferObject(0, "", "");

  PaymentsPageViewModel(
    this._getDashboardUseCase,
    this._getPaymentProfileMetadataUseCase,
    this._getUserWalletUseCase,
    this._w2WTransferUsecase,
    this._dialogService,
    this._navigationService,
  );

  int currentSliderIndex = 0;
  bool isSearchEnabled = false;

  @override
  void start() {
    _getPaymentsPageMetadata();
  }

  String get loggedInUser => _loggedInUser;

  @override
  void dispose() {
    _dashboardController.close();
    _sliderDisplayObjectController.close();
    _userWalletStreamController.close();
    _transactionStreamController.close();
    _activateW2wTransfer.close();
  }

  void setTransferAmount(String amount) {
    var amt = double.tryParse(amount) ?? 0;
    if (validateAmount(amt)) {
      w2wTransfer = w2wTransfer.copyWith(amount: amt);
    } else {
      w2wTransfer = w2wTransfer.copyWith(amount: 0);
    }
    validateW2wTransfer();
  }

  void setPayeeName(String payeeName, String payeeId) {
    if (validatePayeeName(payeeName)) {
      w2wTransfer = w2wTransfer.copyWith(receiverUserName: payeeName);
      w2wTransfer = w2wTransfer.copyWith(receiverUserId: payeeId);
    } else {
      w2wTransfer = w2wTransfer.copyWith(receiverUserName: "");
      w2wTransfer = w2wTransfer.copyWith(receiverUserId: "");
    }
    validateW2wTransfer();
  }

  void triggerTransfer(BuildContext context) {
    _w2wTransfer(context, w2wTransfer.receiverUserName, w2wTransfer.amount,
        w2wTransfer.receiverUserId);
  }

  void onScreenChange(int index) {
    // inputSearch.add(false);
    currentSliderIndex = index;
    if (_screenIndex[index]!.dataTypeIdentity == DataTypeIdentity.dashboard) {
      _getDashboardData(_screenIndex[index]!.screenTypeIdentity);
    }
    if (_screenIndex[index]!.dataTypeIdentity == DataTypeIdentity.wallet) {
      _getWalletData();
    }
    if (_screenIndex[index]!.dataTypeIdentity ==
        DataTypeIdentity.transactions) {
      _getTransactionData();
    }

    _postDataToView();
  }

  Sink get inputForDashboard => _dashboardController.sink;

  Sink get inputForSliderDisplayObject => _sliderDisplayObjectController.sink;

  Sink<UserWallet> get inputForUserWallet => _userWalletStreamController.sink;

  Sink<List<Transaction>> get inputForTransaction =>
      _transactionStreamController.sink;

  Sink get inputForActivateW2wTransfer => _activateW2wTransfer.sink;

  Sink get inputForPayeeName => _payeeNameController.sink;

  Sink get inputForAmount => _amountController.sink;

  Stream<List<DashboardItem>> get outputForDashborad =>
      _dashboardController.stream.map((dashboard) => dashboard);

  Stream<SliderDisplayObject> get outputForSliderDisplayObject =>
      _sliderDisplayObjectController.stream
          .map((sliderDisplayObject) => sliderDisplayObject);

  Stream<UserWallet> get outputForUserWallet =>
      _userWalletStreamController.stream;

  Stream<List<Transaction>> get outputForTransaction =>
      _transactionStreamController.stream;

  Stream<bool> get outputForActivateW2wTransfer =>
      _activateW2wTransfer.stream.map((event) => event);

  Stream<String?> get outputForPayeeName =>
      _payeeNameController.stream.map((event) => event);

  Stream<String?> get outputForAmount =>
      _amountController.stream.map((event) => event);

  bool validateAmount(double amount) {
    if (amount > 0) {
      inputForAmount.add(null);
      return true;
    } else {
      inputForAmount.add("Please Enter value more than 0");
      return false;
    }
  }

  bool validatePayeeName(String payeeName) {
    if (payeeName.isNotEmpty) {
      inputForPayeeName.add(null);
      return true;
    } else {
      inputForPayeeName.add("Please Select Payee Name");
      return false;
    }
  }

  validateW2wTransfer() {
    if (w2wTransfer.amount > 0 &&
        w2wTransfer.receiverUserName.isNotEmpty &&
        w2wTransfer.receiverUserId.isNotEmpty) {
      inputForActivateW2wTransfer.add(true);
    } else {
      inputForActivateW2wTransfer.add(false);
    }
  }

  void _getWalletData() async {
    var result = await _getUserWalletUseCase.execute();
    result.fold((failure) {}, (userWallet) {
      inputForUserWallet.add(userWallet.data[0]);
    });
  }

  void _getTransactionData() async {
    var result = await _getUserWalletUseCase.execute();
    result.fold((failure) {}, (userWallet) {
      inputForTransaction.add(userWallet.data[0].transactions);
    });
  }

  void _w2wTransfer(BuildContext context, String receiverUsername,
      double amount, String receiverUserId) async {
    _dialogService.showDialogOnScreen(
        context,
        DialogRequest(
            title: "Loading",
            description: "Loading",
            dialogType: DialogType.loading));
    var result = await _w2WTransferUsecase.execute(W2WTransferRequest(
        receiverUsername: receiverUsername,
        amount: amount,
        receiverId: receiverUserId));
    result.fold((failure) {
      _handleTransactionFailure(failure, context);
    }, (userWallet) {
      _handleTransactionSuccess(userWallet, context);
    });
  }

  _handleTransactionFailure(Failure failure, BuildContext context) {
    Navigator.of(context).pop();
    _dialogService.showDialogOnScreen(
        context,
        DialogRequest(
            title: "Error",
            description: failure.message,
            dialogType: DialogType.error));
  }

  _handleTransactionSuccess(GeneralSuccess data, BuildContext context) {
    Navigator.of(context).pop();
    var successDialouge = _dialogService.showDialogOnScreen(
        context,
        DialogRequest(
            title: "Success",
            description: data.data[0].message,
            dialogType: DialogType.info));
    successDialouge.then((value) => _getWalletData());
  }

  _getPaymentsPageMetadata() async {
    var result = await _getPaymentProfileMetadataUseCase.execute();
    result.fold((failure) {}, (paymentsProfileMeta) {
      //_screenIndex = {};
      _screenIndex = paymentsProfileMeta.data[0].paymentScreens.asMap();
      _loggedInUser = paymentsProfileMeta.data[0].userName;
      onScreenChange(currentSliderIndex);
    });
  }

  _getDashboardData(String screenTypeIdentity) async {
    var result = await _getDashboardUseCase
        .execute(GetDashboardRequest(screenTypeIdentity: screenTypeIdentity));
    result.fold((failure) {
      //TODO: Handle Failure
    }, (dashboard) {
      inputForDashboard.add(dashboard.data);
    });
  }

  _postDataToView() {
    inputForSliderDisplayObject.add(SliderDisplayObject(
        mainPageModel: _screenIndex[currentSliderIndex]!,
        numberOfDisplays: _screenIndex.length,
        currentDisplayIndex: currentSliderIndex));
  }
}
