import 'package:flutter/material.dart';
import 'package:netify/app/di.dart';
import 'package:netify/domain/model/enum_model.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/model/wallet_model.dart';
import 'package:netify/persentation/common/dashboard_list_page.dart';
import 'package:netify/persentation/common/widgets/dashboard_page_widget.dart';
import 'package:netify/persentation/common/widgets/grid_view_builder.dart';
import 'package:netify/persentation/main/payments/payments_view_model.dart';
import 'package:netify/persentation/main/payments/transactions_view.dart';
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
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final PaymentsPageViewModel _paymentsPageViewModel =
      instance<PaymentsPageViewModel>();

  final TextEditingController _amountController = TextEditingController();

  final PageController _pageController =
      PageController(initialPage: 0, viewportFraction: 1);
  _bind() {
    _paymentsPageViewModel.start();
    _amountController.addListener(() {
      _paymentsPageViewModel.setTransferAmount(_amountController.text);
    });
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
        _paymentsPageViewModel.outputForSliderDisplayObject,
        _paymentsPageViewModel.onScreenChange,
        _paymentPageWidget);
  }

  Widget _paymentPageWidget(BuildContext context, MainPageModel mainPageModel) {
    return Column(
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
        SingleChildScrollView(
          child: Column(
            children: [
              if (mainPageModel.viewType == ScreenViewType.grid &&
                  mainPageModel.dataTypeIdentity == DataTypeIdentity.dashboard)
                DashboardView(
                  itemBuilder: dashboardGridItemBuilder,
                  dashboardStream: _paymentsPageViewModel.outputForDashborad,
                  onTap: goToPage,
                ),
              if (mainPageModel.dataTypeIdentity == DataTypeIdentity.wallet)
                _walletScreen(
                    context, _paymentsPageViewModel.outputForUserWallet),
              if (mainPageModel.dataTypeIdentity ==
                  DataTypeIdentity.transactions)
                Center(
                  child: TransactionsViewWidget(
                      transactionType: "w2w",
                      loggedInUser: _paymentsPageViewModel.loggedInUser,
                      w2wTransactionSnapshot:
                          _paymentsPageViewModel.outputForTransaction),
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

  Widget _walletScreen(
      BuildContext context, Stream<UserWallet> userWalletStream) {
    return StreamBuilder<UserWallet>(
        stream: userWalletStream,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return Column(
              children: [
                const SizedBox(
                  height: AppSize.s24,
                ),
                _getWalletCardWidget(context, snapshot.data!.balance),
                const SizedBox(
                  height: AppSize.s16,
                ),
                _getW2wWidget(context, snapshot.data!.payee),
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
      margin: const EdgeInsets.all(AppSize.s16),
      borderOnForeground: false, // Control the card's margin
      child: Column(
        children: [
          const ListTile(
            leading: Icon(Icons.wallet, size: 50),
            title: Text(AppString.walletBalance),
            //subtitle: Text('Subtitle'),
          ),

          // Divider(), // Add a divider line
          Padding(
            padding:
                const EdgeInsets.only(top: AppSize.s12, bottom: AppSize.s48),
            child: Text(
              'Rs. $balance',
              style: Theme.of(context).textTheme.headlineLarge,
            ),
          ),
        ],
      ),
    );
  }

  Widget _getW2wWidget(BuildContext context, List<Payee> payee) {
    return Column(
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 16.0),
          child: ListTile(
            leading: Icon(
              Icons.compare_arrows,
              size: 50,
            ),
            title: Text(AppString.w2wTransfer),
            //subtitle: Text('Subtitle'),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(top: AppSize.s12, bottom: AppSize.s48),
          child: Form(
            key: _formKey,
            child: Card(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  children: [
                    _getPayeeWidget(context, payee),
                    const SizedBox(
                      height: AppSize.s8,
                    ),
                    _getAmountWidget(context),
                    const SizedBox(
                      height: AppSize.s8,
                    ),
                    _getTransferButton(context),
                    const SizedBox(
                      height: AppSize.s8,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        // _getPayeeWidget(context, payee),
        // _getAmountWidget(context),
        // _getTransferButton(context),
      ],
    );
  }

  Widget _getPayeeWidget(BuildContext context, List<Payee> payee) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSize.s16, right: AppSize.s16),
      child: DropdownButtonFormField<Payee>(
        decoration: InputDecoration(
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(AppSize.s8),
          ),
          labelText: AppString.payee,
        ),
        value: payee[0],
        onChanged: (Payee? newValue) {
          _paymentsPageViewModel.setPayeeName(
              newValue!.userName, newValue.userId);
        },
        items: payee
            .map<DropdownMenuItem<Payee>>((Payee value) => DropdownMenuItem(
                  value: value,
                  child: Text(value.userName),
                ))
            .toList(),
      ),
    );
  }

  Widget _getAmountWidget(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.only(left: AppSize.s16, right: AppSize.s16),
        child: StreamBuilder<String?>(
            stream: _paymentsPageViewModel.outputForAmount,
            builder: (context, snapshot) {
              return TextFormField(
                controller: _amountController,
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(AppSize.s8),
                    ),
                    labelText: AppString.transferAmount,
                    errorText: snapshot.data),
              );
            }));
  }

  Widget _getTransferButton(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: AppSize.s16, right: AppSize.s16),
      child: StreamBuilder<bool>(
          stream: _paymentsPageViewModel.outputForActivateW2wTransfer,
          builder: (context, snapshot) {
            return ElevatedButton(
              onPressed: (snapshot.data == true)
                  ? () {
                      _paymentsPageViewModel.triggerTransfer(context);
                      _amountController.clear();
                    }
                  : null,
              child: const Text(AppString.transferButton),
            );
          }),
    );
  }

  Widget _walletShimmerWidget() {
    return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.70,
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
    _amountController.dispose();

    super.dispose();
  }
}
