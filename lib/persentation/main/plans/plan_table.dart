import 'package:flutter/material.dart';
import 'package:netify/domain/model/enum_model.dart';
import 'package:netify/domain/model/home_model.dart';
import 'package:netify/persentation/resources/color_manager.dart';

class PlanTable extends StatefulWidget {
  final String screenTypeIdentity;
  final AsyncSnapshot<List<Plans?>>? plansSnapshot;
  final AsyncSnapshot<List<OperatorPriceChart?>>? operatorPriceChartSnapshot;
  final AsyncSnapshot<List<ResellerPriceChart?>>? resellerPriceChartSnapshot;

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
      if (isTableView) {
        return _buildPlanTable(context);
      } else {
        return _buildPlanExpansionPanel(context);
      }
    } else if (widget.screenTypeIdentity ==
        ScreenTypeIdentity.resellerPriceChart) {
      if (isTableView) {
        return _buildResellerPriceChartTable(context);
      } else {
        return _buildResellerPriceChartExpansionPanel(context);
      }
    } else {
      if (isTableView) {
        return _buildOperatorPriceChartTable(context);
      } else {
        return _buildOperatorPriceChartExpansionPanel(context);
      }
    }
  }

  Widget _buildPlanTable(BuildContext context) {
    return SingleChildScrollView(
      //scrollDirection: Axis.horizontal,
      child: DataTable(
          columns: const <DataColumn>[
            DataColumn(
              label: Text(
                'PlanName',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Status',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'Price',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'UpdatedOn',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
            DataColumn(
              label: Text(
                'PlanDescription',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
          rows: widget.plansSnapshot!.data!.map((plan) {
            return DataRow(
              cells: <DataCell>[
                DataCell(Text(plan!.planName)),
                DataCell(Text(plan.isPlanActive.toString())),
                DataCell(Text(plan.planPrice.toString())),
                DataCell(Text(plan.planUpdatedDate.toString())),
                DataCell(Text(plan.planDescription)),
              ],
            );
          }).toList()),
    );
  }

  Widget _buildPlanExpansionPanel(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            if (isExpanded) {
              expandThis = "";
            } else {
              expandThis = widget.plansSnapshot!.data![index]!.planId;
            }
          });
        },
        children: widget.plansSnapshot!.data!.map<ExpansionPanel>((plan) {
          return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(
                    plan.planName,
                    style: const TextStyle(color: ColorManager.primaryColor),
                  ),
                  subtitle:
                      Text(plan.isPlanActive == true ? "Active" : "InActive"),
                  trailing: Text(plan.planPrice.toString()),
                );
              },
              body: _expandedPlanBody(plan),
              isExpanded: plan!.planId == expandThis,
              canTapOnHeader: true);
        }).toList(),
        elevation: 4,
        dividerColor: ColorManager.primaryColor,
        expandIconColor: ColorManager.primaryColor,
        expandedHeaderPadding: const EdgeInsets.all(10),
      ),
    );
  }

  Widget _buildOperatorPriceChartTable(BuildContext context) {
    return const Text("Operator Price Chart Table Widget");
  }

  Widget _buildResellerPriceChartTable(BuildContext context) {
    return const Text("Reseller Price Chart Table Widget");
  }

  Widget _buildResellerPriceChartExpansionPanel(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            if (isExpanded) {
              expandThis = "";
            } else {
              expandThis = widget.resellerPriceChartSnapshot!.data![index]!.id
                  .toString();
            }
          });
        },
        children: widget.resellerPriceChartSnapshot!.data!
            .map<ExpansionPanel>((resellerPriceChart) {
          return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(
                    resellerPriceChart.planName,
                    style: const TextStyle(color: ColorManager.primaryColor),
                  ),
                  subtitle: Text(resellerPriceChart.resellerUserName),
                  trailing: Text(resellerPriceChart.price.toString()),
                );
              },
              body: _expandedResellerPriceChartBody(resellerPriceChart),
              isExpanded: resellerPriceChart!.id.toString() == expandThis,
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
              expandThis = widget.operatorPriceChartSnapshot!.data![index]!.id
                  .toString();
            }
          });
        },
        children: widget.operatorPriceChartSnapshot!.data!
            .map<ExpansionPanel>((operatorPriceChart) {
          return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(
                    operatorPriceChart.planName,
                    style: const TextStyle(color: ColorManager.primaryColor),
                  ),
                  subtitle: Text(operatorPriceChart.operatorUserName),
                  trailing: Text(operatorPriceChart.planPrice.toString()),
                );
              },
              body: _expandedOperatorPriceChartBody(operatorPriceChart),
              isExpanded: operatorPriceChart!.id.toString() == expandThis,
              canTapOnHeader: true);
        }).toList(),
        elevation: 4,
        dividerColor: ColorManager.primaryColor,
        expandIconColor: ColorManager.primaryColor,
        expandedHeaderPadding: const EdgeInsets.all(10),
      ),
    );
  }

  Widget _expandedResellerPriceChartBody(
      ResellerPriceChart? resellerPriceChart) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(TextSpan(
              text: "PlanName: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: resellerPriceChart!.planName,
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "ResellerName: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: resellerPriceChart.resellerUserName,
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "ResellerPrice: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: resellerPriceChart.price.toString(),
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "CreatedOn: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text:
                        "${resellerPriceChart.createdAt.day}/${resellerPriceChart.createdAt.month}/${resellerPriceChart.createdAt.year}",
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "UpdatedOn: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text:
                        "${resellerPriceChart.updatedAt.day}/${resellerPriceChart.updatedAt.month}/${resellerPriceChart.updatedAt.year}",
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
        ],
      ),
    );
  }

  Widget _expandedOperatorPriceChartBody(
      OperatorPriceChart? operatorPriceChart) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(TextSpan(
              text: "PlanName: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: operatorPriceChart!.planName,
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "OperatorUserName: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: operatorPriceChart.operatorUserName,
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "ResellerUserName: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: operatorPriceChart.resellerUserName,
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "OperatorPrice: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: operatorPriceChart.planPrice.toString(),
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "CreatedOn: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text:
                        "${operatorPriceChart.createdAt.day}/${operatorPriceChart.createdAt.month}/${operatorPriceChart.createdAt.year}",
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "UpdatedOn: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text:
                        "${operatorPriceChart.updatedAt.day}/${operatorPriceChart.updatedAt.month}/${operatorPriceChart.updatedAt.year}",
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
        ],
      ),
    );
  }

  Widget _expandedPlanBody(Plans? plan) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(TextSpan(
              text: "PlanName: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: plan!.planName,
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "PlanPrice: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: plan.planPrice.toString(),
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "Status: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: plan.isPlanActive == true ? "Active" : "InActive",
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "PlanCreatedOn: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text:
                        "${plan.planStartDate.day}/${plan.planStartDate.month}/${plan.planStartDate.year}",
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "PlanLastUpdatedOn: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text:
                        "${plan.planUpdatedDate.day}/${plan.planUpdatedDate.month}/${plan.planUpdatedDate.year}",
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "PlanDescription: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: plan.planDescription,
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
        ],
      ),
    );
  }
}
