import 'package:flutter/material.dart';
import 'package:netify/app/di.dart';
import 'package:netify/domain/model/enum_model.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/persentation/common/widgets/dashboard_page_widget.dart';
import 'package:netify/persentation/common/widgets/grid_view_builder.dart';
import 'package:netify/persentation/common/widgets/list_view_builder.dart';
import 'package:netify/persentation/main/home/home_page_view_model.dart';
import 'package:netify/persentation/common/dashboard_list_page.dart';
import 'package:netify/persentation/main/home/subscriber_list_page.dart';
import 'package:netify/persentation/main/home/subscription_list_page.dart';
import 'package:netify/persentation/main/home/user_list_page.dart';
import 'package:netify/persentation/resources/color_manager.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomepageViewModel _homepageViewModel = instance<HomepageViewModel>();

  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 1.0);
  _bind() {
    _homepageViewModel.start();
  }

  goToPage(int index) {
    // _pageController.animateToPage(index,
    //     duration: const Duration(milliseconds: 500), curve: Curves.easeIn);
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(width: 0.5, color: ColorManager.primaryColor))),
        child: _getContentWidget(context));
  }

  Widget _getContentWidget(BuildContext context) {
    return mainDashboardWidget(
        context,
        _pageController,
        _homepageViewModel.outputSliderDisplayObject,
        _homepageViewModel.onScreenChange,
        _homePageWidget);
  }

  Widget _homePageWidget(BuildContext context, MainPageModel mainPageModel) {
    return Column(
      children: [
        Container(
          height: MediaQuery.of(context).size.height * 0.07,
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1, color: Color.fromRGBO(198, 198, 198, 1)))),
          child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Align(
              alignment: Alignment.centerLeft,
              child: Text(mainPageModel.title,
                  style: Theme.of(context).textTheme.titleLarge),
            ),
          ),
        ),
        if (mainPageModel.viewType == ScreenViewType.grid &&
            mainPageModel.dataTypeIdentity == DataTypeIdentity.dashboard)
          DashboardView(
            itemBuilder: dashboardGridItemBuilder,
            dashboardStream: _homepageViewModel.outputForDashboard,
            onTap: goToPage,
          ),
        if (mainPageModel.viewType == ScreenViewType.list &&
            mainPageModel.dataTypeIdentity == DataTypeIdentity.user)
          UserDataTypeScreen(
            itemBuilder: userListBuilder,
            filterList: mainPageModel.filter,
            homepageViewModel: _homepageViewModel,
            screenName: mainPageModel.screenTypeIdentity,
          ),
        if (mainPageModel.viewType == ScreenViewType.list &&
            mainPageModel.dataTypeIdentity == DataTypeIdentity.subscriber)
          SubscriberDataTypeScreen(
            filterList: mainPageModel.filter,
            homepageViewModel: _homepageViewModel,
            screenName: mainPageModel.screenTypeIdentity,
          ),
        if (mainPageModel.viewType == ScreenViewType.list &&
            mainPageModel.dataTypeIdentity == DataTypeIdentity.subscription)
          SubscriptionDataTypeScreen(
            filterList: mainPageModel.filter,
            homepageViewModel: _homepageViewModel,
            screenName: mainPageModel.screenTypeIdentity,
          ),
      ],
    );
  }

  @override
  void initState() {
    _bind();
    super.initState();
  }

  @override
  void dispose() {
    _homepageViewModel.dispose();
    _pageController.dispose();

    super.dispose();
  }
}

// Old _getContentWidget function.
//  Widget _getContentWidget(BuildContext context) {
    // return Center(
    //     child: StreamBuilder<SliderDisplayObject>(
    //   stream: _homepageViewModel.outputSliderDisplayObject,
    //   builder: (context, snapshot) {
    //     if (snapshot.hasData) {
    //       return GestureDetector(
    //         onHorizontalDragEnd: (DragEndDetails details) {
    //           if (details.velocity.pixelsPerSecond.dx > 0) {
    //             _pageController.previousPage(
    //               duration: const Duration(milliseconds: 200),
    //               curve: Curves.easeInOut,
    //             );
    //           } else if (details.velocity.pixelsPerSecond.dx < 0) {
    //             _pageController.nextPage(
    //               duration: const Duration(milliseconds: 200),
    //               curve: Curves.easeInOut,
    //             );
    //           }
    //         },
    //         child: PageView.builder(
    //             pageSnapping: false,
    //             physics: const NeverScrollableScrollPhysics(),
    //             controller: _pageController,
    //             itemCount: snapshot.data!.numberOfDisplays,
    //             onPageChanged: (index) {
    //               _homepageViewModel.onScreenChange(index);
    //             },
    //             itemBuilder: (context, index) {
    //               return _homePageWidget(context, snapshot.data!.mainPageModel);
    //             }),
    //       );
    //     } else {
    //       return dashboardShimmer(context);
    //     }
    //   },
    // ));
  // }