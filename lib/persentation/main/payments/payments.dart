import 'package:flutter/material.dart';
import 'package:netify/app/di.dart';
import 'package:netify/domain/model/enum_model.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/model/wallet_model.dart';
import 'package:netify/persentation/common/dashboard_list_page.dart';
import 'package:netify/persentation/common/widgets/dashboard_page_widget.dart';
import 'package:netify/persentation/common/widgets/grid_view_builder.dart';
import 'package:netify/persentation/main/payments/payments_view_model.dart';
import 'package:netify/persentation/main/payments/sales_widget.dart';
import 'package:netify/persentation/main/payments/transactions_view.dart';
import 'package:netify/persentation/main/payments/w2w_transfer_widget.dart';
import 'package:netify/persentation/resources/color_manager.dart';
import 'package:netify/persentation/resources/strings_manager.dart';
import 'package:netify/persentation/resources/values_manager.dart';
import 'package:shimmer/shimmer.dart';

class Payments extends StatefulWidget {
  const Payments({super.key});

  @override
  State<Payments> createState() => _PaymentsState();
}

class _PaymentsState extends State<Payments> {
  final _key = GlobalKey();

  final PaymentsPageViewModel _paymentsPageViewModel =
      instance<PaymentsPageViewModel>();

  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 1);
  _bind() {
    _paymentsPageViewModel.start();
    // _amountController.addListener(() {
    //   _paymentsPageViewModel.setTransferAmount(_amountController.text);
    // });
    // _remarksController.addListener(() {
    //   _paymentsPageViewModel.setRemarks(_remarksController.text);
    // });
  }

  goToPage(int index) {
    _pageController.jumpToPage(index);
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        key: _key,
        decoration: const BoxDecoration(
            border: Border(
                top: BorderSide(width: 0.5, color: ColorManager.primaryColor))),
        child: _getContentWidget(context));
  }

  Widget _getContentWidget(BuildContext context) {
    return mainDashboardWidget(
        context,
        _pageController,
        _paymentsPageViewModel.outputForSliderDisplayObject,
        _paymentsPageViewModel.onScreenChange,
        _paymentPageWidget);
  }

  Widget _paymentPageWidget(BuildContext context, MainPageModel mainPageModel) {
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
            dashboardStream: _paymentsPageViewModel.outputForDashborad,
            onTap: goToPage,
          ),
        if (mainPageModel.dataTypeIdentity == DataTypeIdentity.wallet)
          _walletScreen(context, _paymentsPageViewModel.outputForUserWallet),
        if (mainPageModel.dataTypeIdentity == DataTypeIdentity.transactions)
          TransactionWidget(
            mainPageModel: mainPageModel,
            paymentsPageViewModel: _paymentsPageViewModel,
          ),
        if (mainPageModel.screenTypeIdentity ==
            ScreenTypeIdentity.salesTransactions)
          SalesWidget(
              mainPageModel: mainPageModel,
              paymentsPageViewModel: _paymentsPageViewModel),
      ],
    );
    // return Container(
    //   child: Center(
    //     child: Text(mainPageModel.screenTypeIdentity.toString()),
    //   ),
    // );
  }

  Widget _walletScreen(
      BuildContext context, Stream<UserWallet> userWalletStream) {
    return StreamBuilder<UserWallet>(
        stream: userWalletStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                SizedBox(
                    height: MediaQuery.of(context).size.height * 0.20,
                    child:
                        _getWalletCardWidget(context, snapshot.data!.balance)),
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: ListTile(
                    leading: Icon(
                      Icons.compare_arrows,
                      size: 50,
                    ),
                    title: Text(AppString.w2wTransfer),
                    //subtitle: Text('Subtitle'),
                  ),
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.37,
                  child: W2WTransferWidget(
                      paymentsPageViewModel: _paymentsPageViewModel,
                      payee: snapshot.data!.payee),
                ),
              ],
            );
          } else {
            return _walletShimmerWidget();
          }
        });
  }

  Widget _getWalletCardWidget(BuildContext context, double balance) {
    return Card(
      elevation: 20, // Control the shadow elevation
      margin: const EdgeInsets.symmetric(horizontal: AppSize.s16),
      borderOnForeground: false, // Control the card's margin
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.wallet, size: 40),
            title: Text(AppString.walletBalance),
            //subtitle: Text('Subtitle'),
          ),

          // Divider(), // Add a divider line
          Padding(
            padding: const EdgeInsets.only(top: AppSize.s8, bottom: AppSize.s8),
            child: Text(
              'Rs. $balance',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ],
      ),
    );
  }

  Widget _walletShimmerWidget() {
    return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.55,
        ),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (_, __) => Shimmer.fromColors(
            baseColor: const Color.fromARGB(255, 184, 183, 183),
            highlightColor: const Color.fromARGB(255, 235, 234, 234),
            child: Column(children: [
              const SizedBox(
                height: AppSize.s24,
              ),
              Card(
                elevation: 20,
                margin: const EdgeInsets.all(AppSize.s20),
                child: ListTile(
                  leading: const Icon(Icons.wallet, size: 50),
                  title: Container(
                    // Control the shadow elevation
                    height: 60.0,
                    color: Colors.white,
                  ),
                  subtitle: Container(
                    height: 60.0,
                    color: Colors.white,
                  ),
                ),
              ),
              const SizedBox(
                height: AppSize.s16,
              ),
              Card(
                elevation: 20,
                margin: const EdgeInsets.all(AppSize.s20),
                child: ListTile(
                  leading: const Icon(Icons.compare_arrows, size: 50),
                  title: Container(
                    height: 180.0,
                    color: Colors.white,
                  ),
                  subtitle: Container(
                    height: 180.0,
                    color: Colors.white,
                  ),
                ),
              )
            ]),
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
    _paymentsPageViewModel.dispose();
    _pageController.dispose();

    super.dispose();
  }
}
