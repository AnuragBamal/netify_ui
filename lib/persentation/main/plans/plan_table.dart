import 'package:flutter/material.dart';
import 'package:netify/app/constant.dart';
import 'package:netify/domain/model/enum_model.dart';
import 'package:netify/domain/model/plan_model.dart';
import 'package:netify/persentation/common/widgets/display_info_widget.dart';
import 'package:netify/persentation/resources/color_manager.dart';

class PlanTable extends StatefulWidget {
  final String screenTypeIdentity;
  final List<Plans>? plansSnapshot;
  final List<OperatorPriceChart>? operatorPriceChartSnapshot;
  final List<ResellerPriceChart>? resellerPriceChartSnapshot;

  const PlanTable(
      {Key? key,
      required this.screenTypeIdentity,
      this.plansSnapshot,
      this.operatorPriceChartSnapshot,
      this.resellerPriceChartSnapshot})
      : super(key: key);

  @override
  State<PlanTable> createState() => _PlanTableState();
}

class _PlanTableState extends State<PlanTable> {
  bool isTableView = false;
  String expandThis = "";
  @override
  Widget build(BuildContext context) {
    if (widget.screenTypeIdentity == ScreenTypeIdentity.plans) {
      return SizedBox(
          width: MediaQuery.of(context).size.width *
              Constant.expandedPanelContainerWidth,
          child: _buildPlanExpansionPanel(context));
    } else if (widget.screenTypeIdentity ==
        ScreenTypeIdentity.resellerPriceChart) {
      return SizedBox(
          width: MediaQuery.of(context).size.width *
              Constant.expandedPanelContainerWidth,
          child: _buildResellerPriceChartExpansionPanel(context));
    } else {
      return SizedBox(
          width: MediaQuery.of(context).size.width *
              Constant.expandedPanelContainerWidth,
          child: _buildOperatorPriceChartExpansionPanel(context));
    }
  }

  Widget _buildPlanExpansionPanel(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            if (isExpanded) {
              expandThis = "";
            } else {
              expandThis = widget.plansSnapshot![index].planId;
            }
          });
        },
        children: widget.plansSnapshot!.map<ExpansionPanel>((Plans plan) {
          return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: ColorManager.circularAvtarColor,
                    child: Icon(
                      Icons.webhook_outlined,
                      color: ColorManager.blackColor,
                    ),
                  ),
                  title: Text(
                    plan.planName,
                    style: const TextStyle(color: ColorManager.primaryColor),
                  ),
                  subtitle:
                      Text(plan.isPlanActive == true ? "Active" : "InActive"),
                  trailing: Text(plan.planPrice.toString()),
                );
              },
              body: PlanExpandedWidget(plan: plan),
              isExpanded: plan.planId == expandThis,
              canTapOnHeader: true);
        }).toList(),
        elevation: 4,
        dividerColor: ColorManager.primaryColor,
        expandIconColor: ColorManager.primaryColor,
        expandedHeaderPadding: const EdgeInsets.all(10),
      ),
    );
  }

  Widget _buildResellerPriceChartExpansionPanel(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            if (isExpanded) {
              expandThis = "";
            } else {
              expandThis =
                  widget.resellerPriceChartSnapshot![index].id.toString();
            }
          });
        },
        children: widget.resellerPriceChartSnapshot!
            .map<ExpansionPanel>((resellerPriceChart) {
          return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: ColorManager.circularAvtarColor,
                    child: Icon(
                      Icons.table_rows_outlined,
                      color: ColorManager.blackColor,
                    ),
                  ),
                  title: Text(
                    resellerPriceChart.planName,
                    style: const TextStyle(color: ColorManager.primaryColor),
                  ),
                  subtitle: Text(resellerPriceChart.resellerUserName),
                  trailing: Text(resellerPriceChart.price.toString()),
                );
              },
              body: ResellerPriceChartExpandedWidget(
                  resellerPriceChart: resellerPriceChart),
              isExpanded: resellerPriceChart.id.toString() == expandThis,
              canTapOnHeader: true);
        }).toList(),
        elevation: 4,
        dividerColor: ColorManager.primaryColor,
        expandIconColor: ColorManager.primaryColor,
        expandedHeaderPadding: const EdgeInsets.all(10),
      ),
    );
  }

  Widget _buildOperatorPriceChartExpansionPanel(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            if (isExpanded) {
              expandThis = "";
            } else {
              expandThis =
                  widget.operatorPriceChartSnapshot![index].id.toString();
            }
          });
        },
        children: widget.operatorPriceChartSnapshot!
            .map<ExpansionPanel>((operatorPriceChart) {
          return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  leading: const CircleAvatar(
                    backgroundColor: ColorManager.circularAvtarColor,
                    child: Icon(
                      Icons.table_rows_outlined,
                      color: ColorManager.blackColor,
                    ),
                  ),
                  title: Text(
                    operatorPriceChart.planName,
                    style: const TextStyle(color: ColorManager.primaryColor),
                  ),
                  subtitle: Text(operatorPriceChart.operatorUserName),
                  trailing: Text(operatorPriceChart.planPrice.toString()),
                );
              },
              body: OperatorPriceChartExpandedWidget(
                  operatorPriceChart: operatorPriceChart),
              isExpanded: operatorPriceChart.id.toString() == expandThis,
              canTapOnHeader: true);
        }).toList(),
        elevation: 4,
        dividerColor: ColorManager.primaryColor,
        expandIconColor: ColorManager.primaryColor,
        expandedHeaderPadding: const EdgeInsets.all(10),
      ),
    );
  }
}
