import 'dart:async';

import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/enum_model.dart';
import 'package:netify/domain/model/home_model.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/model/plan_model.dart';
import 'package:netify/domain/usecase/getdashboard_usecase.dart';
import 'package:netify/domain/usecase/getoperator_pricechart_usecase.dart';
import 'package:netify/domain/usecase/getplanprofile_usecase.dart';
import 'package:netify/domain/usecase/getplans_usecase.dart';
import 'package:netify/domain/usecase/getreseller_pricechart_usecase.dart';
import 'package:netify/persentation/base/baseviewmodel.dart';
import 'package:netify/persentation/main/plans/price_chart/create_price_chart.dart';
import 'package:netify/persentation/resources/routes_manager.dart';
import 'package:netify/services/navigator_service.dart';
import 'package:rxdart/rxdart.dart';

class PlansPageViewModel extends BaseViewModelInputsOutputs
    implements PlansViewModelInput, PlansViewModelOutput {
  final StreamController _dashboardController =
      StreamController<List<DashboardItem>>.broadcast();
  final StreamController _sliderDisplayObjectController =
      StreamController<SliderDisplayObject>.broadcast();
  final _operatorPriceChartController =
      BehaviorSubject<List<OperatorPriceChart>>();
  final _operatorPriceSearchChartController =
      BehaviorSubject<List<OperatorPriceChart>>();
  final _plansController = BehaviorSubject<List<Plans>>();
  final _plansSearchController = BehaviorSubject<List<Plans>>();
  final _resellerPriceChartController =
      BehaviorSubject<List<ResellerPriceChart>>();
  final _resellerPriceSearchChartController =
      BehaviorSubject<List<ResellerPriceChart>>();

  final _searchController = BehaviorSubject<bool>.seeded(false);

  final GetOperatorPriceChartUseCase _getOperatorPriceChartUseCase;
  final GetPlansUsecase _getPlansUsecase;
  final GetResellerPriceChartUseCase _getResellerPriceChartUseCase;
  final GetDashboardUseCase _getDashboardUseCase;
  final GetPlanProfileUseCase _getPlanProfileUseCase;
  final NavigationService _navigationService;
  late final Map<int, MainPageModel> _screenIndex;
  String loggedInUserRole = "";

  PlansPageViewModel(
      this._getOperatorPriceChartUseCase,
      this._getPlansUsecase,
      this._getResellerPriceChartUseCase,
      this._getPlanProfileUseCase,
      this._navigationService,
      this._getDashboardUseCase);

  int _currentSliderIndex = 0;

  @override
  void start() {
    _getPlansMetaData();
  }

  void planScreenSearch(String? filterName, String? value) {
    if (value!.length < 3 || value.isEmpty) {
      List<Plans> plans = [];
      inputSearch.add(false);
      _plansSearchController.sink.add(plans);
      return;
    }
    if (filterName != null && value.isNotEmpty) {
      List<Plans> plans = [];
      for (var element in _plansController.value) {
        if (element.planName == value) {
          plans.add(element);
        }
      }
      inputSearch.add(true);
      _plansSearchController.sink.add(plans);
    } else {
      List<Plans> plans = [];
      inputSearch.add(false);
      _plansSearchController.sink.add(plans);
    }
  }

  void resellerPriceScreenSearch(String? filterName, String? value) {
    if (value!.length < 3 || value.isEmpty) {
      List<ResellerPriceChart> resellerPC = [];
      inputSearch.add(false);
      _resellerPriceSearchChartController.sink.add(resellerPC);
      return;
    }
    if (filterName != null && value.isNotEmpty) {
      List<ResellerPriceChart> resellerPC = [];
      for (var element in _resellerPriceChartController.value) {
        if (filterName == "Plan") {
          if (element.planName == value) {
            resellerPC.add(element);
          }
        } else if (filterName == "Reseller") {
          if (element.resellerUserName == value) {
            resellerPC.add(element);
          }
        }
      }
      inputSearch.add(true);
      _resellerPriceSearchChartController.sink.add(resellerPC);
    } else {
      List<ResellerPriceChart> resellerPC = [];
      inputSearch.add(false);
      _resellerPriceSearchChartController.sink.add(resellerPC);
    }
  }

  void operatorPriceScreenSearch(String? filterName, String? value) {
    if (value!.length < 3 || value.isEmpty) {
      List<OperatorPriceChart> operatorPC = [];
      inputSearch.add(false);
      _operatorPriceSearchChartController.sink.add(operatorPC);
      return;
    }
    if (filterName != null && value.isNotEmpty) {
      List<OperatorPriceChart> operatorPC = [];
      for (var element in _operatorPriceChartController.value) {
        if (filterName == "Plan") {
          if (element.planName == value) {
            operatorPC.add(element);
          }
        } else if (filterName == "Operator") {
          if (element.operatorUserName == value) {
            operatorPC.add(element);
          }
        } else if (filterName == "Reseller") {
          if (element.resellerUserName == value) {
            operatorPC.add(element);
          }
        }
      }
      inputSearch.add(true);
      _operatorPriceSearchChartController.sink.add(operatorPC);
    } else {
      List<OperatorPriceChart> operatorPC = [];
      inputSearch.add(false);
      _operatorPriceSearchChartController.sink.add(operatorPC);
    }
  }

  @override
  void dispose() {
    _dashboardController.close();
    _sliderDisplayObjectController.close();
    _operatorPriceChartController.close();
    _plansController.close();
    _resellerPriceChartController.close();
    _searchController.close();
    _operatorPriceSearchChartController.close();
    _plansSearchController.close();
    _resellerPriceSearchChartController.close();
  }

  @override
  void onScreenChange(int index) {
    inputSearch.add(false);
    _currentSliderIndex = index;
    if (_screenIndex[_currentSliderIndex]!.dataTypeIdentity ==
        DataTypeIdentity.dashboard) {
      _getDashboardData(_screenIndex[_currentSliderIndex]!.screenTypeIdentity);
    }
    if (_screenIndex[_currentSliderIndex]!.dataTypeIdentity ==
        DataTypeIdentity.operatorPriceChart) {
      _getOperatorPriceChartData(
          _screenIndex[_currentSliderIndex]!.screenTypeIdentity);
    }
    if (_screenIndex[_currentSliderIndex]!.dataTypeIdentity ==
        DataTypeIdentity.resellerPriceChart) {
      _getResellerPriceChartData(
          _screenIndex[_currentSliderIndex]!.screenTypeIdentity);
    }
    if (_screenIndex[_currentSliderIndex]!.dataTypeIdentity ==
        DataTypeIdentity.plan) {
      _getPlansData(_screenIndex[_currentSliderIndex]!.screenTypeIdentity);
    }
    _postDataToView();
  }

  navigateToCreatePriceChart(CreatePriceChartArguments args) {
    _navigationService
        .navigateTo(Routes.createpricechart, arguments: args)
        .then((value) {
      if (_screenIndex[_currentSliderIndex]!.dataTypeIdentity ==
          DataTypeIdentity.operatorPriceChart) {
        _getOperatorPriceChartData(
            _screenIndex[_currentSliderIndex]!.screenTypeIdentity);
      }
      if (_screenIndex[_currentSliderIndex]!.dataTypeIdentity ==
          DataTypeIdentity.resellerPriceChart) {
        _getResellerPriceChartData(
            _screenIndex[_currentSliderIndex]!.screenTypeIdentity);
      }
    });
  }

  navigateToCreatePlan() {
    _navigationService.navigateTo(Routes.createPlan).then((value) {
      if (_screenIndex[_currentSliderIndex]!.dataTypeIdentity ==
          DataTypeIdentity.plan) {
        _getPlansData(_screenIndex[_currentSliderIndex]!.screenTypeIdentity);
      }
    });
  }

  @override
  Sink get inputForDashboard => _dashboardController.sink;

  @override
  Sink get inputForOpearatorChartScreen => _operatorPriceChartController.sink;

  @override
  Sink get inputForPlanChartScreen => _plansController.sink;

  @override
  Sink get inputForResellerChartScreen => _resellerPriceChartController.sink;

  @override
  Sink get inputSliderDisplayObject => _sliderDisplayObjectController.sink;

  Sink get inputSearch => _searchController.sink;

  Sink get inputForPlanSearchScreen => _plansSearchController.sink;

  Sink get inputForOperatorPriceSearchScreen =>
      _operatorPriceSearchChartController.sink;

  Sink get inputForResellerPriceSearchScreen =>
      _resellerPriceSearchChartController.sink;

  Stream<List<Plans>> get outputForPlanSearchScreen =>
      _plansSearchController.stream.map((plans) => plans);

  Stream<List<OperatorPriceChart>> get outputForOperatorPriceSearchScreen =>
      _operatorPriceSearchChartController.stream
          .map((operatorPriceChart) => operatorPriceChart);

  Stream<List<ResellerPriceChart>> get outputForResellerPriceSearchScreen =>
      _resellerPriceSearchChartController.stream
          .map((resellerPriceChart) => resellerPriceChart);

  Stream<bool> get outputSearch =>
      _searchController.stream.map((event) => event);

  @override
  Stream<List<DashboardItem>> get outputForDashboard =>
      _dashboardController.stream.map((dashboard) => dashboard);

  @override
  Stream<List<OperatorPriceChart>> get outputForOperatorPriceChartScreen =>
      _operatorPriceChartController.stream;

  @override
  Stream<List<Plans>> get outputForPlansChartsScreen => _plansController.stream;

  @override
  Stream<List<ResellerPriceChart>> get outputForResellerPriceChartScreen =>
      _resellerPriceChartController.stream;

  @override
  Stream<SliderDisplayObject> get outputSliderDisplayObject =>
      _sliderDisplayObjectController.stream
          .map((sliderDisplayObject) => sliderDisplayObject);

  ///////////Private Methods////////////
  _getDashboardData(String screenTypeIdentity) async {
    var result = await _getDashboardUseCase
        .execute(GetDashboardRequest(screenTypeIdentity: screenTypeIdentity));
    result.fold((failure) {
      //TODO: Handle Failure
    }, (dashboard) {
      inputForDashboard.add(dashboard.data);
    });
  }

  _getPlansData(String screenTypeIdentity) async {
    var result = await _getPlansUsecase.execute();
    result.fold((failure) {
      //TODO: Handle Failure
    }, (plans) {
      inputForPlanChartScreen.add(plans.data);
    });
  }

  _getOperatorPriceChartData(String screenTypeIdentity) async {
    var result = await _getOperatorPriceChartUseCase.execute();
    result.fold((failure) {
      //TODO: Handle Failure
    }, (operatorPriceChart) {
      inputForOpearatorChartScreen.add(operatorPriceChart.data);
    });
  }

  _getResellerPriceChartData(String screenTypeIdentity) async {
    var result = await _getResellerPriceChartUseCase.execute();
    result.fold((failure) {
      //TODO: Handle Failure
    }, (resellerPriceChart) {
      inputForResellerChartScreen.add(resellerPriceChart.data);
    });
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
    _screenIndex = {};
    for (var screen in planProfile.planScreens) {
      _screenIndex[screen.index] = screen;
    }
    loggedInUserRole = planProfile.role;
    onScreenChange(_currentSliderIndex);
  }

  _postDataToView() {
    inputSliderDisplayObject.add(SliderDisplayObject(
        mainPageModel: _screenIndex[_currentSliderIndex]!,
        numberOfDisplays: _screenIndex.length,
        currentDisplayIndex: _currentSliderIndex));
  }
}

abstract class PlansViewModelInput {
  void onScreenChange(int index);

  Sink get inputSliderDisplayObject;
  Sink get inputForPlanChartScreen;
  Sink get inputForOpearatorChartScreen;
  Sink get inputForResellerChartScreen;
  Sink get inputForDashboard;
}

abstract class PlansViewModelOutput {
  Stream<SliderDisplayObject> get outputSliderDisplayObject;
  Stream<List<Plans?>> get outputForPlansChartsScreen;
  Stream<List<OperatorPriceChart?>> get outputForOperatorPriceChartScreen;
  Stream<List<ResellerPriceChart?>> get outputForResellerPriceChartScreen;
  Stream<List<DashboardItem>> get outputForDashboard;
}
