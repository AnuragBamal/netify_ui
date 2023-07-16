import 'package:flutter/material.dart';
import 'package:netify/domain/model/enum_model.dart';
import 'package:netify/domain/model/home_model.dart';
import 'package:netify/persentation/resources/color_manager.dart';

class ExpandedPanelWidget extends StatefulWidget {
  final String dataTypeIdentity;
  final List<User>? userItemSnapshot;
  final List<Subscription>? subscriptionItemSnapshot;
  final List<Subscriber>? subscriberItemSnapshot;
  const ExpandedPanelWidget(
      {Key? key,
      required this.dataTypeIdentity,
      this.userItemSnapshot,
      this.subscriberItemSnapshot,
      this.subscriptionItemSnapshot})
      : super(key: key);

  @override
  State<ExpandedPanelWidget> createState() => _ExpandedPanelWidgetState();
}

class _ExpandedPanelWidgetState extends State<ExpandedPanelWidget> {
  String expandThis = "";
  @override
  Widget build(BuildContext context) {
    if (widget.dataTypeIdentity == DataTypeIdentity.user) {
      return userExpansionBuilder(context);
    } else if (widget.dataTypeIdentity == DataTypeIdentity.subscription) {
      return subscriptionExpansionBuilder(context);
    } else if (widget.dataTypeIdentity == DataTypeIdentity.subscriber) {
      return subscriberExpansionBuilder(context);
    } else {
      return Container();
    }
  }

  Widget userExpansionBuilder(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            if (isExpanded) {
              expandThis = "";
            } else {
              expandThis = widget.userItemSnapshot![index].userId;
            }
          });
        },
        children: widget.userItemSnapshot!.map<ExpansionPanel>((User user) {
          return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(
                    user.userName,
                    style: const TextStyle(color: ColorManager.primaryColor),
                  ),
                  subtitle: Text(user.companyName),
                  trailing: Text(user.mobileNumber),
                );
              },
              body: _expandedUserBody(user),
              isExpanded: user.userId == expandThis,
              canTapOnHeader: true);
        }).toList(),
        elevation: 4,
        dividerColor: ColorManager.primaryColor,
        expandIconColor: ColorManager.primaryColor,
        expandedHeaderPadding: const EdgeInsets.all(10),
      ),
    );
  }

  Widget _expandedUserBody(User user) {
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
                text: "Name: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: "${user.firstName} ${user.lastName}",
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "UserName: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: user.userName,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Mobile: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: user.mobileNumber,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Email: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: user.email,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Role: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: user.role,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Status: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: user.status,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "GST Number: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: user.gstNumber,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Company Name: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: user.companyName,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Brand Name: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: user.brandName,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Address: \n",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: "          ${user.address}\n",
                      style: Theme.of(context).textTheme.labelMedium),
                  TextSpan(
                      text: "          ${user.city}\n",
                      style: Theme.of(context).textTheme.labelMedium),
                  TextSpan(
                      text: "          ${user.state}\n",
                      style: Theme.of(context).textTheme.labelMedium),
                  TextSpan(
                      text: "          ${user.pincode}\n",
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

  Widget subscriptionExpansionBuilder(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            if (isExpanded) {
              expandThis = "";
            } else {
              expandThis =
                  widget.subscriptionItemSnapshot![index].subscriptionId;
            }
          });
        },
        children: widget.subscriptionItemSnapshot!
            .map<ExpansionPanel>((Subscription subscription) {
          return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(
                    subscription.subscriberUserName,
                    style: const TextStyle(color: ColorManager.primaryColor),
                  ),
                  subtitle: Text(subscription.networkType),
                  trailing: Text(subscription.planName),
                );
              },
              body: _expandedSubscriptionBody(subscription),
              isExpanded: subscription.subscriptionId == expandThis,
              canTapOnHeader: true);
        }).toList(),
        elevation: 4,
        dividerColor: ColorManager.primaryColor,
        expandIconColor: ColorManager.primaryColor,
        expandedHeaderPadding: const EdgeInsets.all(10),
      ),
    );
  }

  Widget _expandedSubscriptionBody(Subscription subscription) {
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
                text: "Subscriber Username: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: subscription.subscriberUserName,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Reseller Username: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: subscription.resellerUserName,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Operator Username: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: subscription.operatorUserName,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Status: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: subscription.status,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "PlanName: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: subscription.planName,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "NetworkType: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: subscription.networkType,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "AssignedIP: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: subscription.assignedIp,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "IP Type: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: subscription.ipType,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Subscription Date: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: subscription.subscriptionDate.toString(),
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Last Renewal Date: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: subscription.lastRenewalDate.toString(),
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Next Renewal Date: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: subscription.nextRenewalDate.toString(),
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Permanent Address: \n",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text:
                          "          ${subscription.permanentAddress.streetAddress}\n",
                      style: Theme.of(context).textTheme.labelMedium),
                  TextSpan(
                      text: "          ${subscription.permanentAddress.city}\n",
                      style: Theme.of(context).textTheme.labelMedium),
                  TextSpan(
                      text:
                          "          ${subscription.permanentAddress.state}\n",
                      style: Theme.of(context).textTheme.labelMedium),
                  TextSpan(
                      text:
                          "          ${subscription.permanentAddress.country}\n",
                      style: Theme.of(context).textTheme.labelMedium),
                  TextSpan(
                      text:
                          "          ${subscription.permanentAddress.postalcode}\n",
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Billing Address: \n",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text:
                          "          ${subscription.billingAddress.streetAddress}\n",
                      style: Theme.of(context).textTheme.labelMedium),
                  TextSpan(
                      text: "          ${subscription.billingAddress.city}\n",
                      style: Theme.of(context).textTheme.labelMedium),
                  TextSpan(
                      text: "          ${subscription.billingAddress.state}\n",
                      style: Theme.of(context).textTheme.labelMedium),
                  TextSpan(
                      text:
                          "          ${subscription.billingAddress.country}\n",
                      style: Theme.of(context).textTheme.labelMedium),
                  TextSpan(
                      text:
                          "          ${subscription.billingAddress.postalcode}\n",
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Installation Address: \n",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text:
                          "          ${subscription.installationAddress.streetAddress}\n",
                      style: Theme.of(context).textTheme.labelMedium),
                  TextSpan(
                      text:
                          "          ${subscription.installationAddress.city}\n",
                      style: Theme.of(context).textTheme.labelMedium),
                  TextSpan(
                      text:
                          "          ${subscription.installationAddress.state}\n",
                      style: Theme.of(context).textTheme.labelMedium),
                  TextSpan(
                      text:
                          "          ${subscription.installationAddress.country}\n",
                      style: Theme.of(context).textTheme.labelMedium),
                  TextSpan(
                      text:
                          "          ${subscription.installationAddress.postalcode}\n",
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

  Widget subscriberExpansionBuilder(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            if (isExpanded) {
              expandThis = "";
            } else {
              expandThis = widget.subscriberItemSnapshot![index].customerId;
            }
          });
        },
        children: widget.subscriberItemSnapshot!
            .map<ExpansionPanel>((Subscriber subscriber) {
          return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  leading: const Icon(Icons.person),
                  title: Text(
                    "${subscriber.firstName} ${subscriber.lastName}",
                    style: const TextStyle(color: ColorManager.primaryColor),
                  ),
                  subtitle: Text(subscriber.email),
                  trailing: Text(subscriber.mobileNumber),
                );
              },
              body: _expandedSubscriberBody(subscriber),
              isExpanded: subscriber.customerId == expandThis,
              canTapOnHeader: true);
        }).toList(),
        elevation: 4,
        dividerColor: ColorManager.primaryColor,
        expandIconColor: ColorManager.primaryColor,
        expandedHeaderPadding: const EdgeInsets.all(10),
      ),
    );
  }

  Widget _expandedSubscriberBody(Subscriber subscriber) {
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
                text: "Name: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: "${subscriber.firstName} ${subscriber.lastName}",
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Email: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: subscriber.email,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Mobile Number: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: subscriber.mobileNumber,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Reseller : ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: subscriber.resellerUserName,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Operator: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: subscriber.operatorUserName,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Company Name: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: subscriber.companyName,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Brand Name: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: subscriber.brandName,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "GST Number: ",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text: subscriber.gstNumber,
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Permanent Address: \n",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text:
                          "          ${subscriber.permanentAddress.streetAddress}\n",
                      style: Theme.of(context).textTheme.labelMedium),
                  TextSpan(
                      text: "          ${subscriber.permanentAddress.city}\n",
                      style: Theme.of(context).textTheme.labelMedium),
                  TextSpan(
                      text: "          ${subscriber.permanentAddress.state}\n",
                      style: Theme.of(context).textTheme.labelMedium),
                  TextSpan(
                      text:
                          "          ${subscriber.permanentAddress.country}\n",
                      style: Theme.of(context).textTheme.labelMedium),
                  TextSpan(
                      text:
                          "          ${subscriber.permanentAddress.postalcode}\n",
                      style: Theme.of(context).textTheme.labelMedium)
                ])),
            Text.rich(TextSpan(
                text: "Billing Address: \n",
                style: Theme.of(context).textTheme.labelLarge,
                children: [
                  TextSpan(
                      text:
                          "          ${subscriber.billingAddress.streetAddress}\n",
                      style: Theme.of(context).textTheme.labelMedium),
                  TextSpan(
                      text: "          ${subscriber.billingAddress.city}\n",
                      style: Theme.of(context).textTheme.labelMedium),
                  TextSpan(
                      text: "          ${subscriber.billingAddress.state}\n",
                      style: Theme.of(context).textTheme.labelMedium),
                  TextSpan(
                      text: "          ${subscriber.billingAddress.country}\n",
                      style: Theme.of(context).textTheme.labelMedium),
                  TextSpan(
                      text:
                          "          ${subscriber.billingAddress.postalcode}\n",
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
}
