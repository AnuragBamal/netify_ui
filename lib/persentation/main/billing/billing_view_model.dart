import 'dart:async';

import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/enum_model.dart';
import 'package:netify/domain/model/home_model.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/usecase/get_payment_metadata_usecase.dart';
import 'package:netify/domain/usecase/getdashboard_usecase.dart';
import 'package:netify/persentation/base/baseviewmodel.dart';

class BillingPageViewModel extends BaseViewModelInputsOutputs {
  final StreamController _dashboardController =
      StreamController<List<DashboardItem>>.broadcast();
  final StreamController _sliderDisplayObjectController =
      StreamController<SliderDisplayObject>.broadcast();

  final GetDashboardUseCase _getDashboardUseCase;
  //final GetPaymentMetadataUseCase _getPaymentProfileMetadataUseCase;
  late final Map<int, MainPageModel> _screenIndex;
  String _currentFilter = "";
  String _filterSearchValue = "";

  BillingPageViewModel(
    this._getDashboardUseCase,
    // this._getPaymentProfileMetadataUseCase,
  );

  int currentSliderIndex = 0;
  bool isSearchEnabled = false;

  @override
  void start() {
    //  _getPaymentsPageMetadata();
  }

  @override
  void dispose() {
    _dashboardController.close();
    _sliderDisplayObjectController.close();
  }

  void onScreenChange(int index) {
    // inputSearch.add(false);
    currentSliderIndex = index;
    if (_screenIndex[index]!.dataTypeIdentity == DataTypeIdentity.dashboard) {
      _getDashboardData(_screenIndex[index]!.screenTypeIdentity);
    }

    _postDataToView();
  }

  Sink get inputForDashboard => _dashboardController.sink;

  Sink get inputForSliderDisplayObject => _sliderDisplayObjectController.sink;

  Stream<List<DashboardItem>> get outputForDashborad =>
      _dashboardController.stream.map((dashboard) => dashboard);

  Stream<SliderDisplayObject> get outputForSliderDisplayObject =>
      _sliderDisplayObjectController.stream
          .map((sliderDisplayObject) => sliderDisplayObject);

  // _getPaymentsPageMetadata() async {
  //   var result = await _getPaymentProfileMetadataUseCase.execute();
  //   result.fold((failure) {}, (paymentsProfileMeta) {
  //     //_screenIndex = {};
  //     _screenIndex = paymentsProfileMeta.data[0].paymentScreens.asMap();
  //     onScreenChange(currentSliderIndex);
  //   });
  // }

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
