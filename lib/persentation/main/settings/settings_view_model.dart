import 'dart:async';

import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/enum_model.dart';
import 'package:netify/domain/model/home_model.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/model/settings_model.dart';
import 'package:netify/domain/usecase/create_newservicesubscription_usecase.dart';
import 'package:netify/domain/usecase/get_nasinfo_usecase.dart';
import 'package:netify/domain/usecase/get_serviceinfo_usecase.dart';
import 'package:netify/domain/usecase/get_settings_metadata_usecase.dart';
import 'package:netify/domain/usecase/getdashboard_usecase.dart';
import 'package:netify/persentation/base/baseviewmodel.dart';
import 'package:netify/persentation/resources/routes_manager.dart';
import 'package:netify/services/navigator_service.dart';
import 'package:rxdart/rxdart.dart';

class SettingsPageViewModel extends BaseViewModelInputsOutputs {
  final StreamController _dashboardController =
      StreamController<List<DashboardItem>>.broadcast();
  final StreamController _sliderDisplayObjectController =
      StreamController<SliderDisplayObject>.broadcast();
  final servicesStreamController = BehaviorSubject<List<Service>>();
  final subscribedServicesStreamController =
      BehaviorSubject<List<SubscribedService>>();
  final nasStreamController = BehaviorSubject<List<Nas>>();

  final GetDashboardUseCase _getDashboardUseCase;
  final GetSettingsProfileMetadataUseCase _getSettingsProfileMetadataUseCase;
  final GetServiceInfoUseCase _getServiceInfoUseCase;
  final GetNasInfoUseCase _getNasInfoUseCase;
  final ServiceSubscriptionUseCase _serviceSubscriptionUseCase;
  final NavigationService _navigationService;
  late final Map<int, MainPageModel> _screenIndex;
  late final List<String> supportedNasType;
  String _currentFilter = "";
  String _filterSearchValue = "";
  late final String _tenantId;

  int currentSliderIndex = 0;
  bool isSearchEnabled = false;

  SettingsPageViewModel(
    this._getDashboardUseCase,
    this._getSettingsProfileMetadataUseCase,
    this._getServiceInfoUseCase,
    this._getNasInfoUseCase,
    this._serviceSubscriptionUseCase,
    this._navigationService,
  );

  @override
  void start() {
    _getSettingsPageMetadata();
  }

  @override
  void dispose() {
    _dashboardController.close();
    _sliderDisplayObjectController.close();
    servicesStreamController.close();
    subscribedServicesStreamController.close();
    nasStreamController.close();
  }

  void onScreenChange(int index) {
    // inputSearch.add(false);
    currentSliderIndex = index;
    if (_screenIndex[index]!.dataTypeIdentity == DataTypeIdentity.dashboard) {
      _getDashboardData(_screenIndex[index]!.screenTypeIdentity);
    }
    if (_screenIndex[index]!.dataTypeIdentity ==
        DataTypeIdentity.serviceSubscriptions) {
      _getServiceData();
    }
    if (_screenIndex[index]!.dataTypeIdentity == DataTypeIdentity.nasEntries) {
      _getNasData();
    }

    _postDataToView();
  }

  void subscribeService(String serviceId, String serviceType) {
    _newServiceSubscrption(serviceId, serviceType);
  }

  void navigateToAddNewNas() {
    var onReturn = _navigationService.navigateTo(Routes.createNas,
        arguments: supportedNasType);
    onReturn.then((value) {
      _getNasData();
    });
  }

  Sink get inputForDashboard => _dashboardController.sink;

  Sink get inputForSliderDisplayObject => _sliderDisplayObjectController.sink;

  Sink get inputForServices => servicesStreamController.sink;

  Sink get inputForSubscribedServices =>
      subscribedServicesStreamController.sink;

  Sink get inputForNas => nasStreamController.sink;

  Stream<List<DashboardItem>> get outputForDashborad =>
      _dashboardController.stream.map((dashboard) => dashboard);

  Stream<SliderDisplayObject> get outputForSliderDisplayObject =>
      _sliderDisplayObjectController.stream
          .map((sliderDisplayObject) => sliderDisplayObject);

  Stream<List<Service?>>? get outputForServices =>
      servicesStreamController.stream;

  Stream<List<SubscribedService?>>? get outputForSubscribedServices =>
      subscribedServicesStreamController.stream;

  Stream<List<Nas?>>? get outputForNas =>
      nasStreamController.stream.map((nas) => nas);

  _getSettingsPageMetadata() async {
    var result = await _getSettingsProfileMetadataUseCase.execute();
    result.fold((failure) {
      //TODO: Handle Failure
    }, (settingsProfileMeta) {
      //_screenIndex = {};
      _screenIndex = settingsProfileMeta.data[0].settingScreens.asMap();
      _tenantId = settingsProfileMeta.data[0].tenantId;
      supportedNasType = settingsProfileMeta.data[0].supportedNasType;
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

  _getServiceData() async {
    var result = await _getServiceInfoUseCase.execute();
    result.fold((failure) {
      //TODO: Handle Failure
    }, (servicesInfo) {
      inputForServices.add(servicesInfo.data[0].services);
      inputForSubscribedServices.add(servicesInfo.data[0].subscribedServices);
    });
  }

  _getNasData() async {
    var result = await _getNasInfoUseCase.execute();
    result.fold((failure) {
      //TODO: Handle Failure
    }, (nasInfo) {
      inputForNas.add(nasInfo.data);
    });
  }

  _newServiceSubscrption(String serviceId, String serviceType) async {
    var result =
        await _serviceSubscriptionUseCase.execute(ServiceSubscriptionRequest(
      serviceId: serviceId,
      tenantId: _tenantId,
      serviceType: serviceType,
      subscriptionData: {},
    ));
    result.fold((failure) {}, (success) {
      _getServiceData();
    });
  }

  _postDataToView() {
    inputForSliderDisplayObject.add(SliderDisplayObject(
        mainPageModel: _screenIndex[currentSliderIndex]!,
        numberOfDisplays: _screenIndex.length,
        currentDisplayIndex: currentSliderIndex));
  }
}
