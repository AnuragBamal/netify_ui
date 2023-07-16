import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/enum_model.dart';
import 'package:netify/domain/model/home_model.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/usecase/getdashboard_usecase.dart';
import 'package:netify/domain/usecase/getsubscriber_usecase.dart';
import 'package:netify/domain/usecase/getsubscription_usecase.dart';
import 'package:netify/domain/usecase/getuser_usecase.dart';
import 'package:netify/domain/usecase/getuserlist_usecase.dart';
import 'package:netify/persentation/base/baseviewmodel.dart';
import 'package:netify/persentation/main/home/user/create_user.dart';
import 'package:netify/services/authentication_service.dart';
import 'package:netify/services/navigator_service.dart';
import 'package:netify/persentation/resources/routes_manager.dart';
import 'package:rxdart/rxdart.dart';

class HomepageViewModel extends BaseViewModelInputsOutputs
    implements HomepageViewModelInput, HomepageViewModelOutput {
  final StreamController _sliderDisplayObjectController =
      StreamController<SliderDisplayObject>.broadcast();

  // final StreamController _userDataTypeScreenController =
  //     StreamController<List<User>>.broadcast();
  final _resellerScreenController = BehaviorSubject<List<User>>();

  final _operatorScreenController = BehaviorSubject<List<User>>();

  final _subscriberScreenController = BehaviorSubject<List<Subscriber>>();

  final _subscriptionScreenController = BehaviorSubject<List<Subscription>>();

  final StreamController _userSearchController =
      StreamController<List<User>>.broadcast();

  final StreamController _subscriberSearchController =
      StreamController<List<Subscriber>>.broadcast();

  final StreamController _subscriptionSearchController =
      StreamController<List<Subscription>>.broadcast();

  final StreamController _dashBoardController =
      StreamController<List<DashboardItem>>.broadcast();
  final StreamController _searchStateController =
      StreamController<bool>.broadcast();

  final GetUserUseCase _getUserUseCase;
  final GetUserListUsecase _getUserListUsecase;
  final GetDashboardUseCase _getDashboardUseCase;
  final GetSubscriberUsecase _getSubscriberUsecase;
  final GetSubscriptionUsecase _getSubscriptionUsecase;
  late final Map<int, MainPageModel> _screenIndex;
  late final LoginUserMetaData _loginUserMetaData;
  final NavigationService _navigationService;
  final AuthenticationService _authenticationService;
  final Map<String, String> searchFilterCurrentValues = {};
  String _currentFilter = "";
  String _filterSearchValue = "";

  int _currentDisplayIndex = 0;
  bool isSearchEnabled = false;

  HomepageViewModel(
    this._getUserUseCase,
    this._getUserListUsecase,
    this._getDashboardUseCase,
    this._navigationService,
    this._authenticationService,
    this._getSubscriberUsecase,
    this._getSubscriptionUsecase,
  );

  @override
  void start() {
    _authenticationService.signInUser();
    _authenticationService.isUserSignedIn.listen((event) {
      if (event != null && event == false) {
        _navigationService.replaceRoute(Routes.loginRoute);
      }
    });
    _getUserData();
  }

  @override
  void dispose() {
    _sliderDisplayObjectController.close();
    _resellerScreenController.close();
    _operatorScreenController.close();
    _userSearchController.close();
    _dashBoardController.close();
    _searchStateController.close();
    _subscriberScreenController.close();
    _subscriptionScreenController.close();
    _subscriberSearchController.close();
    _subscriptionSearchController.close();
  }

  @override
  void onScreenChange(int index) {
    _currentDisplayIndex = index;
    searchFilterCurrentValues.clear();
    isSearchEnabled = false;
    inputForSearchState.add(false);
    _currentFilter = "";
    _filterSearchValue = "";
    if (_screenIndex[index]!.dataTypeIdentity == DataTypeIdentity.user) {
      _getUserListData(_screenIndex[index]!.screenTypeIdentity);
    }
    if (_screenIndex[index]!.dataTypeIdentity == DataTypeIdentity.dashboard) {
      _getDashboardData(_screenIndex[index]!.screenTypeIdentity);
    }
    if (_screenIndex[index]!.dataTypeIdentity == DataTypeIdentity.subscriber) {
      _getSubscriberListData(_screenIndex[index]!.screenTypeIdentity);
    }
    if (_screenIndex[index]!.dataTypeIdentity ==
        DataTypeIdentity.subscription) {
      _getSubscriptionListData(_screenIndex[index]!.screenTypeIdentity);
    }
    _postDataToView();
  }

  @override
  void updateSearchFilter(String? filterName, String? value) {
    if (filterName == null || filterName.isEmpty || value == null) {
      return;
    }
    searchFilterCurrentValues[_currentFilter] = value;
    if (value.length > 2) {
      isSearchEnabled = true;
      inputForSearchState.add(true);
      _filterSearchValue = value;
      _currentFilter = filterName;
      _getUserListData(
        _screenIndex[_currentDisplayIndex]!.screenTypeIdentity,
      );
    } else {
      isSearchEnabled = false;
      inputForSearchState.add(false);
      return;
    }
  }

  void updateSubscriberSearchFilter(String? filterName, String? value) {
    if (filterName == null || filterName.isEmpty || value == null) {
      return;
    }
    searchFilterCurrentValues[_currentFilter] = value;
    if (value.length > 2) {
      isSearchEnabled = true;
      inputForSearchState.add(true);
      _filterSearchValue = value;
      _currentFilter = filterName;
      _getSubscriberListData(
        _screenIndex[_currentDisplayIndex]!.screenTypeIdentity,
      );
    } else {
      isSearchEnabled = false;
      inputForSearchState.add(false);
      return;
    }
  }

  void updateSubscriptionSearchFilter(String? filterName, String? value) {
    if (filterName == null || filterName.isEmpty || value == null) {
      return;
    }
    searchFilterCurrentValues[_currentFilter] = value;
    if (value.length > 2) {
      isSearchEnabled = true;
      inputForSearchState.add(true);
      _filterSearchValue = value;
      _currentFilter = filterName;
      _getSubscriptionListData(
        _screenIndex[_currentDisplayIndex]!.screenTypeIdentity,
      );
    } else {
      isSearchEnabled = false;
      inputForSearchState.add(false);
      return;
    }
  }

  navigateToLogin() {
    // _navigationService.popUntil(Routes.homeRoute);
    _navigationService.replaceRoute(Routes.loginRoute);
  }

  navigateToCreateUser(CreateUserViewArguments args) {
    _navigationService.navigateTo(Routes.createuser, arguments: args);
  }

  navigateToCreateSubscriber() {
    _navigationService.navigateTo(Routes.createSubscriber);
  }

  navigateToCreateSubscription() {
    _navigationService.navigateTo(Routes.createSubscription);
  }

  @override
  Sink get inputSliderDisplayObject => _sliderDisplayObjectController.sink;

  @override
  Sink get inputForResellerTypeScreen => _resellerScreenController.sink;

  @override
  Sink get inputUserDataTypeSearch => _userSearchController.sink;

  @override
  Sink get inputForOperatorTypeScreen => _operatorScreenController.sink;

  @override
  Sink get inputForSearchState => _searchStateController.sink;

  Sink get inputForSubscriberTypeScreen => _subscriberScreenController.sink;

  Sink get inputForSubscriptionTypeScreen => _subscriptionScreenController.sink;

  Sink get inputSubscriberDataTypeSearch => _subscriberSearchController.sink;

  Sink get inputSubscriptionDataTypeSearch =>
      _subscriptionSearchController.sink;

  @override
  Stream<bool> get outputForSearchState =>
      _searchStateController.stream.map((searchState) => searchState);

  @override
  Stream<List<User>> get outputForOperatorTypeScreen =>
      _operatorScreenController.stream.map((operatorScreen) => operatorScreen);

  @override
  Stream<List<User>> get outputUserDataTypeSearch =>
      _userSearchController.stream.map((userSearch) => userSearch);

  @override
  Sink get inputForDashboard => _dashBoardController.sink;

  @override
  Stream<List<DashboardItem>> get outputForDashboard =>
      _dashBoardController.stream.map((dashboardItem) => dashboardItem);

  @override
  Stream<SliderDisplayObject> get outputSliderDisplayObject =>
      _sliderDisplayObjectController.stream
          .map((sliderDisplayObject) => sliderDisplayObject);

  @override
  Stream<List<User>> get outputForResellerTypeScreen =>
      _resellerScreenController.stream.map((resellerScreen) => resellerScreen);

  Stream<List<Subscriber>> get outputForSubscriberTypeScreen =>
      _subscriberScreenController.stream
          .map((subscriberScreen) => subscriberScreen);

  Stream<List<Subscription>> get outputForSubscriptionTypeScreen =>
      _subscriptionScreenController.stream
          .map((subscriptionScreen) => subscriptionScreen);

  Stream<List<Subscriber>> get outputSubscriberDataTypeSearch =>
      _subscriberSearchController.stream
          .map((subscriberSearch) => subscriberSearch);

  Stream<List<Subscription>> get outputSubscriptionDataTypeSearch =>
      _subscriptionSearchController.stream
          .map((subscriptionSearch) => subscriptionSearch);

//----------------Private Methods----------------//

  void _getUserData() async {
    final Either<Failure, GetUser> result = await _getUserUseCase.execute();
    result.fold((failure) {
      // TODO: Handle Error
    }, (success) {
      _intiallizeUserData(success.data[0]);
    });
  }

  void _getUserListData(String screenTypeIdentity) async {
    GetScreenRequest request;
    if (isSearchEnabled &&
        _currentFilter.isNotEmpty &&
        _filterSearchValue.isNotEmpty) {
      request = GetScreenRequest(
          isSearch: true,
          pageNumber: 0,
          pageSize: 10,
          screenTypeIdentity: screenTypeIdentity,
          searchFilter: _currentFilter,
          searchValue: _filterSearchValue);
    } else {
      request = GetScreenRequest(
          isSearch: false,
          pageNumber: 0,
          pageSize: 10,
          screenTypeIdentity: screenTypeIdentity);
    }
    final Either<Failure, GetUserList> result =
        await _getUserListUsecase.execute(request);
    result.fold((failure) {
      //TODO: Handle Error
    }, (success) {
      _handleSuccessUserListResponse(success.data[0]);
    });
  }

  _handleSuccessUserListResponse(UserListBlock getUserList) {
    if (getUserList.isSearch == true) {
      inputUserDataTypeSearch.add(getUserList.users);
    } else if (getUserList.screenTypeIdentity == ScreenTypeIdentity.reseller) {
      inputForResellerTypeScreen.add(getUserList.users);
    } else if (getUserList.screenTypeIdentity == ScreenTypeIdentity.operator) {
      inputForOperatorTypeScreen.add(getUserList.users);
    }
  }

  _getSubscriberListData(String screenTypeIdentity) async {
    GetScreenRequest request;
    if (isSearchEnabled &&
        _currentFilter.isNotEmpty &&
        _filterSearchValue.isNotEmpty) {
      request = GetScreenRequest(
          isSearch: true,
          pageNumber: 0,
          pageSize: 10,
          screenTypeIdentity: screenTypeIdentity,
          searchFilter: _currentFilter,
          searchValue: _filterSearchValue);
    } else {
      request = GetScreenRequest(
          isSearch: false,
          pageNumber: 0,
          pageSize: 10,
          screenTypeIdentity: screenTypeIdentity);
    }
    final Either<Failure, GetSubscriberListBlock> result =
        await _getSubscriberUsecase.execute(request);
    result.fold((failure) {
      //TODO: Handle Error
    }, (success) {
      _handleSuccessSubscriberListResponse(success.data[0]);
    });
  }

  _handleSuccessSubscriberListResponse(SubscriberListBlock getSubscriberList) {
    if (getSubscriberList.isSearch == true) {
      inputSubscriberDataTypeSearch.add(getSubscriberList.subscribers);
    } else {
      inputForSubscriberTypeScreen.add(getSubscriberList.subscribers);
    }
  }

  _getSubscriptionListData(String screenTypeIdentity) async {
    GetScreenRequest request;
    if (isSearchEnabled &&
        _currentFilter.isNotEmpty &&
        _filterSearchValue.isNotEmpty) {
      request = GetScreenRequest(
          isSearch: true,
          pageNumber: 0,
          pageSize: 10,
          screenTypeIdentity: screenTypeIdentity,
          searchFilter: _currentFilter,
          searchValue: _filterSearchValue);
    } else {
      request = GetScreenRequest(
          isSearch: false,
          pageNumber: 0,
          pageSize: 10,
          screenTypeIdentity: screenTypeIdentity);
    }
    final Either<Failure, GetSubscriptionListBlock> result =
        await _getSubscriptionUsecase.execute(request);
    result.fold((failure) {
      //TODO: Handle Error
    }, (success) {
      _handleSuccessSubscriptionListResponse(success.data[0]);
    });
  }

  _handleSuccessSubscriptionListResponse(
      SubscriptionListBlock getSubscriptionList) {
    if (getSubscriptionList.isSearch == true) {
      inputSubscriptionDataTypeSearch.add(getSubscriptionList.subscriptions);
    } else {
      inputForSubscriptionTypeScreen.add(getSubscriptionList.subscriptions);
    }
  }

  void _getDashboardData(String screenTypeIdentity) async {
    GetDashboardRequest request;
    request = GetDashboardRequest(screenTypeIdentity: screenTypeIdentity);
    final Either<Failure, GetDashboardItemList> result =
        await _getDashboardUseCase.execute(request);
    result.fold((failure) {
      //TODO: Handle Error
    }, (success) {
      _intiallizeDashboardData(success.data);
    });
  }

  void _intiallizeDashboardData(List<DashboardItem> getDashboardItemList) {
    inputForDashboard.add(getDashboardItemList);
  }

  void _intiallizeUserData(GetUserData getUserData) {
    _screenIndex = {};
    for (var screen in getUserData.homeScreens) {
      _screenIndex[screen.index] = screen;
    }
    _loginUserMetaData = LoginUserMetaData.fromGetUserData(getUserData);
    onScreenChange(_currentDisplayIndex);
  }

  void _postDataToView() {
    inputSliderDisplayObject.add(SliderDisplayObject(
        mainPageModel: _screenIndex[_currentDisplayIndex]!,
        numberOfDisplays: _screenIndex.length,
        currentDisplayIndex: _currentDisplayIndex));
  }
}

abstract class HomepageViewModelInput {
  void updateSearchFilter(String filterName, String value);
  void onScreenChange(int index);

  Sink get inputSliderDisplayObject;
  Sink get inputForResellerTypeScreen;
  Sink get inputForOperatorTypeScreen;
  Sink get inputUserDataTypeSearch;
  Sink get inputForDashboard;
  Sink get inputForSearchState;
}

abstract class HomepageViewModelOutput {
  Stream<SliderDisplayObject> get outputSliderDisplayObject;
  Stream<List<User>> get outputForResellerTypeScreen;
  Stream<List<User>> get outputForOperatorTypeScreen;
  Stream<List<User>> get outputUserDataTypeSearch;
  Stream<List<DashboardItem>> get outputForDashboard;
  Stream<bool> get outputForSearchState;
}

class LoginUserMetaData {
  String firstName;
  String lastName;
  String userName;
  String email;
  String mobileNumber;
  String companyName;
  String brandName;
  String role;
  String userId;

  String ownerUserName;
  String walletId;
  List<String> resellerList;
  List<String> operatorList;
  Map<String, List<String>> resellerOperatorMap;

  LoginUserMetaData(
      {required this.firstName,
      required this.lastName,
      required this.userName,
      required this.email,
      required this.mobileNumber,
      required this.companyName,
      required this.brandName,
      required this.role,
      required this.userId,
      required this.ownerUserName,
      required this.walletId,
      required this.resellerList,
      required this.operatorList,
      required this.resellerOperatorMap});

  factory LoginUserMetaData.fromJson(Map<String, dynamic> json) {
    return LoginUserMetaData(
        firstName: json['firstname'],
        lastName: json['lastName'],
        userName: json['userName'],
        email: json['email'],
        mobileNumber: json['mobileNumber'],
        companyName: json['companyName'],
        brandName: json['brandName'],
        role: json['role'],
        userId: json['userId'],
        ownerUserName: json['ownerUserName'],
        walletId: json['walletId'],
        resellerList: json['resellerList'].cast<String>(),
        operatorList: json['operatorList'].cast<String>(),
        resellerOperatorMap: json['resellerOperatorMap']);
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstname'] = firstName;
    data['lastName'] = lastName;
    data['userName'] = userName;
    data['email'] = email;
    data['mobileNumber'] = mobileNumber;
    data['companyName'] = companyName;
    data['brandName'] = brandName;
    data['role'] = role;
    data['userId'] = userId;
    data['ownerUserName'] = ownerUserName;
    data['walletId'] = walletId;
    data['resellerList'] = resellerList;
    data['operatorList'] = operatorList;
    data['resellerOperatorMap'] = resellerOperatorMap;
    return data;
  }

  factory LoginUserMetaData.fromGetUserData(GetUserData getUserData) {
    return LoginUserMetaData(
        firstName: getUserData.firstName,
        lastName: getUserData.lastName,
        userName: getUserData.userName,
        email: getUserData.email,
        mobileNumber: getUserData.mobileNumber,
        companyName: getUserData.companyName,
        brandName: getUserData.brandName,
        role: getUserData.role,
        userId: getUserData.userId,
        ownerUserName: getUserData.ownerUserName,
        walletId: getUserData.walletId,
        resellerList: getUserData.resellerList,
        operatorList: getUserData.operatorList,
        resellerOperatorMap: getUserData.resellerOperatorMap);
  }
}
