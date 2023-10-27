import 'package:flutter/material.dart';
import 'package:netify/app/constant.dart';
import 'package:netify/domain/model/billing_model.dart';
import 'package:netify/domain/model/enum_model.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/persentation/common/widgets/display_info_widget.dart';
import 'package:netify/persentation/resources/color_manager.dart';
import 'package:shimmer/shimmer.dart';

typedef OnPanelButtonPress = void Function(
    BuildContext context,
    String buttonName,
    String screenTypeIdentity,
    String buttonType,
    Map<String, dynamic> selectedItem);

class BillingViewWidget extends StatefulWidget {
  final Stream<List<UpcomingRenewals>>? upcomingRenewals;
  final Stream<List<Bills>>? bills;
  final Stream<List<Bills>>? unPaidBills;
  final MainPageModel mainPageModel;
  final OnPanelButtonPress onButtonPress;
  const BillingViewWidget(
      {super.key,
      this.upcomingRenewals,
      this.bills,
      this.unPaidBills,
      required this.mainPageModel,
      required this.onButtonPress});

  @override
  State<BillingViewWidget> createState() => _BillingViewWidgetState();
}

class _BillingViewWidgetState extends State<BillingViewWidget> {
  String expandThis = "";
  @override
  Widget build(BuildContext context) {
    if (widget.mainPageModel.screenTypeIdentity ==
        ScreenTypeIdentity.upcomingRenewals) {
      return SizedBox(
          width: MediaQuery.of(context).size.width *
              Constant.expandedPanelContainerWidth,
          child:
              _upcomingRenewalsStreamBuilder(context, widget.upcomingRenewals));
    } else if (widget.mainPageModel.screenTypeIdentity ==
        ScreenTypeIdentity.bills) {
      return SizedBox(
          width: MediaQuery.of(context).size.width *
              Constant.expandedPanelContainerWidth,
          child: _billsStreamBuilder(context, widget.bills));
    } else if (widget.mainPageModel.screenTypeIdentity ==
        ScreenTypeIdentity.unpaidBills) {
      return SizedBox(
          width: MediaQuery.of(context).size.width *
              Constant.expandedPanelContainerWidth,
          child: _unPaidBillsStreamBuilder(context, widget.unPaidBills));
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .15),
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
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * .15),
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
            return const Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
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
                leading: const CircleAvatar(
                  backgroundColor: ColorManager.circularAvtarColor,
                  child: Icon(
                    Icons.receipt_long_rounded,
                    color: ColorManager.blackColor,
                  ),
                ),
                title: Text(bill.subscriberUserName,
                    style: const TextStyle(color: ColorManager.primaryColor)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("DueDate:${bill.dueDate}"),
                    Text("Amount:${bill.billAmount}"),
                    Text("Status:${bill.status}"),
                  ],
                ),
              );
            },
            body: SingleChildScrollView(
              child: BillExpandedWidget(
                onButtonPress: widget.onButtonPress,
                mainPageModel: widget.mainPageModel,
                bill: bill,
              ),
            ),
            isExpanded: expandThis == bill.billNumber,
            canTapOnHeader: true);
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
                leading: const CircleAvatar(
                  backgroundColor: ColorManager.circularAvtarColor,
                  child: Icon(
                    Icons.receipt_long_rounded,
                    color: ColorManager.blackColor,
                  ),
                ),
                title: Text(upcomingRenewal.subscriberUserName,
                    style: const TextStyle(color: ColorManager.primaryColor)),
                subtitle: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Reseller:${upcomingRenewal.resellerUserName}"),
                    Text("Operator:${upcomingRenewal.operatorUserName}"),
                    // Text("RenewalDate:${upcomingRenewal.nextRenewalDate}"),
                    Text("Status:${upcomingRenewal.subscriptionStatus}"),
                  ],
                ),
              );
            },
            body: UpcomingRenewalsExpandedWidget(
                onButtonPress: widget.onButtonPress,
                mainPageModel: widget.mainPageModel,
                upcomingRenewals: upcomingRenewal),
            isExpanded: expandThis == upcomingRenewal.subscriptionId,
            canTapOnHeader: true);
      }).toList(),
      elevation: 4,
      dividerColor: ColorManager.primaryColor,
      expandIconColor: ColorManager.primaryColor,
      expandedHeaderPadding: const EdgeInsets.all(10),
    ));
  }

  Widget _shimmerWidget() {
    return ConstrainedBox(
        constraints: BoxConstraints(
          maxHeight: MediaQuery.of(context).size.height * 0.60,
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
