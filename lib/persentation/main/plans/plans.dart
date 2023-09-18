import 'package:flutter/material.dart';
import 'package:netify/app/di.dart';
import 'package:netify/domain/model/enum_model.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/model/plan_model.dart';
import 'package:netify/persentation/common/dashboard_list_page.dart';
import 'package:netify/persentation/common/widgets/dashboard_page_widget.dart';
import 'package:netify/persentation/common/widgets/grid_view_builder.dart';
import 'package:netify/persentation/common/widgets/search_widget.dart';
import 'package:netify/persentation/main/plans/plan_table.dart';
import 'package:netify/persentation/main/plans/plans_view_model.dart';
import 'package:netify/persentation/main/plans/price_chart/create_price_chart.dart';
import 'package:netify/persentation/resources/color_manager.dart';
import 'package:netify/persentation/resources/values_manager.dart';
import 'package:shimmer/shimmer.dart';

class PlansView extends StatefulWidget {
  const PlansView({super.key});

  @override
  State<PlansView> createState() => _PlansState();
}

class _PlansState extends State<PlansView> {
  final PlansPageViewModel _plansPageViewModel = instance<PlansPageViewModel>();
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 1);
  _bind() {
    _plansPageViewModel.start();
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
        _plansPageViewModel.outputSliderDisplayObject,
        _plansPageViewModel.onScreenChange,
        _planPageWidget);
  }

  Widget _planPageWidget(BuildContext context, MainPageModel mainPageModel) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Text(mainPageModel.title,
              style: Theme.of(context).textTheme.titleSmall),
          const SizedBox(
            height: AppSize.s12,
          ),
          const Divider(
            color: ColorManager.primaryColor,
            thickness: 2,
          ),
          if (mainPageModel.viewType == ScreenViewType.grid &&
              mainPageModel.dataTypeIdentity == DataTypeIdentity.dashboard)
            DashboardView(
              itemBuilder: dashboardGridItemBuilder,
              dashboardStream: _plansPageViewModel.outputForDashboard,
              onTap: goToPage,
            ),
          if (mainPageModel.viewType == ScreenViewType.table &&
              mainPageModel.dataTypeIdentity == DataTypeIdentity.plan)
            _planPriceChartStreamBuilder(
                context, mainPageModel.screenTypeIdentity, mainPageModel.filter)
          else if (mainPageModel.viewType == ScreenViewType.table &&
              mainPageModel.dataTypeIdentity ==
                  DataTypeIdentity.resellerPriceChart)
            _resellerPriceChartStreamBuilder(
                context, mainPageModel.screenTypeIdentity, mainPageModel.filter)
          else if (mainPageModel.viewType == ScreenViewType.table &&
              mainPageModel.dataTypeIdentity ==
                  DataTypeIdentity.operatorPriceChart)
            _operatorPriceChartStreamBuilder(
                context, mainPageModel.screenTypeIdentity, mainPageModel.filter)
        ],
      ),
    );
  }

  Widget _planPriceChartStreamBuilder(BuildContext context,
      String screenTypeIdentity, List<Filter> filterList) {
    return Column(
      children: [
        BaseSearchWidget(
          filters: filterList,
          onFilterChanged: _plansPageViewModel.planScreenSearch,
        ),
        StreamBuilder<bool>(
          stream: _plansPageViewModel.outputSearch,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _planScreen(
                  context,
                  screenTypeIdentity,
                  snapshot.data!
                      ? _plansPageViewModel.outputForPlanSearchScreen
                      : _plansPageViewModel.outputForPlansChartsScreen);
            } else {
              return _planScreen(context, screenTypeIdentity,
                  _plansPageViewModel.outputForPlansChartsScreen);
            }
          },
        )
      ],
    );
  }

  Widget _resellerPriceChartStreamBuilder(BuildContext context,
      String screenTypeIdentity, List<Filter> filterList) {
    return Column(
      children: [
        BaseSearchWidget(
          filters: filterList,
          onFilterChanged: _plansPageViewModel.resellerPriceScreenSearch,
        ),
        StreamBuilder<bool>(
          stream: _plansPageViewModel.outputSearch,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _resellerScreen(
                  context,
                  screenTypeIdentity,
                  snapshot.data!
                      ? _plansPageViewModel.outputForResellerPriceSearchScreen
                      : _plansPageViewModel.outputForResellerPriceChartScreen);
            } else {
              return _resellerScreen(context, screenTypeIdentity,
                  _plansPageViewModel.outputForResellerPriceChartScreen);
            }
          },
        )
      ],
    );
  }

  Widget _operatorPriceChartStreamBuilder(BuildContext context,
      String screenTypeIdentity, List<Filter> filterList) {
    return Column(
      children: [
        BaseSearchWidget(
          filters: filterList,
          onFilterChanged: _plansPageViewModel.operatorPriceScreenSearch,
        ),
        StreamBuilder<bool>(
          stream: _plansPageViewModel.outputSearch,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return _operatorScreen(
                  context,
                  screenTypeIdentity,
                  snapshot.data!
                      ? _plansPageViewModel.outputForOperatorPriceSearchScreen
                      : _plansPageViewModel.outputForOperatorPriceChartScreen);
            } else {
              return _operatorScreen(context, screenTypeIdentity,
                  _plansPageViewModel.outputForOperatorPriceChartScreen);
            }
          },
        )
      ],
    );
  }

  Widget _operatorScreen(BuildContext context, String screenTypeIdentity,
      Stream<List<OperatorPriceChart?>> plansStream) {
    return StreamBuilder<List<OperatorPriceChart?>>(
        stream: plansStream,
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
                    heroTag: "operatorScreen",
                    onPressed: () {
                      _plansPageViewModel.navigateToCreatePriceChart(
                          const CreatePriceChartArguments(
                              screenTypeIdentity:
                                  ScreenTypeIdentity.operatorPriceChart));
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
                        child: PlanTable(
                          screenTypeIdentity: screenTypeIdentity,
                          operatorPriceChartSnapshot: snapshot,
                        )),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.08,
                    right: MediaQuery.of(context).size.width * 0.05,
                    child: FloatingActionButton(
                      heroTag: "operatorScreen",
                      onPressed: () {
                        _plansPageViewModel.navigateToCreatePriceChart(
                            const CreatePriceChartArguments(
                                screenTypeIdentity:
                                    ScreenTypeIdentity.operatorPriceChart));
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

  Widget _resellerScreen(BuildContext context, String screenTypeIdentity,
      Stream<List<ResellerPriceChart?>> plansStream) {
    return StreamBuilder<List<ResellerPriceChart?>>(
        stream: plansStream,
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
                    heroTag: "resellerScreen",
                    onPressed: () {
                      _plansPageViewModel.navigateToCreatePriceChart(
                          const CreatePriceChartArguments(
                              screenTypeIdentity:
                                  ScreenTypeIdentity.resellerPriceChart));
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
                        child: PlanTable(
                          screenTypeIdentity: screenTypeIdentity,
                          resellerPriceChartSnapshot: snapshot,
                        )),
                  ),
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.08,
                    right: MediaQuery.of(context).size.width * 0.05,
                    child: FloatingActionButton(
                      heroTag: "resellerScreen",
                      onPressed: () {
                        _plansPageViewModel.navigateToCreatePriceChart(
                            const CreatePriceChartArguments(
                                screenTypeIdentity:
                                    ScreenTypeIdentity.resellerPriceChart));
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

  Widget _planScreen(BuildContext context, String screenTypeIdentity,
      Stream<List<Plans?>> plansStream) {
    return StreamBuilder<List<Plans?>>(
        stream: plansStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return Stack(children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.70,
                    child: const Center(child: Text("No data found"))),
                if (_plansPageViewModel.loggedInUserRole == Roles.admin)
                  Positioned(
                    bottom: MediaQuery.of(context).size.height * 0.08,
                    right: MediaQuery.of(context).size.width * 0.05,
                    child: FloatingActionButton(
                      heroTag: "plansScreen",
                      onPressed: () {
                        _plansPageViewModel.navigateToCreatePlan();
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
                        height: MediaQuery.of(context).size.height * 0.75,
                        // constraints: BoxConstraints(
                        //   maxHeight: ,
                        // ),
                        child: PlanTable(
                          screenTypeIdentity: screenTypeIdentity,
                          plansSnapshot: snapshot,
                        )),
                  ),
                  if (_plansPageViewModel.loggedInUserRole == Roles.admin)
                    Positioned(
                      bottom: MediaQuery.of(context).size.height * 0.08,
                      right: MediaQuery.of(context).size.width * 0.05,
                      child: FloatingActionButton(
                        heroTag: "plansScreen",
                        onPressed: () {
                          _plansPageViewModel.navigateToCreatePlan();
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

  Widget _shimmerWidget() {
    return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.8,
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
        ));
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  void dispose() {
    _plansPageViewModel.dispose();
    _pageController.dispose();
    super.dispose();
  }
}
