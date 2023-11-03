import 'package:flutter/material.dart';
import 'package:netify/domain/model/billing_model.dart';
import 'package:netify/domain/model/enum_model.dart';
import 'package:netify/domain/model/home_model.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/model/plan_model.dart';
import 'package:netify/domain/model/wallet_model.dart';
import 'package:netify/persentation/resources/color_manager.dart';
import 'package:netify/persentation/resources/values_manager.dart';

typedef OnPanelButtonPress = void Function(
    BuildContext context,
    String buttonName,
    String screenTypeIdentity,
    String buttonType,
    Map<String, dynamic> selectedItem);

class PanelButtonManager extends StatelessWidget {
  final List<PanelButton> panelButtons;
  final MainPageModel mainPageModel;
  final int maxButtonInRow;
  final Map<String, dynamic> selectedItem;
  final OnPanelButtonPress onButtonPress;
  const PanelButtonManager(
      {super.key,
      required this.panelButtons,
      required this.maxButtonInRow,
      required this.mainPageModel,
      required this.selectedItem,
      required this.onButtonPress});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int item = 0; item < panelButtons.length; item += maxButtonInRow)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                for (int subItem = 0; subItem < maxButtonInRow; subItem++,)
                  if (item + subItem < panelButtons.length)
                    SizedBox(
                      //height: MediaQuery.of(context).size.height * .05,
                      width: MediaQuery.of(context).size.width * .35,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: AppPadding.p2),
                        child: //panelButtons[item],
                            Tooltip(
                          message: panelButtons[item + subItem].details,
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: Color(int.parse(
                                    panelButtons[item + subItem].color))),
                            onPressed: _isButtonDisabled(
                                    panelButtons[item + subItem].disable)
                                ? null
                                : () {
                                    onButtonTap(
                                        context,
                                        panelButtons[item + subItem].name,
                                        panelButtons[item + subItem].type,
                                        panelButtons[item + subItem]
                                            .extractInfo);
                                  },
                            child: Text(panelButtons[item + subItem].label),
                          ),
                        ),
                      ),
                    )
              ],
            ),
          )
      ],
    );
  }

  bool _isButtonDisabled(Map<String, List<String>> disableInfo) {
    bool isDisabled = false;
    if (disableInfo.isNotEmpty) {
      for (int item = 0; item < disableInfo.keys.length; item++) {
        if (disableInfo[disableInfo.keys.elementAt(item)]!
            .contains(selectedItem[disableInfo.keys.elementAt(item)])) {
          isDisabled = true;
          break;
        }
      }
    }
    return isDisabled;
  }

  onButtonTap(BuildContext context, String buttonName, String buttonType,
      List<String> keysToExtract) {
    if (keysToExtract.isNotEmpty) {
      Map<String, dynamic> extractedInfo = {};
      for (int item = 0; item < keysToExtract.length; item++) {
        extractedInfo[keysToExtract[item]] = selectedItem[keysToExtract[item]];
      }
      onButtonPress(context, buttonName, mainPageModel.screenTypeIdentity,
          buttonType, extractedInfo);
    } else {}
  }
}

class GroupWidget extends StatelessWidget {
  final Map<String, List<String>> groupList;
  const GroupWidget({super.key, required this.groupList});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (int item = 0; item < groupList.length; item += 2)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: AppPadding.p2),
            child: Row(
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width * .40,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      FittedBox(
                          child: Text(
                        groupList.keys.elementAt(item),
                        style: Theme.of(context).textTheme.labelSmall,
                      )),
                      for (int subItem = 0;
                          subItem < groupList.values.elementAt(item).length;
                          subItem++)
                        if (groupList.values
                                .elementAt(item)
                                .elementAt(subItem) !=
                            "")
                          FittedBox(
                              child: Text(
                                  groupList.values
                                      .elementAt(item)
                                      .elementAt(subItem),
                                  style:
                                      Theme.of(context).textTheme.labelMedium))
                        else
                          FittedBox(
                              child: Text(
                            "NA",
                            style: Theme.of(context).textTheme.labelMedium,
                          ))
                    ],
                  ),
                ),
                if (item + 1 < groupList.length)
                  SizedBox(
                    width: MediaQuery.of(context).size.width * .40,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        FittedBox(
                            child: Text(groupList.keys.elementAt(item + 1),
                                style: Theme.of(context).textTheme.labelSmall)),
                        for (int subItem = 0;
                            subItem <
                                groupList.values.elementAt(item + 1).length;
                            subItem++)
                          if (groupList.values
                                  .elementAt(item + 1)
                                  .elementAt(subItem) !=
                              "")
                            FittedBox(
                              child: Text(
                                  groupList.values
                                      .elementAt(item + 1)
                                      .elementAt(subItem),
                                  style:
                                      Theme.of(context).textTheme.labelMedium),
                            )
                          else
                            FittedBox(
                                child: Text(
                              "NA",
                              style: Theme.of(context).textTheme.labelMedium,
                            ))
                      ],
                    ),
                  ),
              ],
            ),
          )
      ],
    );
  }
}

class ExpandedUserWidget extends StatelessWidget {
  final User user;
  const ExpandedUserWidget({super.key, required this.user});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorManager.secondaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: AppPadding.p16),
            child: GroupWidget(groupList: {
              'Name': ['${user.firstName} ${user.lastName}'],
              'UserName': [user.userName],
              'Mobile': [(user.mobileNumber)],
              'Email': [user.email]
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: AppPadding.p16),
            child: GroupWidget(groupList: {
              'Role': [user.role],
              'Status': [user.status]
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: AppPadding.p16),
            child: GroupWidget(groupList: {
              'Company Name': [user.companyName],
              'Brand Name': [user.brandName],
              'GST Number': [user.gstNumber],
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: AppPadding.p16),
            child: GroupWidget(groupList: {
              'Address': [
                user.address,
                user.city,
                user.state,
                user.country,
                user.pincode
              ],
            }),
          ),
        ]),
      ),
    );
  }
}

class SubscriberExpandedWidget extends StatelessWidget {
  final Subscriber subscriber;
  const SubscriberExpandedWidget({super.key, required this.subscriber});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorManager.secondaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: AppPadding.p16),
            child: GroupWidget(groupList: {
              'Name': ['${subscriber.firstName} ${subscriber.lastName}'],
              'UserName': [subscriber.userName],
              'Mobile': [(subscriber.mobileNumber)],
              'Email': [subscriber.email],
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: AppPadding.p16),
            child: GroupWidget(groupList: {
              'Reseller': [subscriber.resellerUserName],
              'Operator': [subscriber.operatorUserName]
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: AppPadding.p16),
            child: GroupWidget(groupList: {
              'Company Name': [subscriber.companyName],
              'Brand Name': [subscriber.brandName],
              'GST Number': [subscriber.gstNumber],
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: AppPadding.p16),
            child: GroupWidget(groupList: {
              'Permanent Address': [
                subscriber.permanentAddress.streetAddress,
                subscriber.permanentAddress.city,
                subscriber.permanentAddress.state,
                subscriber.permanentAddress.country,
                subscriber.permanentAddress.postalcode
              ],
              "Billing Address": [
                subscriber.billingAddress.streetAddress,
                subscriber.billingAddress.city,
                subscriber.billingAddress.state,
                subscriber.billingAddress.country,
                subscriber.billingAddress.postalcode
              ],
            }),
          ),
        ]),
      ),
    );
  }
}

class SubscriptionExpandedWidget extends StatelessWidget {
  final Subscription subscription;
  const SubscriptionExpandedWidget({super.key, required this.subscription});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorManager.secondaryColor,
      ),
      child: Padding(
        padding: const EdgeInsets.all(AppPadding.p20),
        child: Column(children: [
          Padding(
            padding: const EdgeInsets.only(bottom: AppPadding.p16),
            child: GroupWidget(groupList: {
              'Reseller': [subscription.resellerUserName],
              'Opeartor': [subscription.operatorUserName],
              'Subscriber UserName': [subscription.subscriberUserName],
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: AppPadding.p16),
            child: GroupWidget(groupList: {
              'Security Deposit': [subscription.securityDeposit.toString()],
              'Installation Cost': [subscription.installationCharge.toString()],
            }),
          ),
          if (subscription.ipType == "dynamic")
            Padding(
              padding: const EdgeInsets.only(bottom: AppPadding.p16),
              child: GroupWidget(groupList: {
                'Network Type': [subscription.networkType],
                'IP Type': [subscription.ipType],
              }),
            ),
          if (subscription.ipType == "static")
            Padding(
              padding: const EdgeInsets.only(bottom: AppPadding.p16),
              child: GroupWidget(groupList: {
                'Network Type': [subscription.networkType],
                'IP Type': [subscription.ipType],
                'Assigned IP': [subscription.assignedIp],
              }),
            ),
          Padding(
            padding: const EdgeInsets.only(bottom: AppPadding.p16),
            child: GroupWidget(groupList: {
              'Plan Name': [(subscription.planName)],
              'Plan Base Price': [subscription.basePrice.toString()],
              'Plan Offered Price': [subscription.offeredPrice.toString()],
              'Subscription Date': [
                '${subscription.subscriptionDate.day}/${subscription.subscriptionDate.month}/${subscription.subscriptionDate.year}'
              ],
              'Subscription Status': [subscription.status],
              'Last Renewal Date': [
                '${subscription.lastRenewalDate.day}/${subscription.lastRenewalDate.month}/${subscription.lastRenewalDate.year}'
              ],
              'Next Renewal Date': [
                '${subscription.nextRenewalDate.day}/${subscription.nextRenewalDate.month}/${subscription.nextRenewalDate.year}'
              ],
            }),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: AppPadding.p16),
            child: GroupWidget(groupList: {
              'Permanent Address': [
                subscription.permanentAddress.streetAddress,
                subscription.permanentAddress.city,
                subscription.permanentAddress.state,
                subscription.permanentAddress.country,
                subscription.permanentAddress.postalcode
              ],
              "Billing Address": [
                subscription.billingAddress.streetAddress,
                subscription.billingAddress.city,
                subscription.billingAddress.state,
                subscription.billingAddress.country,
                subscription.billingAddress.postalcode
              ],
              "Installation Address": [
                subscription.installationAddress.streetAddress,
                subscription.installationAddress.city,
                subscription.installationAddress.state,
                subscription.installationAddress.country,
                subscription.installationAddress.postalcode
              ],
            }),
          ),
        ]),
      ),
    );
  }
}

class PlanExpandedWidget extends StatelessWidget {
  final Plans plan;
  const PlanExpandedWidget({super.key, required this.plan});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: ColorManager.secondaryColor,
        ),
        child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(bottom: AppPadding.p16),
                child: GroupWidget(groupList: {
                  'Plan Name': [plan.planName],
                  'Plan Type': [plan.planType],
                  'Plan Price': [plan.planPrice.toString()],
                  'Plan Validity': [plan.planValidity.toString()],
                  //  'Plan Description': [plan.planDescription],
                }),
              ),
              if (plan.planType != "FUP")
                Padding(
                  padding: const EdgeInsets.only(bottom: AppPadding.p16),
                  child: GroupWidget(groupList: {
                    'Upload Speed': [
                      plan.uploadSpeed.toString(),
                    ],
                    'Download Speed': [plan.downloadSpeed.toString()],
                    'Data Limit': [plan.dataLimit.toString()],
                  }),
                ),
              if (plan.planType == "FUP")
                Padding(
                  padding: const EdgeInsets.only(bottom: AppPadding.p16),
                  child: GroupWidget(groupList: {
                    'Upload Speed': [
                      plan.uploadSpeed.toString(),
                    ],
                    'Download Speed': [plan.downloadSpeed.toString()],
                    'Data Limit': [plan.dataLimit.toString()],
                    'FUP Upload Speed': [
                      plan.uploadSpeedFUP.toString(),
                    ],
                    'FUP Download Speed': [plan.downloadSpeedFUP.toString()],
                    'FUP Data Limit': [plan.dataLimitFUP.toString()],
                  }),
                ),
              Padding(
                padding: const EdgeInsets.only(bottom: AppPadding.p16),
                child: GroupWidget(groupList: {
                  'Created On': [
                    "${plan.planStartDate.day}/${plan.planStartDate.month}/${plan.planStartDate.year}"
                  ],
                  'Last Updated On': [
                    "${plan.planUpdatedDate.day}/${plan.planUpdatedDate.month}/${plan.planUpdatedDate.year}"
                  ],
                }),
              ),
            ])));
  }
}

class ResellerPriceChartExpandedWidget extends StatelessWidget {
  final ResellerPriceChart resellerPriceChart;
  const ResellerPriceChartExpandedWidget(
      {super.key, required this.resellerPriceChart});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: ColorManager.secondaryColor,
        ),
        child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(bottom: AppPadding.p16),
                child: GroupWidget(groupList: {
                  'Plan Name': [resellerPriceChart.planName],
                  'Reseller': [resellerPriceChart.resellerUserName],
                  'Reseller Price': [resellerPriceChart.price.toString()],
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: AppPadding.p16),
                child: GroupWidget(groupList: {
                  'Deal Created On': [
                    "${resellerPriceChart.createdAt.day}/${resellerPriceChart.createdAt.month}/${resellerPriceChart.createdAt.year}"
                  ],
                  'Deal Last Updated On': [
                    "${resellerPriceChart.updatedAt.day}/${resellerPriceChart.updatedAt.month}/${resellerPriceChart.updatedAt.year}"
                  ],
                }),
              ),
            ])));
  }
}

class OperatorPriceChartExpandedWidget extends StatelessWidget {
  final OperatorPriceChart operatorPriceChart;

  const OperatorPriceChartExpandedWidget(
      {super.key, required this.operatorPriceChart});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: ColorManager.secondaryColor,
        ),
        child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(bottom: AppPadding.p16),
                child: GroupWidget(groupList: {
                  'Plan Name': [operatorPriceChart.planName],
                  'Reseller': [operatorPriceChart.resellerUserName],
                  'Operator Price': [operatorPriceChart.planPrice.toString()],
                  'Operator': [operatorPriceChart.operatorUserName],
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: AppPadding.p16),
                child: GroupWidget(groupList: {
                  'Deal Created On': [
                    "${operatorPriceChart.createdAt.day}/${operatorPriceChart.createdAt.month}/${operatorPriceChart.createdAt.year}"
                  ],
                  'Deal Last Updated On': [
                    "${operatorPriceChart.updatedAt.day}/${operatorPriceChart.updatedAt.month}/${operatorPriceChart.updatedAt.year}"
                  ],
                }),
              ),
            ])));
  }
}

class UpcomingRenewalsExpandedWidget extends StatelessWidget {
  final UpcomingRenewals upcomingRenewals;
  final MainPageModel mainPageModel;
  final OnPanelButtonPress onButtonPress;
  const UpcomingRenewalsExpandedWidget(
      {super.key,
      required this.upcomingRenewals,
      required this.mainPageModel,
      required this.onButtonPress});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: ColorManager.secondaryColor,
        ),
        child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(bottom: AppPadding.p16),
                child: GroupWidget(groupList: {
                  'Subscriber Name': [upcomingRenewals.subscriberName],
                  'Subscriber UserName': [upcomingRenewals.subscriberUserName],
                  'Reseller UserName': [upcomingRenewals.resellerUserName],
                  'Operator UserName': [upcomingRenewals.operatorUserName],
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: AppPadding.p16),
                child: GroupWidget(groupList: {
                  'Subscription Id': [
                    upcomingRenewals.subscriptionId.length > 10
                        ? "${upcomingRenewals.subscriptionId.substring(0, 4)}...${upcomingRenewals.subscriptionId.substring(upcomingRenewals.subscriptionId.length - 4, upcomingRenewals.subscriptionId.length)}"
                        : upcomingRenewals.subscriptionId,
                  ],
                  'Subscription Status': [upcomingRenewals.subscriptionStatus],
                  'Plan Name': [upcomingRenewals.planName],
                  'Plan Price': [upcomingRenewals.offeredPrice.toString()],
                  'IP Type': [upcomingRenewals.ipType],
                  'Network Type': [upcomingRenewals.networkType],
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: AppPadding.p16),
                child: GroupWidget(groupList: {
                  'Last Renewal Date': [upcomingRenewals.lastRenewalDate],
                  'Next Renewal Date': [upcomingRenewals.nextRenewalDate],
                }),
              ),
              PanelButtonManager(
                onButtonPress: onButtonPress,
                panelButtons: mainPageModel.actionButtons,
                mainPageModel: mainPageModel,
                maxButtonInRow: 2,
                selectedItem: upcomingRenewals.toJson(),
              ),
            ])));
  }
}

class BillExpandedWidget extends StatelessWidget {
  final Bills bill;
  final MainPageModel mainPageModel;
  final OnPanelButtonPress onButtonPress;
  const BillExpandedWidget(
      {super.key,
      required this.bill,
      required this.mainPageModel,
      required this.onButtonPress});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: ColorManager.secondaryColor,
        ),
        child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              Padding(
                padding: const EdgeInsets.only(bottom: AppPadding.p16),
                child: GroupWidget(groupList: {
                  'Subscriber Name': [bill.subscriberName],
                  'Subscriber UserName': [bill.subscriberUserName],
                  'ResellerName': [bill.resellerName],
                  'Reseller UserName': [bill.resellerUserName],
                  'Operator Name': [bill.operatorName],
                  'Operator UserName': [bill.operatorUserName],
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: AppPadding.p16),
                child: GroupWidget(groupList: {
                  'Bill Number': [
                    bill.billNumber.length > 10
                        ? "${bill.billNumber.substring(0, 5)}...${bill.billNumber.substring(bill.billNumber.length - 4, bill.billNumber.length)}"
                        : bill.billNumber,
                  ],
                  'Plan Name': [bill.planName],
                  'Status': [bill.status],
                  'Due Date': [bill.dueDate],
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: AppPadding.p16),
                child: GroupWidget(groupList: {
                  'Bill Period': [bill.billPeriod],
                  'Next Billing Date': [bill.nextBillingDate],
                  'Created On': [
                    "${bill.createdAt.day}/${bill.createdAt.month}/${bill.createdAt.year}"
                  ],
                  'Updated On': [
                    "${bill.updatedAt.day}/${bill.updatedAt.month}/${bill.updatedAt.year}"
                  ],
                }),
              ),
              PanelButtonManager(
                onButtonPress: onButtonPress,
                panelButtons: mainPageModel.actionButtons,
                mainPageModel: mainPageModel,
                maxButtonInRow: 2,
                selectedItem: bill.toJson(),
              ),
            ])));
  }
}

class W2WTransactionExpandedWidget extends StatelessWidget {
  final Transaction transaction;
  const W2WTransactionExpandedWidget({super.key, required this.transaction});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: const BoxDecoration(
          color: ColorManager.secondaryColor,
        ),
        child: Padding(
            padding: const EdgeInsets.all(AppPadding.p20),
            child: Column(children: [
              Padding(
                padding: const EdgeInsets.only(bottom: AppPadding.p16),
                child: GroupWidget(groupList: {
                  'Sender': [transaction.senderUsername],
                  'Receiver': [transaction.receiverUsername],
                  'Amount': [transaction.amount.toString()],
                  'Status': [transaction.transactionStatus],
                  'Transaction Type': [transaction.transactionType],
                }),
              ),
              if (transaction.transactionType == TransactionType.offlineSale)
                Padding(
                  padding: const EdgeInsets.only(bottom: AppPadding.p16),
                  child: GroupWidget(groupList: {
                    'Bill Number': [
                      "${transaction.billNumber!.substring(0, 5)}...${transaction.billNumber!.substring(transaction.billNumber!.length - 4, transaction.billNumber!.length)}"
                    ],
                    'Bill Amount': [transaction.billAmount!.toString()],
                  }),
                ),
              if (transaction.transactionStatus == TranasctionStatus.success)
                Padding(
                  padding: const EdgeInsets.only(bottom: AppPadding.p16),
                  child: GroupWidget(groupList: {
                    'Opening Balance': [transaction.openingBalance.toString()],
                    'Closing Balance': [transaction.closingBalance.toString()],
                  }),
                ),
              Padding(
                padding: const EdgeInsets.only(bottom: AppPadding.p16),
                child: GroupWidget(groupList: {
                  'Transaction Date': [
                    "${transaction.transactionDate.day}/${transaction.transactionDate.month}/${transaction.transactionDate.year}"
                  ],
                  'Transaction Time': [
                    "${transaction.transactionDate.hour}:${transaction.transactionDate.minute}:${transaction.transactionDate.second}"
                  ],
                }),
              ),
              Padding(
                padding: const EdgeInsets.only(bottom: AppPadding.p16),
                child: GroupWidget(groupList: {
                  "Remarks": [transaction.remarks!]
                }),
              ),
            ])));
  }
}

class SalesExpandedWidget extends StatelessWidget {
  final Sale sale;
  const SalesExpandedWidget({super.key, required this.sale});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: ColorManager.secondaryColor,
      ),
      child: Padding(
          padding: const EdgeInsets.all(AppPadding.p20),
          child: Column(children: [
            Padding(
              padding: const EdgeInsets.only(bottom: AppPadding.p16),
              child: GroupWidget(groupList: {
                'Bill Number': [
                  "${sale.billNumber.substring(0, 5)}...${sale.billNumber.substring(sale.billNumber.length - 4, sale.billNumber.length)}"
                ],
                'Bill Amount': [sale.billAmount.toString()],
                'Basic Bill Amount': [sale.basicBillAmount.toString()],
                'Bill Components': [sale.billAmountComponents],
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: AppPadding.p16),
              child: GroupWidget(groupList: {
                'Operator': [sale.operatorUserName],
                'Reseller': [sale.resellerUserName],
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: AppPadding.p16),
              child: GroupWidget(groupList: {
                'Plan Name': [sale.planName],
                'Plan Basic Cost': [sale.planBasicCost.toString()],
                'Plan Offered Cost': [sale.planOfferedCost.toString()],
                'Your Tax Share': [sale.planTax.toString()],
                'Total Tax Collected': [sale.totalTaxCollected.toString()],
                'Profit': [sale.planProfit.toString()],
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: AppPadding.p16),
              child: GroupWidget(groupList: {
                'SaleTime': [
                  "${sale.createdAt.day}/${sale.createdAt.month}/${sale.createdAt.year}"
                ],
              }),
            ),
          ])),
    );
  }
}
