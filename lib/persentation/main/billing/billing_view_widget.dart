import 'package:flutter/material.dart';
import 'package:netify/domain/model/billing_model.dart';
import 'package:netify/domain/model/enum_model.dart';
import 'package:netify/persentation/resources/color_manager.dart';
import 'package:shimmer/shimmer.dart';

class BillingViewWidget extends StatefulWidget {
  final String screenTypeIdentity;
  final Stream<List<UpcomingRenewals>>? upcomingRenewals;
  final Stream<List<Bills>>? bills;
  final Stream<List<Bills>>? unPaidBills;
  const BillingViewWidget(
      {super.key,
      required this.screenTypeIdentity,
      this.upcomingRenewals,
      this.bills,
      this.unPaidBills});

  @override
  State<BillingViewWidget> createState() => _BillingViewWidgetState();
}

class _BillingViewWidgetState extends State<BillingViewWidget> {
  String expandThis = "";
  @override
  Widget build(BuildContext context) {
    if (widget.screenTypeIdentity == ScreenTypeIdentity.upcomingRenewals) {
      return _upcomingRenewalsStreamBuilder(context, widget.upcomingRenewals);
    } else if (widget.screenTypeIdentity == ScreenTypeIdentity.bills) {
      return _billsStreamBuilder(context, widget.bills);
    } else if (widget.screenTypeIdentity == ScreenTypeIdentity.unpaidBills) {
      return _unPaidBillsStreamBuilder(context, widget.unPaidBills);
    } else {
      return Container();
    }
  }

  Widget _upcomingRenewalsStreamBuilder(BuildContext context,
      Stream<List<UpcomingRenewals>>? upcomingRenewalsStream) {
    return StreamBuilder(
      stream: upcomingRenewalsStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .35),
                const Center(
                  child: Text("No Data Found"),
                ),
              ],
            );
          }
          return _upcomingRenewalsWidget(context, snapshot.data);
        } else {
          // return const Center(child: CircularProgressIndicator());
          return _shimmerWidget();
        }
      },
    );
  }

  Widget _billsStreamBuilder(
      BuildContext context, Stream<List<Bills>>? billsStream) {
    return StreamBuilder(
      stream: billsStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .35),
                const Center(
                  child: Text("No Data Found"),
                ),
              ],
            );
          }
          return _billsWidget(context, snapshot.data); // _billsWidget(context
        } else {
          // return const Center(child: CircularProgressIndicator());
          return _shimmerWidget();
        }
      },
    );
  }

  Widget _unPaidBillsStreamBuilder(
      BuildContext context, Stream<List<Bills>>? billsStream) {
    return StreamBuilder(
      stream: billsStream,
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          if (snapshot.data!.isEmpty) {
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .35),
                const Center(
                  child: Text("No Data Found"),
                ),
              ],
            );
          }
          return _billsWidget(context, snapshot.data); // _billsWidget(context
        } else {
          // return const Center(child: CircularProgressIndicator());
          return _shimmerWidget();
        }
      },
    );
  }

  Widget _billsWidget(BuildContext context, List<Bills>? bills) {
    return SingleChildScrollView(
        child: ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          expandThis = isExpanded ? "" : bills[index].billNumber;
        });
      },
      children: bills!.map<ExpansionPanel>((Bills bill) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              leading: const Icon(Icons.receipt_long_rounded),
              title: Text(bill.subscriberUserName,
                  style: const TextStyle(color: ColorManager.primaryColor)),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(bill.billPeriod),
                  Text(bill.billAmount.toString()),
                  Text(bill.status),
                ],
              ),
            );
          },
          body: _expandedBills(bill),
          isExpanded: expandThis == bill.billNumber,
        );
      }).toList(),
      elevation: 4,
      dividerColor: ColorManager.primaryColor,
      expandIconColor: ColorManager.primaryColor,
      expandedHeaderPadding: const EdgeInsets.all(10),
    ));
  }

  Widget _upcomingRenewalsWidget(
      BuildContext context, List<UpcomingRenewals>? upcomingRenewals) {
    return SingleChildScrollView(
        child: ExpansionPanelList(
      expansionCallback: (int index, bool isExpanded) {
        setState(() {
          expandThis = isExpanded ? "" : upcomingRenewals[index].subscriptionId;
        });
      },
      children: upcomingRenewals!
          .map<ExpansionPanel>((UpcomingRenewals upcomingRenewal) {
        return ExpansionPanel(
          headerBuilder: (BuildContext context, bool isExpanded) {
            return ListTile(
              leading: const Icon(Icons.receipt_long_outlined),
              title: Text(
                upcomingRenewal.subscriberUserName,
                style: const TextStyle(color: ColorManager.primaryColor),
              ),
              subtitle: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(upcomingRenewal.resellerUserName),
                  Text(upcomingRenewal.operatorUserName),
                  Text(upcomingRenewal.nextRenewalDate),
                ],
              ),
            );
          },
          body: _expandedUpcomingRenewals(upcomingRenewal),
          isExpanded: expandThis == upcomingRenewal.subscriptionId,
        );
      }).toList(),
      elevation: 4,
      dividerColor: ColorManager.primaryColor,
      expandIconColor: ColorManager.primaryColor,
      expandedHeaderPadding: const EdgeInsets.all(10),
    ));
  }

  Widget _expandedUpcomingRenewals(UpcomingRenewals? upcomingRenewals) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(TextSpan(
                text: "Subscriber Name: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: upcomingRenewals!.subscriberName,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Subscriber UserName: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: upcomingRenewals.subscriberUserName,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Subscriber Email: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: upcomingRenewals.subscriberEmail,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Reseller UserName: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: upcomingRenewals.resellerUserName,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Operator UserName: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: upcomingRenewals.operatorUserName,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "SubscriptionId: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: upcomingRenewals.subscriptionId.length > 10
                          ? "${upcomingRenewals.subscriptionId.substring(0, 4)}...${upcomingRenewals.subscriptionId.substring(upcomingRenewals.subscriptionId.length - 4, upcomingRenewals.subscriptionId.length)}"
                          : upcomingRenewals.subscriptionId,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Subscription Status: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: upcomingRenewals.subscriptionStatus,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Plan Name: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: upcomingRenewals.planName,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Plan Price: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: upcomingRenewals.offeredPrice.toString(),
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "IP Type: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: upcomingRenewals.ipType,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "IP Type: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: upcomingRenewals.ipType,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Network Type: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: upcomingRenewals.networkType,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "IP Type: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: upcomingRenewals.ipType,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Last Renewal Date: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: upcomingRenewals.lastRenewalDate,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Next Renewal Date: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: upcomingRenewals.nextRenewalDate,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
  }

  Widget _expandedBills(Bills? bills) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        const SizedBox(
          width: 10,
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text.rich(TextSpan(
                text: "Subscriber Name: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: bills!.subscriberName,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Subscriber UserName: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: bills.subscriberUserName,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Operator Name: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: bills.operatorName,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Operator UserName: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: bills.operatorUserName,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Reseller Name: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: bills.resellerName,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Reseller UserName: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: bills.resellerUserName,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Plan Name: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: bills.planName,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Bill Number: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: bills.billNumber.length > 10
                          ? "${bills.billNumber.substring(0, 5)}...${bills.billNumber.substring(bills.billNumber.length - 4, bills.billNumber.length)}"
                          : bills.billNumber,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Bill Period: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: bills.billPeriod,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Due Date: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: bills.dueDate.toString(),
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Bill Amount: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: bills.billAmount.toString(),
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Next Billing Date: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: bills.nextBillingDate.toString(),
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Status: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: bills.status,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Created At: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: bills.createdAt.toString(),
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Updated At: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: bills.updatedAt.toString(),
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
          ],
        ),
        const SizedBox(
          width: 10,
        ),
      ],
    );
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
}
