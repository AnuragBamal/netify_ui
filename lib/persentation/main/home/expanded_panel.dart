import 'package:flutter/material.dart';
import 'package:netify/domain/model/enum_model.dart';
import 'package:netify/domain/model/home_model.dart';
import 'package:netify/persentation/resources/color_manager.dart';

class ExpandedPanelWidget extends StatefulWidget {
  final String dataTypeIdentity;
  final List<User>? userItemSnapshot;
  const ExpandedPanelWidget(
      {Key? key, required this.dataTypeIdentity, this.userItemSnapshot})
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
}
