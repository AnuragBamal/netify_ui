import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/home_model.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/usecase/getdashboard_usecase.dart';
import 'package:netify/domain/usecase/getuser_usecase.dart';
import 'package:netify/domain/usecase/getuserlist_usecase.dart';
import 'package:netify/persentation/base/baseviewmodel.dart';
import 'package:netify/persentation/common/state_rendrer/state_rendrer.dart';
import 'package:netify/persentation/common/state_rendrer/state_rendrer_implementor.dart';
import 'package:rxdart/rxdart.dart';

class HomepageViewModel extends BaseViewModel
    implements HomepageViewModelInput, HomepageViewModelOutput {
  final StreamController _sliderDisplayObjectController =
      StreamController<SliderDisplayObject>.broadcast();

  // final StreamController _userDataTypeScreenController =
  //     StreamController<List<User>>.broadcast();
  final _resellerScreenController = BehaviorSubject<List<User>>();

  final StreamController _operatorScreenController =
      StreamController<List<User>>.broadcast();

  final StreamController _userSearchController =
      StreamController<List<User>>.broadcast();

  final StreamController _dashBoardController =
      StreamController<List<DashboardItem>>.broadcast();
  final StreamController _searchStateController =
      StreamController<bool>.broadcast();

  final GetUserUseCase _getUserUseCase;
  final GetUserListUsecase _getUserListUsecase;
  final GetDashboardUseCase _getDashboardUseCase;
  late final Map<int, MainPageModel> _screenIndex;
  final Map<String, String> searchFilterCurrentValues = {};
  String _currentFilter = "";
  String _filterSearchValue = "";

  int _currentDisplayIndex = 0;
  bool isSearchEnabled = false;

  HomepageViewModel(this._getUserUseCase, this._getUserListUsecase,
      this._getDashboardUseCase);

  @override
  void start() {
    inputState.add(
        LoadingState(stateRendrerType: StateRendrerType.popupLoadingState));
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

    super.dispose();
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

//----------------Private Methods----------------//

  void _getUserData() async {
    final Either<Failure, GetUser> result = await _getUserUseCase.execute();
    result.fold((failure) {
      inputState.add(ErrorState(
          stateRendrerType: StateRendrerType.popupErrorState,
          message: failure.message));
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
      inputState.add(ErrorState(
          stateRendrerType: StateRendrerType.popupErrorState,
          message: failure.message));
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

  void _getDashboardData(String screenTypeIdentity) async {
    GetDashboardRequest request;
    request = GetDashboardRequest(screenTypeIdentity: screenTypeIdentity);
    final Either<Failure, GetDashboardItemList> result =
        await _getDashboardUseCase.execute(request);
    result.fold((failure) {
      inputState.add(ErrorState(
          stateRendrerType: StateRendrerType.popupErrorState,
          message: failure.message));
    }, (success) {
      _intiallizeDashboardData(success.data);
    });
  }

  void _intiallizeDashboardData(List<DashboardItem> getDashboardItemList) {
    inputState.add(ContentState());
    inputForDashboard.add(getDashboardItemList);
  }

  void _intiallizeUserData(GetUserData getUserData) {
    _screenIndex = {};
    inputState.add(ContentState());
    for (var screen in getUserData.homeScreens) {
      _screenIndex[screen.index] = screen;
    }
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

class SliderDisplayObject {
  MainPageModel mainPageModel;
  int numberOfDisplays;
  int currentDisplayIndex;

  SliderDisplayObject(
      {required this.mainPageModel,
      required this.numberOfDisplays,
      required this.currentDisplayIndex});
}

// class LoginUserMetaData {
//   String firstname;
//   String lastName;
//   String userName;
//   String email;
//   String mobileNumber;
//   String companyName;
//   String brandName;
//   String role;
//   String userId;

//   String ownerUserName;
//   String walletId;
//   List<String> resellerList;
//   List<String> operatorList;

// }
