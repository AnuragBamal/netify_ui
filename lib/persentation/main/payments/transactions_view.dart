import 'package:flutter/material.dart';
import 'package:netify/app/constant.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/model/wallet_model.dart';
import 'package:netify/persentation/common/widgets/date_selectors_widget.dart';
import 'package:netify/persentation/common/widgets/display_info_widget.dart';
import 'package:netify/persentation/common/widgets/search_widget.dart';
import 'package:netify/persentation/main/payments/payments_view_model.dart';
import 'package:netify/persentation/resources/color_manager.dart';

class TransactionWidget extends StatelessWidget {
  final MainPageModel mainPageModel;
  final PaymentsPageViewModel paymentsPageViewModel;
  const TransactionWidget(
      {super.key,
      required this.mainPageModel,
      required this.paymentsPageViewModel});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.11,
            child: BaseSearchWidget(
              filters: mainPageModel.filter,
              onFilterChanged: paymentsPageViewModel.updateSearchFilter,
            ),
          ),
          SizedBox(
            height: MediaQuery.of(context).size.height * 0.075,
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
                        height: MediaQuery.of(context).size.height * .495,
                        child: TransactionsViewWidget(
                          loggedInUser: paymentsPageViewModel.loggedInUser,
                          w2wTransactionSnapshot: paymentsPageViewModel
                              .outputForTransaction, // paymentsPageViewModel.outputForTransaction,
                        ));
                  } else {
                    return SizedBox(
                        height: MediaQuery.of(context).size.height * .495,
                        child: TransactionsViewWidget(
                          loggedInUser: paymentsPageViewModel.loggedInUser,
                          w2wTransactionSnapshot: paymentsPageViewModel
                              .outputForTransactionSearch, // paymentsPageViewModel.outputForTransaction,
                        ));
                  }
                } else {
                  return SizedBox(
                      height: MediaQuery.of(context).size.height * .495,
                      child: TransactionsViewWidget(
                        // key: const Key("_transaction__"),
                        loggedInUser: paymentsPageViewModel.loggedInUser,
                        w2wTransactionSnapshot: paymentsPageViewModel
                            .outputForTransaction, // paymentsPageViewModel.outputForTransaction,
                      ));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

class TransactionsViewWidget extends StatefulWidget {
  final String loggedInUser;
  final Stream<List<Transaction>>? w2wTransactionSnapshot;

  const TransactionsViewWidget({
    Key? key,
    this.w2wTransactionSnapshot,
    required this.loggedInUser,
  }) : super(key: key);

  @override
  State<TransactionsViewWidget> createState() => _TransactionsViewWidget();
}

class _TransactionsViewWidget extends State<TransactionsViewWidget> {
  bool isTableView = false;
  String expandThis = "";
  @override
  Widget build(BuildContext context) {
    return _buildW2wTransferExpansionPanelStream(context);
  }

  Widget _buildW2wTransferExpansionPanelStream(BuildContext context) {
    return StreamBuilder<List<Transaction>>(
        stream: widget.w2wTransactionSnapshot,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            if (snapshot.data!.isEmpty) {
              return Text("No Data Found");
            } else {
              return _buildW2wTransferExpansionPanel(context, snapshot);
            }
          } else if (snapshot.hasError) {
            return Text(snapshot.error.toString());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        });
  }

  Widget _buildW2wTransferExpansionPanel(
      BuildContext context, AsyncSnapshot<List<Transaction>> snapshot) {
    return SizedBox(
      //height: MediaQuery.of(context).size.height * 0.75,
      width: MediaQuery.of(context).size.width *
          Constant.expandedPanelContainerWidth,
      child: SingleChildScrollView(
        child: ExpansionPanelList(
          expansionCallback: (int index, bool isExpanded) {
            setState(() {
              if (isExpanded) {
                expandThis = "";
              } else {
                expandThis = snapshot.data![index].transactionId;
              }
            });
          },
          children: snapshot.data!.map<ExpansionPanel>((transaction) {
            return ExpansionPanel(
                headerBuilder: (BuildContext context, bool isExpanded) {
                  return ListTile(
                    leading: const CircleAvatar(
                      backgroundColor: ColorManager.circularAvtarColor,
                      child: Icon(
                        Icons.payment,
                        color: ColorManager.blackColor,
                      ),
                    ),
                    title: Text(
                      " ${transaction.transactionDate.day}/${transaction.transactionDate.month}/${transaction.transactionDate.year}",
                      style: Theme.of(context).textTheme.labelLarge,
                    ),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "From: ${transaction.senderUsername}",
                          style: const TextStyle(color: ColorManager.greyColor),
                        ),
                        Text(
                          "To: ${transaction.receiverUsername}",
                          style: const TextStyle(color: ColorManager.greyColor),
                        ),
                      ],
                    ),
                    trailing: transaction.receiverUsername ==
                            widget.loggedInUser
                        ? Text("Rs ${transaction.amount}",
                            style:
                                const TextStyle(color: ColorManager.paymentIn))
                        : Text("Rs ${transaction.amount}",
                            style: const TextStyle(
                                color: ColorManager.paymentOut)),
                  );
                },
                body: W2WTransactionExpandedWidget(transaction: transaction),
                isExpanded: transaction.transactionId == expandThis,
                canTapOnHeader: true);
          }).toList(),
          elevation: 4,
          dividerColor: ColorManager.primaryColor,
          expandIconColor: ColorManager.primaryColor,
          expandedHeaderPadding: const EdgeInsets.all(10),
        ),
      ),
    );
  }
}
