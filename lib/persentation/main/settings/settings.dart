import 'package:flutter/material.dart';
import 'package:netify/app/di.dart';
import 'package:netify/domain/model/enum_model.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/model/settings_model.dart';
import 'package:netify/persentation/common/dashboard_list_page.dart';
import 'package:netify/persentation/common/widgets/dashboard_page_widget.dart';
import 'package:netify/persentation/common/widgets/grid_view_builder.dart';
import 'package:netify/persentation/main/settings/settings_view_model.dart';
import 'package:netify/persentation/main/settings/settings_view_widget.dart';
import 'package:netify/persentation/resources/color_manager.dart';
import 'package:netify/persentation/resources/values_manager.dart';
import 'package:shimmer/shimmer.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
  final SettingsPageViewModel _settingsPageViewModel =
      instance<SettingsPageViewModel>();
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 1);
  _bind() {
    _settingsPageViewModel.start();
  }

  goToPage(int index) {
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
        _settingsPageViewModel.outputForSliderDisplayObject,
        _settingsPageViewModel.onScreenChange,
        _settingsPageWidget);
  }

  Widget _settingsPageWidget(
      BuildContext context, MainPageModel mainPageModel) {
    return Column(
      children: [
        Container(
          decoration: const BoxDecoration(
              border: Border(
                  bottom: BorderSide(
                      width: 1, color: Color.fromRGBO(198, 198, 198, 1)))),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
            dashboardStream: _settingsPageViewModel.outputForDashborad,
            onTap: goToPage,
          ),
        if (mainPageModel.dataTypeIdentity ==
            DataTypeIdentity.serviceSubscriptions)
          _serviceScreen(context, _settingsPageViewModel.outputForServices,
              _settingsPageViewModel.outputForSubscribedServices),
        if (mainPageModel.dataTypeIdentity == DataTypeIdentity.nasEntries)
          _nasScreen(context, _settingsPageViewModel.outputForNas),
      ],
    );
  }

  Widget _serviceScreen(
      BuildContext context,
      Stream<List<Service?>>? serviceStream,
      Stream<List<SubscribedService?>>? subscribedServiceStream) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 8.0),
        child: Text.rich(TextSpan(
            text: "Availiable Service Subscriptions:",
            style: Theme.of(context).textTheme.titleMedium)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s8),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(color: ColorManager.primaryColor)),
          child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.32,
                // minHeight: MediaQuery.of(context).size.height * 0.35
              ),
              child: _availiableServicesBuilder(context, serviceStream)),
        ),
      ),
      const SizedBox(
        height: AppSize.s12,
      ),
      const Divider(
        color: ColorManager.primaryColor,
        thickness: 1,
      ),
      const SizedBox(
        height: AppSize.s12,
      ),
      Padding(
        padding: const EdgeInsets.only(left: 8.0, top: 8.0),
        child: Text.rich(TextSpan(
            text: "Subscribed Services:",
            style: Theme.of(context).textTheme.titleMedium)),
      ),
      Padding(
        padding: const EdgeInsets.symmetric(horizontal: AppSize.s8),
        child: Container(
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(2),
              border: Border.all(color: ColorManager.primaryColor)),
          child: ConstrainedBox(
              constraints: BoxConstraints(
                maxHeight: MediaQuery.of(context).size.height * 0.32,
                // minHeight: MediaQuery.of(context).size.height * 0.35
              ),
              child:
                  _subscribedServicesBuilder(context, subscribedServiceStream)),
        ),
      ),
    ]);
  }

  Widget _nasScreen(BuildContext context, Stream<List<Nas?>>? nasStream) {
    return StreamBuilder<List<Nas?>>(
        stream: nasStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return Stack(children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.70,
                    child: const Center(child: Text("No data found"))),
                Positioned(
                  bottom: MediaQuery.of(context).size.height * 0.08,
                  right: MediaQuery.of(context).size.width * 0.05,
                  child: FloatingActionButton(
                    heroTag: "nasscreen",
                    onPressed: () {
                      _settingsPageViewModel.navigateToAddNewNas();
                    },
                    backgroundColor: ColorManager.primaryColor,
                    child: const Icon(Icons.add),
                  ),
                ),
              ]);
            } else {
              return Stack(
                children: [
                  GestureDetector(
                    onTap: () {
                      FocusScope.of(context).requestFocus(FocusNode());
                    },
                    child: SizedBox(
                        height: MediaQuery.of(context).size.height * 0.70,
                        // constraints: BoxConstraints(
                        //   maxHeight: ,
                        // ),
                        child: SettingsViewWidget(
                          viewTypeIdentity: "nas_list",
                          nasSnapshot: snapshot,
                        )),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.08,
                    right: MediaQuery.of(context).size.width * 0.05,
                    child: FloatingActionButton(
                      heroTag: "plansScreen",
                      onPressed: () {
                        _settingsPageViewModel.navigateToAddNewNas();
                      },
                      backgroundColor: ColorManager.primaryColor,
                      child: const Icon(Icons.add),
                    ),
                  ),
                ],
              );
            }
          } else if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          } else {
            return _shimmerWidget();
          }
        });
  }

  Widget _availiableServicesBuilder(
    BuildContext context,
    Stream<List<Service?>>? serviceStream,
  ) {
    return StreamBuilder<List<Service?>>(
      stream: serviceStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return SettingsViewWidget(
            viewTypeIdentity: "availiable_services",
            serviceSnapshot: snapshot,
            serviceSubscrptionFunction: _settingsPageViewModel.subscribeService,
          );
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else {
          return _shimmerWidget();
        }
      },
    );
  }

  Widget _subscribedServicesBuilder(
    BuildContext context,
    Stream<List<SubscribedService?>>? subscribedServiceStream,
  ) {
    return StreamBuilder<List<SubscribedService?>>(
      stream: subscribedServiceStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return const Center(child: Text("No Subscribed Services"));
          }
          return SettingsViewWidget(
            viewTypeIdentity: "subscibed_services",
            subacribedServicesSnapshot: snapshot,
          );
        } else if (snapshot.hasError) {
          return Text("Error: ${snapshot.error}");
        } else {
          return _shimmerWidget();
        }
      },
    );
  }

  Widget _shimmerWidget() {
    return SingleChildScrollView(
      child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight: MediaQuery.of(context).size.height * 0.70,
          ),
          child: ListView.builder(
            itemCount: 10,
            itemBuilder: (_, __) => Shimmer.fromColors(
              baseColor: const Color.fromARGB(255, 184, 183, 183),
              highlightColor: const Color.fromARGB(255, 235, 234, 234),
              child: ListTile(
                leading: Container(
                  width: 48.0,
                  height: 48.0,
                  color: Colors.white,
                ),
                title: Container(
                  height: 8.0,
                  color: Colors.white,
                ),
                subtitle: Container(
                  height: 8.0,
                  color: Colors.white,
                ),
              ),
            ),
          )),
    );
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  void dispose() {
    _settingsPageViewModel.dispose();
    _pageController.dispose();

    super.dispose();
  }
}
