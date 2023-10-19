import 'dart:async';

import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/billing_model.dart';
import 'package:netify/domain/model/enum_model.dart';
import 'package:netify/domain/model/home_model.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/usecase/create_bill_usecase.dart';
import 'package:netify/domain/usecase/get_billing_metadata_usecase.dart';
import 'package:netify/domain/usecase/get_bills_usecase.dart';
import 'package:netify/domain/usecase/get_renewals_usecase.dart';
import 'package:netify/domain/usecase/getdashboard_usecase.dart';
import 'package:netify/persentation/base/baseviewmodel.dart';
import 'package:netify/persentation/common/freezed_data_classes.dart';
import 'package:rxdart/rxdart.dart';

class BillingPageViewModel extends BaseViewModelInputsOutputs {
  final StreamController _dashboardController =
      StreamController<List<DashboardItem>>.broadcast();
  final StreamController _sliderDisplayObjectController =
      StreamController<SliderDisplayObject>.broadcast();

  final _resellerController = BehaviorSubject<List<String>>();
  final _operatorController = StreamController<List<String>?>.broadcast();
  final _subscriberController =
      StreamController<List<OperatorSubscriberMap>?>.broadcast();
  final _subscriptionController =
      StreamController<List<SubscriptionSubscriberMap>?>.broadcast();
  final _selectedSubscriptionController =
      StreamController<SubscriptionSubscriberMap?>.broadcast();

  final _upcomingRenewalsController = BehaviorSubject<List<UpcomingRenewals>>();

  final _upcomingRenewalsSearchController =
      BehaviorSubject<List<UpcomingRenewals>>();

  final _billsController = BehaviorSubject<List<Bills>>();

  final _billsSearchController = BehaviorSubject<List<Bills>>();

  final _unpaidBillsController = BehaviorSubject<List<Bills>>();

  final _isBillerDetailsValidController = BehaviorSubject<bool>();

  final _searchController = BehaviorSubject<bool>.seeded(false);

  final GetDashboardUseCase _getDashboardUseCase;
  final GetBillingProfileMetadataUseCase _getBillingProfileMetadataUseCase;
  final GetRenewalsUsecase _getRenewalsUsecase;
  final GetBillsUsecase _getBillsUsecase;
  final CreateBillsUseCase _createBillsUseCase;

  late final Map<int, MainPageModel> _screenIndex;
  late final Map<String, List<String>> _resellerOperatorMap;
  late final Map<String, List<OperatorSubscriberMap>> _operatorSubscriberMap;
  late final Map<String, List<SubscriptionSubscriberMap>>
      _subscriberSubscriptionMap;
  var billerData = BillerData("", "", "", "");
  String? _currentFilter;
  String? _filterSearchValue;
  int _currentPage = 0;
  int _pageSize = 10;
  bool _isSearchEnabled = false;
  final DateTime firstDayOfMonth =
      DateTime(DateTime.now().year, DateTime.now().month, 1);
  late final String _dateOnFirstDayOfMonth;
  final String _dateOnToday = DateFormat('dd-MM-yyyy').format(DateTime.now());
  String _fromDate = "";
  String _toDate = DateFormat('dd-MM-yyyy').format(DateTime.now());
  String? selectedSubscriber;

  BillingPageViewModel(
    this._getDashboardUseCase,
    this._getBillingProfileMetadataUseCase,
    this._getRenewalsUsecase,
    this._getBillsUsecase,
    this._createBillsUseCase,
  );
  int currentSliderIndex = 0;
  bool isSearchEnabled = false;

  @override
  void start() {
    _dateOnFirstDayOfMonth = DateFormat('dd-MM-yyyy').format(firstDayOfMonth);
    _fromDate = _dateOnFirstDayOfMonth;

    _isBillerDetailsValidController.sink.add(false);
    _getBillingProfileMetadata();
  }

  @override
  void dispose() {
    _dashboardController.close();
    _sliderDisplayObjectController.close();
    _resellerController.close();
    _operatorController.close();
    _subscriberController.close();
    _subscriptionController.close();
    _selectedSubscriptionController.close();
    _upcomingRenewalsController.close();
    _upcomingRenewalsSearchController.close();
    _billsController.close();
    _billsSearchController.close();
    _unpaidBillsController.close();
    _isBillerDetailsValidController.close();
    _searchController.close();
  }

  void setReseller(String reseller) {
    _operatorController.sink.add(_resellerOperatorMap[reseller]);
    if (_resellerOperatorMap[reseller]!.isNotEmpty) {
      _isBillerDetailsValidController.sink.add(true);
    }

    _subscriberController.sink.add(null);
    _subscriptionController.sink.add(null);
    _selectedSubscriptionController.sink.add(null);
    billerData = billerData.copyWith(
        resellerUserName: reseller,
        operatorUserName: "",
        subscriberId: "",
        subscriptionId: "");
  }

  void setOperator(String operator) {
    _subscriberController.sink.add(_operatorSubscriberMap[operator]);
    _subscriptionController.sink.add(null);
    _selectedSubscriptionController.sink.add(null);
    billerData = billerData.copyWith(
        operatorUserName: operator, subscriberId: "", subscriptionId: "");
  }

  void setSubscriber(String subscriber) {
    selectedSubscriber = subscriber;
    _subscriptionController.sink.add(_subscriberSubscriptionMap[subscriber]);
    _selectedSubscriptionController.sink.add(null);
    billerData =
        billerData.copyWith(subscriberId: subscriber, subscriptionId: "");
  }

  void setSubscription(String subscription) {
    _selectedSubscriptionController.sink.add(
        _subscriberSubscriptionMap[selectedSubscriber]!
            .firstWhere((element) => element.subscriptionId == subscription));
    billerData = billerData.copyWith(subscriptionId: subscription);
  }

  void billerSubmit(BuildContext context) {
    _createBills(
        context,
        billerData.resellerUserName,
        billerData.operatorUserName,
        billerData.subscriberId,
        billerData.subscriptionId);
  }

  void updateDateFilters(String fromDate, String toDate) {
    _fromDate = fromDate;
    _toDate = toDate;
    _getBills(_screenIndex[currentSliderIndex]!.screenTypeIdentity);
  }

  void onScreenChange(int index) {
    inputSearch.add(false);
    isSearchEnabled = false;
    _currentFilter = null;
    _filterSearchValue = null;
    _currentPage = 0;
    _pageSize = 10;
    _fromDate = _dateOnFirstDayOfMonth;
    _toDate = _dateOnToday;
    currentSliderIndex = index;
    if (_screenIndex[index]!.dataTypeIdentity == DataTypeIdentity.dashboard) {
      _getDashboardData(_screenIndex[index]!.screenTypeIdentity);
    } else if (_screenIndex[index]!.dataTypeIdentity ==
        DataTypeIdentity.renewals) {
      _getUpcomingRenewals(10);
    } else if (_screenIndex[index]!.dataTypeIdentity ==
        DataTypeIdentity.bills) {
      _getBills(_screenIndex[index]!.screenTypeIdentity);
    }

    _postDataToView();
  }

  Sink get inputForDashboard => _dashboardController.sink;

  Sink get inputForSliderDisplayObject => _sliderDisplayObjectController.sink;

  Sink get inputSearch => _searchController.sink;

  Stream<List<DashboardItem>> get outputForDashborad =>
      _dashboardController.stream.map((dashboard) => dashboard);

  Stream<SliderDisplayObject> get outputForSliderDisplayObject =>
      _sliderDisplayObjectController.stream
          .map((sliderDisplayObject) => sliderDisplayObject);
  Stream<List<String>> get outputResellerList => _resellerController.stream;

  Stream<List<String>?> get outputOperatorList => _operatorController.stream;

  Stream<List<OperatorSubscriberMap>?> get outputSubscriberList =>
      _subscriberController.stream;

  Stream<List<SubscriptionSubscriberMap>?> get outputSubscriptionList =>
      _subscriptionController.stream;

  Stream<SubscriptionSubscriberMap?> get outputSelectedSubscription =>
      _selectedSubscriptionController.stream;

  Stream<bool> get outputIsBillerDetailsValid =>
      _isBillerDetailsValidController.stream;

  Stream<List<UpcomingRenewals>> get outputUpcomingRenewals =>
      _upcomingRenewalsController.stream;

  Stream<List<Bills>> get outputBills => _billsController.stream;

  Stream<List<Bills>> get outputUnpaidBills => _unpaidBillsController.stream;

  Stream<bool> get outputSearch => _searchController.stream;

  Stream<List<UpcomingRenewals>> get outputUpcomingRenewalsSearch =>
      _upcomingRenewalsSearchController.stream;

  Stream<List<Bills>> get outputBillsSearch => _billsSearchController.stream;

  _getBillingProfileMetadata() async {
    var result = await _getBillingProfileMetadataUseCase.execute();
    result.fold((failure) {}, (billingProfileMeta) {
      //_screenIndex = {};
      _screenIndex = billingProfileMeta.data[0].billingScreens.asMap();
      _operatorSubscriberMap = billingProfileMeta.data[0].operatorSubscriberMap;
      _subscriberSubscriptionMap =
          billingProfileMeta.data[0].subscriberSubscriptionMap;
      _resellerOperatorMap = billingProfileMeta.data[0].resellerOperatorMap;
      _resellerController.sink.add(_resellerOperatorMap.keys.toList());
      onScreenChange(currentSliderIndex);
    });
  }

  _getUpcomingRenewals(int days) async {
    GetRenewalsRequest getRenewalsRequest = GetRenewalsRequest();
    getRenewalsRequest.days = days;
    var result = await _getRenewalsUsecase.execute(getRenewalsRequest);
    result.fold((failure) {
      //TODO: Handle Failure
    }, (renewals) {
      _upcomingRenewalsController.sink.add(renewals.data);
    });
  }

  _getBills(
    String screenTypeIdentity,
  ) async {
    String? fName;
    String? fValue;
    if (_currentFilter != null &&
        _filterSearchValue != null &&
        isSearchEnabled &&
        _filterSearchValue!.isNotEmpty &&
        _currentFilter!.isNotEmpty) {
      fName = _currentFilter;
      fValue = _filterSearchValue;
    }

    GetBillRequest getBillRequest = GetBillRequest(
        isSearch: isSearchEnabled,
        screenTypeIdentity: screenTypeIdentity,
        pageNumber: _currentPage,
        pageSize: _pageSize,
        searchFilter: fName,
        searchValue: fValue,
        fromDate: _fromDate,
        toDate: _toDate);

    // if (fromDate != null) {
    //   getBillRequest.fromDate = fromDate;
    // }
    // if (toDate != null) {
    //   getBillRequest.toDate = toDate;
    // }
    var result = await _getBillsUsecase.execute(getBillRequest);
    result.fold((failure) {
      //TODO: Handle Failure
    }, (bills) {
      if (bills.data[0].isSearch) {
        _billsSearchController.sink.add(bills.data[0].bills);
      } else if (bills.data[0].screenTypeIdentity ==
          ScreenTypeIdentity.unpaidBills) {
        _unpaidBillsController.sink.add(bills.data[0].bills);
      } else if (bills.data[0].screenTypeIdentity == ScreenTypeIdentity.bills) {
        _billsController.sink.add(bills.data[0].bills);
      }
    });
  }

  _createBills(BuildContext context, resellerUserName, String operatorId,
      String subscriberId, String subscriptionId) async {
    GenerateBillRequest generateBillRequest = GenerateBillRequest(
        resellerUserName: resellerUserName,
        operatorId: operatorId,
        subscriberId: subscriberId,
        subscriptionId: subscriptionId);

    var result = await _createBillsUseCase.execute(generateBillRequest);
    result.fold((failure) {
      //TODO: Handle Failure
    }, (success) {
      //TODO: Handle Success
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
