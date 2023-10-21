import 'package:flutter/material.dart';
import 'package:netify/app/constant.dart';
import 'package:netify/domain/model/enum_model.dart';
import 'package:netify/domain/model/home_model.dart';
import 'package:netify/persentation/common/widgets/display_info_widget.dart';
import 'package:netify/persentation/resources/color_manager.dart';
import 'package:netify/persentation/resources/values_manager.dart';

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
      return SizedBox(
          width: MediaQuery.of(context).size.width *
              Constant.expandedPanelContainerWidth,
          child: userExpansionBuilder(context));
    } else if (widget.dataTypeIdentity == DataTypeIdentity.subscription) {
      return SizedBox(
          width: MediaQuery.of(context).size.width *
              Constant.expandedPanelContainerWidth,
          child: subscriptionExpansionBuilder(context));
    } else if (widget.dataTypeIdentity == DataTypeIdentity.subscriber) {
      return SizedBox(
          width: MediaQuery.of(context).size.width *
              Constant.expandedPanelContainerWidth,
          child: subscriberExpansionBuilder(context));
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
                  leading: CircleAvatar(
                    backgroundColor: ColorManager.circularAvtarColor,
                    child: Text(
                        user.firstName[0].toUpperCase() +
                            user.lastName[0].toUpperCase(),
                        style: Theme.of(context).textTheme.labelMedium),
                  ),
                  title: Text(
                    "${user.firstName[0].toUpperCase()}${user.firstName.substring(1)} ${user.lastName[0].toUpperCase()}${user.lastName.substring(1)}",
                    // style: Theme.of(context).textTheme.labelLarge,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: AppSize.s4,
                      ),
                      Text(user.userName),
                      const SizedBox(
                        height: AppSize.s5,
                      ),
                      Text(user.mobileNumber),
                    ],
                  ),
                  // trailing: Column(
                  //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //   children: [
                  //     Text(user.role),
                  //     Text(user.status),
                  //   ],
                  // ),
                );
              },
              body: ExpandedUserWidget(user: user),
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
                  leading: const CircleAvatar(
                    backgroundColor: ColorManager.circularAvtarColor,
                    child: Icon(
                      Icons.cable_outlined,
                      color: ColorManager.blackColor,
                    ),
                  ),
                  title: Text(
                    subscription.subscriberUserName,
                    style: const TextStyle(color: ColorManager.primaryColor),
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(subscription.networkType),
                      Text(subscription.planName),
                      Text("Rs ${subscription.offeredPrice}")
                    ],
                  ),
                );
              },
              body: SubscriptionExpandedWidget(subscription: subscription),
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
                  leading: CircleAvatar(
                    backgroundColor: ColorManager.circularAvtarColor,
                    child: Text(
                        subscriber.firstName[0].toUpperCase() +
                            subscriber.lastName[0].toUpperCase(),
                        style: Theme.of(context).textTheme.labelMedium),
                  ),
                  title: Text(
                    "${subscriber.firstName[0].toUpperCase()}${subscriber.firstName.substring(1)} ${subscriber.lastName[0].toUpperCase()}${subscriber.lastName.substring(1)}",
                    // style: Theme.of(context).textTheme.labelLarge,
                  ),
                  subtitle: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      const SizedBox(
                        height: AppSize.s4,
                      ),
                      Text(subscriber.userName),
                      const SizedBox(
                        height: AppSize.s5,
                      ),
                      Text(subscriber.mobileNumber),
                    ],
                  ),
                  //trailing: Text(subscriber.mobileNumber),
                );
              },
              body: SubscriberExpandedWidget(subscriber: subscriber),
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
}
