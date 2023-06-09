import 'dart:async';
import 'package:netify/domain/model/model.dart';
import '../base/baseviewmodel.dart';
import '../resources/assets_manager.dart';
import '../resources/strings_manager.dart';

class OnBoardingViewModel extends BaseViewModel
    implements OnBoardingViewModelInputs, OnBoardingViewModelOutputs {
  //streams controllers
  final StreamController _streamController =
      StreamController<SliderViewObject>();
  late final List<SliderObject> _sliderList;
  int _currentPage = 0;

  //inputs
  @override
  void start() {
    _sliderList = _getSliderData();
    //send slide data to our view
    _postDataToView();
  }

  @override
  void dispose() {
    _streamController.close();
    super.dispose();
  }

  @override
  int goNext() {
    if (_currentPage == _sliderList.length - 1) {
      _currentPage = 0;
    } else {
      _currentPage = _currentPage + 1;
    }
    return _currentPage;
  }

  @override
  int goPrevious() {
    if (_currentPage == 0) {
      _currentPage = _sliderList.length - 1;
    } else {
      _currentPage = _currentPage - 1;
    }
    return _currentPage;
  }

  @override
  void onPageChanged(int index) {
    _currentPage = index;
    _postDataToView();
  }

  @override
  Sink get inputSliderViewObject => _streamController.sink;

  //Output
  @override
  Stream<SliderViewObject> get outputSliderViewObject =>
      _streamController.stream.map((sliderViewObject) => sliderViewObject);

  List<SliderObject> _getSliderData() => [
        SliderObject(AppString.onboardingTitle1, AppString.onboardingSubtitle1,
            ImageAssets.onboarding1),
        SliderObject(AppString.onboardingTitle2, AppString.onboardingSubtitle2,
            ImageAssets.onboarding2),
        SliderObject(AppString.onboardingTitle3, AppString.onboardingSubtitle3,
            ImageAssets.onboarding3),
        SliderObject(AppString.onboardingTitle4, AppString.onboardingSubtitle4,
            ImageAssets.onboarding4)
      ];

  _postDataToView() {
    inputSliderViewObject.add(SliderViewObject(
        sliderObject: _sliderList[_currentPage],
        numberOfSlides: _sliderList.length,
        currentIndex: _currentPage));
  }
}

// inputs means the actions that our view model will receive from our view
abstract class OnBoardingViewModelInputs {
  void goNext(); // When user clicks on next button or right arrow
  void goPrevious(); // When user clicks on left arrow
  void onPageChanged(int index);

  Sink
      get inputSliderViewObject; // This is a way to add data to the stream input
}

// Outputs means data or result that will be sent from our view model to our view
abstract class OnBoardingViewModelOutputs {
  Stream<SliderViewObject> get outputSliderViewObject;
}

class SliderViewObject {
  SliderObject sliderObject;
  int numberOfSlides;
  int currentIndex;

  SliderViewObject(
      {required this.sliderObject,
      required this.numberOfSlides,
      required this.currentIndex});
}
