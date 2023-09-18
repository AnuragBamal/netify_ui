import 'package:flutter/material.dart';
import 'package:netify/app/di.dart';
import 'package:netify/domain/model/enum_model.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/persentation/common/dashboard_list_page.dart';
import 'package:netify/persentation/common/widgets/dashboard_page_widget.dart';
import 'package:netify/persentation/common/widgets/grid_view_builder.dart';
import 'package:netify/persentation/main/billing/billing_view_model.dart';
import 'package:netify/persentation/resources/color_manager.dart';

class Billing extends StatefulWidget {
  const Billing({super.key});

  @override
  State<Billing> createState() => _BillingState();
}

class _BillingState extends State<Billing> {
  final BillingPageViewModel _billingPageViewModel =
      instance<BillingPageViewModel>();
  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 1);
  _bind() {
    _billingPageViewModel.start();
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
    return const Center(
      child: Text("Billing Under Construction"),
    );
    return mainDashboardWidget(
        context,
        _pageController,
        _billingPageViewModel.outputForSliderDisplayObject,
        _billingPageViewModel.onScreenChange,
        _paymentPageWidget);
  }

  Widget _paymentPageWidget(BuildContext context, MainPageModel mainPageModel) {
    return Column(
      children: [
        Text(mainPageModel.title,
            style: Theme.of(context).textTheme.titleSmall),
        SingleChildScrollView(
          child: Column(
            children: [
              if (mainPageModel.viewType == ScreenViewType.grid &&
                  mainPageModel.dataTypeIdentity == DataTypeIdentity.dashboard)
                DashboardView(
                  itemBuilder: dashboardGridItemBuilder,
                  dashboardStream: _billingPageViewModel.outputForDashborad,
                  onTap: goToPage,
                ),
              if (mainPageModel.dataTypeIdentity != DataTypeIdentity.dashboard)
                Center(
                  child: Text(mainPageModel.screenTypeIdentity.toString()),
                )
            ],
          ),
        ),
      ],
    );
    // return Container(
    //   child: Center(
    //     child: Text(mainPageModel.screenTypeIdentity.toString()),
    //   ),
    // );
  }

  @override
  void initState() {
    super.initState();
    _bind();
  }

  @override
  void dispose() {
    _billingPageViewModel.dispose();
    _pageController.dispose();
    super.dispose();
  }
}
