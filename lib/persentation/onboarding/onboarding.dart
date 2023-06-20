import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:netify/app/app_prefs.dart';
import 'package:netify/app/di.dart';
import 'package:netify/services/navigator_service.dart';
import 'package:netify/persentation/onboarding/onboarding_view_model.dart';
import 'package:netify/persentation/resources/color_manager.dart';
import 'package:netify/persentation/resources/strings_manager.dart';
import 'package:netify/persentation/resources/values_manager.dart';

import '../../domain/model/model.dart';
import '../resources/assets_manager.dart';

class OnboardingView extends StatefulWidget {
  const OnboardingView({super.key});

  @override
  State<OnboardingView> createState() => _OnboardingViewState();
}

class _OnboardingViewState extends State<OnboardingView> {
  final PageController _pageController = PageController(initialPage: 0);
  final OnBoardingViewModel _onBoardingViewModel =
      OnBoardingViewModel(instance<NavigationService>());
  final AppPreferences _appPreferences = instance<AppPreferences>();
  _bind() {
    _appPreferences.setOnboardingScreenIsShown();
    _onBoardingViewModel.start();
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _onBoardingViewModel.dispose();
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<SliderViewObject>(
      stream: _onBoardingViewModel.outputSliderViewObject,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return _getContentWidget(context, snapshot.data!);
        } else {
          return const Scaffold(
            backgroundColor: ColorManager.surfaceColor,
            body: Center(
                child: Image(
              image: AssetImage(ImageAssets.splashLogo),
              width: 200,
            )),
          );
        }
      },
    );
  }

  Widget _getContentWidget(
      BuildContext context, SliderViewObject? sliderViewObject) {
    return Scaffold(
      backgroundColor: ColorManager.surfaceColor,
      appBar: AppBar(
          elevation: AppSize.s0,
          backgroundColor: ColorManager.surfaceColor,
          systemOverlayStyle: const SystemUiOverlayStyle(
              statusBarBrightness: Brightness.dark,
              statusBarColor: ColorManager.surfaceColor,
              statusBarIconBrightness: Brightness.dark)),
      body: PageView.builder(
        controller: _pageController,
        itemCount: sliderViewObject!.numberOfSlides,
        onPageChanged: (value) {
          _onBoardingViewModel.onPageChanged(value);
        },
        itemBuilder: (context, index) {
          //return onboardingpage
          return OnboardingPage(sliderObject: sliderViewObject.sliderObject);
        },
      ),
      bottomSheet: Container(
        color: ColorManager.surfaceColor,
        height: AppSize.s100,
        child: Column(children: [
          Align(
            alignment: Alignment.centerRight,
            child: TextButton(
              onPressed: () {
                if (sliderViewObject.currentIndex ==
                    sliderViewObject.numberOfSlides - 1) {
                  _onBoardingViewModel.goToLogin();
                } else {
                  _pageController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.ease);
                }
              },
              child: Text(
                sliderViewObject.currentIndex ==
                        sliderViewObject.numberOfSlides - 1
                    ? AppString.onboardingSkip
                    : AppString.onboardingNext,
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
          ),
          _getBottomSheetWidget(sliderViewObject)
        ]),
      ),
    );
  }

  Widget _getBottomSheetWidget(SliderViewObject sliderViewObject) {
    return Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
      Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: GestureDetector(
            child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.leftArrow)),
            onTap: () {
              _pageController.animateToPage(_onBoardingViewModel.goPrevious(),
                  duration:
                      const Duration(milliseconds: DurationConstants.d300),
                  curve: Curves.bounceInOut);
            },
          )),
      //circles indicator
      Row(
        children: [
          for (int i = 0; i < sliderViewObject.numberOfSlides; i++)
            Padding(
              padding: const EdgeInsets.all(AppPadding.p8),
              child: Container(
                height: AppSize.s8,
                width: AppSize.s8,
                decoration: BoxDecoration(
                    color: sliderViewObject.currentIndex == i
                        ? ColorManager.primaryColor
                        : ColorManager.blackColor,
                    shape: BoxShape.circle),
              ),
            )
        ],
      ),
      Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: GestureDetector(
            child: SizedBox(
                height: AppSize.s20,
                width: AppSize.s20,
                child: SvgPicture.asset(ImageAssets.rightArrow)),
            onTap: () {
              //go to Next page
              _pageController.animateToPage(_onBoardingViewModel.goNext(),
                  duration:
                      const Duration(milliseconds: DurationConstants.d300),
                  curve: Curves.bounceInOut);
            },
          ))
    ]);
  }
}

class OnboardingPage extends StatelessWidget {
  final SliderObject sliderObject;

  const OnboardingPage({Key? key, required this.sliderObject})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        const SizedBox(
          height: AppSize.s40,
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.title,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.displayLarge,
          ),
        ),
        Padding(
          padding: const EdgeInsets.all(AppPadding.p8),
          child: Text(
            sliderObject.description,
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.headlineLarge,
          ),
        ),
        const SizedBox(
          height: AppSize.s40,
        ),
        SvgPicture.asset(sliderObject.imagePath)
      ],
    );
  }
}
