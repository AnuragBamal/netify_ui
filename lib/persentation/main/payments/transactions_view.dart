import 'package:flutter/material.dart';
import 'package:netify/app/constant.dart';
import 'package:netify/domain/model/wallet_model.dart';
import 'package:netify/persentation/common/widgets/display_info_widget.dart';
import 'package:netify/persentation/resources/color_manager.dart';

class TransactionsViewWidget extends StatefulWidget {
  final String transactionType;
  final String loggedInUser;
  final Stream<List<Transaction>>? w2wTransactionSnapshot;

  const TransactionsViewWidget({
    Key? key,
    required this.transactionType,
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
    if (widget.transactionType == "w2w") {
      return _buildW2wTransferExpansionPanelStream(context);
    } else {
      return Container();
    }
  }

  Widget _buildW2wTransferExpansionPanelStream(BuildContext context) {
    return StreamBuilder<List<Transaction>>(
        stream: widget.w2wTransactionSnapshot,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return _buildW2wTransferExpansionPanel(context, snapshot);
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
      height: MediaQuery.of(context).size.height * 0.75,
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
                      "Transaction Id: ${transaction.transactionId}",
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

  Widget _expandedW2wTransferPanel(Transaction? transaction) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text.rich(TextSpan(
          //     text: "Transaction Id: ",
          //     style: Theme.of(context).textTheme.labelLarge,
          //     children: [
          //       TextSpan(
          //           text: transaction!.transactionId,
          //           style: Theme.of(context).textTheme.labelMedium)
          //     ])),
          Text.rich(TextSpan(
              text: "Transaction Type: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: transaction!.transactionType,
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "Transaction Date: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text:
                        "${transaction.transactionDate.day}-${transaction.transactionDate.month}-${transaction.transactionDate.year}",
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "Transaction Time: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text:
                        "${transaction.transactionDate.hour}:${transaction.transactionDate.minute}:${transaction.transactionDate.second}",
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "Amount: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: transaction.amount.toString(),
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "Sender: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: transaction.senderUsername,
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "Receiver: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: transaction.receiverUsername,
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "Status: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: transaction.transactionStatus,
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
        ],
      ),
    );
  }
}
