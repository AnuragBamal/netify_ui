import 'package:flutter/material.dart';
import 'package:netify/app/di.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/persentation/common/widgets/grid_view_builder.dart';
import 'package:netify/persentation/common/widgets/list_view_builder.dart';
import 'package:netify/services/authentication_service.dart';
import 'package:netify/persentation/main/home/dashboard_list_page.dart';
import 'package:netify/persentation/main/home/user_list_page.dart';
import 'package:netify/persentation/main/home_page_view_model.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  final HomepageViewModel _homepageViewModel = instance<HomepageViewModel>();
  final AuthenticationService _authenticationService =
      instance<AuthenticationService>();

  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 1.0);
  _bind() {
    _homepageViewModel.start();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Home'), actions: [
          IconButton(
              onPressed: () {
                _authenticationService.signOutUser();
              },
              icon: const Icon(Icons.logout))
        ]),
        body: _getContentWidget(context));
  }

  Widget _getContentWidget(BuildContext context) {
    return Center(
        child: StreamBuilder<SliderDisplayObject>(
      stream: _homepageViewModel.outputSliderDisplayObject,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return PageView.builder(
              pageSnapping: true,
              controller: _pageController,
              itemCount: snapshot.data!.numberOfDisplays,
              onPageChanged: (index) {
                _homepageViewModel.onScreenChange(index);
              },
              itemBuilder: (context, index) {
                return _homePageWidget(context, snapshot.data!.mainPageModel);
              });
        } else {
          return Container();
        }
      },
    ));
  }

  Widget _homePageWidget(BuildContext context, MainPageModel mainPageModel) {
    return SingleChildScrollView(
      child: Column(
        children: [
          // Text(mainPageModel.title),
          // Text(mainPageModel.index.toString()),
          // Text(mainPageModel.viewType),
          // Text(mainPageModel.dataTypeIdentity),
          // Text(mainPageModel.screenTypeIdentity),
          // Text(mainPageModel.filter.toString()),
          if (mainPageModel.viewType == "gridView" &&
              mainPageModel.dataTypeIdentity == "dashboard")
            DashboardView(
              itemBuilder: dashboardGridItemBuilder,
              homepageViewModel: _homepageViewModel,
            ),
          if (mainPageModel.viewType == "listView" &&
              mainPageModel.dataTypeIdentity == "user")
            UserDataTypeScreen(
              itemBuilder: userListBuilder,
              filterList: mainPageModel.filter,
              homepageViewModel: _homepageViewModel,
              screenName: mainPageModel.screenTypeIdentity,
            ),
        ],
      ),
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
