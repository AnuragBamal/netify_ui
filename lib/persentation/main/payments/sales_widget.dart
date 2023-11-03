import 'package:flutter/material.dart';
import 'package:netify/app/constant.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/model/wallet_model.dart';
import 'package:netify/persentation/common/widgets/date_selectors_widget.dart';
import 'package:netify/persentation/common/widgets/display_info_widget.dart';
import 'package:netify/persentation/common/widgets/search_widget.dart';
import 'package:netify/persentation/main/payments/payments_view_model.dart';
import 'package:netify/persentation/resources/color_manager.dart';

class SalesWidget extends StatelessWidget {
  final MainPageModel mainPageModel;
  final PaymentsPageViewModel paymentsPageViewModel;
  const SalesWidget(
      {super.key,
      required this.mainPageModel,
      required this.paymentsPageViewModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(children: [
      BaseSearchWidget(
        filters: mainPageModel.filter,
        onFilterChanged: paymentsPageViewModel.updateSearchFilter,
      ),
      SizedBox(
        width: MediaQuery.of(context).size.width *
            Constant.expandedPanelContainerWidth,
        child: DateSelectors(
          fromDate: paymentsPageViewModel.getFromDate(),
          toDate: paymentsPageViewModel.getToDate(),
          onDateChange: paymentsPageViewModel.updateDateFilters,
        ),
      ),
      SingleChildScrollView(
        child: StreamBuilder<bool>(
          stream: paymentsPageViewModel.outputSearch,
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              if (!snapshot.data!) {
                return SizedBox(
                    height: MediaQuery.of(context).size.height * .60,
                    child: SalesViewWidget(
                      loggedInUser: paymentsPageViewModel.loggedInUser,
                      salesSnapshot: paymentsPageViewModel
                          .outputForSales, // paymentsPageViewModel.outputForTransaction,
                    ));
              } else {
                return SizedBox(
                    height: MediaQuery.of(context).size.height * .60,
                    child: SalesViewWidget(
                      loggedInUser: paymentsPageViewModel.loggedInUser,
                      salesSnapshot: paymentsPageViewModel
                          .outputForSalesSearch, // paymentsPageViewModel.outputForTransaction,
                    ));
              }
            } else {
              return SizedBox(
                  height: MediaQuery.of(context).size.height * .60,
                  child: SalesViewWidget(
                    loggedInUser: paymentsPageViewModel.loggedInUser,
                    salesSnapshot: paymentsPageViewModel
                        .outputForSales, // paymentsPageViewModel.outputForTransaction,
                  ));
            }
          },
        ),
      ),
    ]));
  }
}

class SalesViewWidget extends StatefulWidget {
  final String loggedInUser;
  final Stream<List<Sale>> salesSnapshot;
  const SalesViewWidget({
    super.key,
    required this.loggedInUser,
    required this.salesSnapshot,
  });

  @override
  State<SalesViewWidget> createState() => _SalesViewWidgetState();
}

class _SalesViewWidgetState extends State<SalesViewWidget> {
  bool isTableView = false;
  String expandThis = "";
  @override
  Widget build(BuildContext context) {
    return _buildSalesStream(context);
  }

  Widget _buildSalesStream(BuildContext context) {
    return StreamBuilder<List<Sale>>(
      stream: widget.salesSnapshot,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return const Center(
              child: Text("No Sales Data Found"),
            );
          } else {
            return _buildSalesExpansionList(context, snapshot.data!);
          }
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }

  Widget _buildSalesExpansionList(BuildContext context, List<Sale> sales) {
    return SizedBox(
      width: MediaQuery.of(context).size.width *
          Constant.expandedPanelContainerWidth,
      child: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              expandThis = isExpanded ? "" : sales[index].billNumber;
            });
          },
          children: sales.map<ExpansionPanel>((Sale sale) {
            return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  leading: const CircleAvatar(
                      backgroundColor: ColorManager.circularAvtarColor,
                      child: Icon(Icons.sell_outlined)),
                  title: Text(sale.planName),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Base Price: ${sale.planBasicCost}"),
                      Text("Offered Price: ${sale.planOfferedCost}"),
                      Text("Total Tax: ${sale.totalTaxCollected}"),
                    ],
                  ),
                  trailing: Text(
                    "Rs. ${sale.planProfit}",
                    style: const TextStyle(
                        color: ColorManager.paymentIn,
                        fontSize: 14,
                        fontWeight: FontWeight.bold),
                  ),
                );
              },
              body: SalesExpandedWidget(
                sale: sale,
              ),
              isExpanded: expandThis == sale.billNumber,
            );
          }).toList(),
        ),
      ),
    );
  }
}
