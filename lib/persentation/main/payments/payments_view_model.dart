import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/enum_model.dart';
import 'package:netify/domain/model/home_model.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/model/wallet_model.dart';
import 'package:netify/domain/usecase/get_payment_metadata_usecase.dart';
import 'package:netify/domain/usecase/get_sales_usecase.dart';
import 'package:netify/domain/usecase/get_transaction_usecase.dart';
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
  final _salesStreamController = BehaviorSubject<List<Sale>>();
  final _salesSearchStreamController = BehaviorSubject<List<Sale>>();
  final _transactionSearchStreamController =
      BehaviorSubject<List<Transaction>>();
  final StreamController _activateW2wTransfer =
      StreamController<bool>.broadcast();
  final StreamController _payeeNameController =
      StreamController<String?>.broadcast();
  final StreamController _amountController =
      StreamController<String?>.broadcast();

  final _searchController = BehaviorSubject<bool>.seeded(false);

  final GetDashboardUseCase _getDashboardUseCase;
  final GetPaymentMetadataUseCase _getPaymentProfileMetadataUseCase;
  final GetUserWalletUseCase _getUserWalletUseCase;
  final DialogService _dialogService;
  final W2WTransferUsecase _w2WTransferUsecase;
  final NavigationService _navigationService;
  final GetTransactionsUsecase _getTransactionsUsecase;
  final GetSalesUsecase _getSalesUsecase;
  late final Map<int, MainPageModel> _screenIndex;
  late final String _loggedInUser;

  int currentSliderIndex = 0;
  bool isSearchEnabled = false;
  String? _currentFilter;
  String? _filterSearchValue;
  int _currentPage = 0;
  int _currentSearchPage = 0;
  int _pageSize = 10;
  Timer? _debounce;
  final DateTime firstDayOfMonth =
      DateTime(DateTime.now().year, DateTime.now().month, 1);
  late final String _dateOnFirstDayOfMonth;
  final String _dateOnToday = DateFormat('dd-MM-yyyy').format(DateTime.now());
  String _fromDate = "";
  String _toDate = DateFormat('dd-MM-yyyy').format(DateTime.now());

  var w2wTransfer = W2wTransferObject(0, "", "", "");

  PaymentsPageViewModel(
    this._getDashboardUseCase,
    this._getPaymentProfileMetadataUseCase,
    this._getUserWalletUseCase,
    this._w2WTransferUsecase,
    this._dialogService,
    this._navigationService,
    this._getTransactionsUsecase,
    this._getSalesUsecase,
  );

  @override
  void start() {
    _dateOnFirstDayOfMonth = DateFormat('dd-MM-yyyy').format(firstDayOfMonth);
    _fromDate = _dateOnFirstDayOfMonth;
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
    _payeeNameController.close();
    _amountController.close();
    _debounce?.cancel();
  }

  void setRemarks(String remarks) {
    w2wTransfer = w2wTransfer.copyWith(remarks: remarks);
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

  updateSearchFilter(String? filterName, String? filterValue) {
    if (filterName == null || filterName.isEmpty || filterValue == null) {
      return;
    }

    if (filterValue.length > 2) {
      isSearchEnabled = true;
      inputSearch.add(true);
      _currentFilter = filterName;
      _filterSearchValue = filterValue;

      if (_screenIndex[currentSliderIndex]!.dataTypeIdentity ==
          DataTypeIdentity.transactions) {
        if (_debounce?.isActive ?? false) _debounce?.cancel();
        _debounce = Timer(const Duration(milliseconds: 500), () {
          _getTransactionData();
        });
      }
      if (_screenIndex[currentSliderIndex]!.dataTypeIdentity ==
          DataTypeIdentity.salesTransactions) {
        if (_debounce?.isActive ?? false) _debounce?.cancel();
        _debounce = Timer(const Duration(milliseconds: 500), () {
          _getSalesData();
        });
      }

      // _getBills(_screenIndex[currentSliderIndex]!.screenTypeIdentity);
    } else {
      _currentSearchPage = 0;
      isSearchEnabled = false;
      inputSearch.add(false);
      _currentFilter = null;
      _filterSearchValue = null;
      inputSearch.add(false);
      _salesSearchStreamController.sink.add([]);
      _transactionSearchStreamController.sink.add([]);
    }
  }

  getFromDate() {
    return _fromDate;
  }

  getToDate() {
    return _toDate;
  }

  updateDateFilters(String fromDate, String toDate) {
    _fromDate = fromDate;
    _toDate = toDate;
    _currentPage = 0;
    if (_screenIndex[currentSliderIndex]!.dataTypeIdentity ==
        DataTypeIdentity.transactions) {
      _getTransactionData();
    }
    if (_screenIndex[currentSliderIndex]!.dataTypeIdentity ==
        DataTypeIdentity.salesTransactions) {
      _getSalesData();
    }
  }

  void onScreenChange(int index) {
    inputSearch.add(false);
    isSearchEnabled = false;
    _currentFilter = null;
    _filterSearchValue = null;
    _currentPage = 0;
    _pageSize = 10;
    _currentSearchPage = 0;
    _fromDate = _dateOnFirstDayOfMonth;
    _toDate = _dateOnToday;
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
    if (_screenIndex[index]!.dataTypeIdentity ==
        DataTypeIdentity.salesTransactions) {
      _getSalesData();
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

  Sink get inputSearch => _searchController.sink;

  Sink get inputForSales => _salesStreamController.sink;

  Sink get inputForSalesSearch => _salesSearchStreamController.sink;

  Sink get inputForTransactionSearch => _transactionSearchStreamController.sink;

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

  Stream<List<Sale>> get outputForSales => _salesStreamController.stream;

  Stream<List<Sale>> get outputForSalesSearch =>
      _salesSearchStreamController.stream;

  Stream<List<Transaction>> get outputForTransactionSearch =>
      _transactionSearchStreamController.stream;

  Stream<bool> get outputSearch => _searchController.stream;

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
    var result = await _getTransactionsUsecase.execute(GetTransactionsRequest(
        isSearch: isSearchEnabled,
        screenTypeIdentity:
            _screenIndex[currentSliderIndex]!.screenTypeIdentity,
        searchFilter: _currentFilter,
        searchValue: _filterSearchValue,
        fromDate: _fromDate,
        toDate: _toDate,
        pageNumber: _currentPage,
        pageSize: _pageSize));
    result.fold((failure) {}, (transactions) {
      if (transactions.data[0].isSearch) {
        inputForTransactionSearch.add(transactions.data[0].transactions);
      } else {
        inputForTransaction.add(transactions.data[0].transactions);
      }
    });
  }

  void _getSalesData() async {
    var result = await _getSalesUsecase.execute(GetSalesRequest(
        isSearch: isSearchEnabled,
        screenTypeIdentity:
            _screenIndex[currentSliderIndex]!.screenTypeIdentity,
        searchFilter: _currentFilter,
        searchValue: _filterSearchValue,
        fromDate: _fromDate,
        toDate: _toDate,
        pageNumber: _currentPage,
        pageSize: _pageSize));
    result.fold((failure) {}, (sales) {
      if (sales.data[0].isSearch) {
        inputForSalesSearch.add(sales.data[0].sales);
      } else {
        inputForSales.add(sales.data[0].sales);
      }
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
        receiverId: receiverUserId,
        remarks: w2wTransfer.remarks));
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
