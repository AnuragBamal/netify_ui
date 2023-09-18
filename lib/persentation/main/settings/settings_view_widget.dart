import 'package:flutter/material.dart';
import 'package:netify/domain/model/settings_model.dart';
import 'package:netify/persentation/resources/color_manager.dart';

class SettingsViewWidget extends StatefulWidget {
  final String viewTypeIdentity;
  final AsyncSnapshot<List<Nas?>>? nasSnapshot;
  final AsyncSnapshot<List<Service?>>? serviceSnapshot;
  final AsyncSnapshot<List<SubscribedService?>>? subacribedServicesSnapshot;
  final Function? serviceSubscrptionFunction;

  const SettingsViewWidget(
      {Key? key,
      required this.viewTypeIdentity,
      this.nasSnapshot,
      this.serviceSnapshot,
      this.subacribedServicesSnapshot,
      this.serviceSubscrptionFunction})
      : super(key: key);

  @override
  State<SettingsViewWidget> createState() => _SettingsViewWidgetState();
}

class _SettingsViewWidgetState extends State<SettingsViewWidget> {
  bool isTableView = false;
  String expandThis = "";
  @override
  Widget build(BuildContext context) {
    if (widget.viewTypeIdentity == "availiable_services") {
      return _buildAvailiableServicesExpansionPanel(context);
    } else if (widget.viewTypeIdentity == "subscibed_services") {
      return _buildSubscribedServicesExpansionPanel(context);
    } else if (widget.viewTypeIdentity == "nas_list") {
      return _buildNasExpansionPanel(context);
    } else {
      return Container();
    }
  }

  Widget _buildAvailiableServicesExpansionPanel(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            if (isExpanded) {
              expandThis = "";
            } else {
              expandThis = widget.serviceSnapshot!.data![index]!.serviceId;
            }
          });
        },
        children: widget.serviceSnapshot!.data!.map<ExpansionPanel>((service) {
          return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  leading: const Icon(Icons.miscellaneous_services_outlined),
                  title: Text(
                    service.serviceName,
                    style: const TextStyle(color: ColorManager.primaryColor),
                  ),
                  subtitle: Text(service.serviceDescription),
                  trailing: Text("Rs ${service.serviceCost.toString()} "),
                );
              },
              body: _expandedAvailiableServicesBody(service),
              isExpanded: service!.serviceId == expandThis,
              canTapOnHeader: true);
        }).toList(),
        elevation: 4,
        dividerColor: ColorManager.primaryColor,
        expandIconColor: ColorManager.primaryColor,
        expandedHeaderPadding: const EdgeInsets.all(10),
      ),
    );
  }

  Widget _expandedAvailiableServicesBody(Service? service) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(TextSpan(
              text: "Service Name: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: service!.serviceName,
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "Service Description: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: service.serviceDescription,
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "Service Cost: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: "Rs ${service.serviceCost} per subscriber.",
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Center(
            child: ElevatedButton(
                onPressed: () => widget.serviceSubscrptionFunction!(
                    service.serviceId, service.serviceId),
                child: const Text("Subscribe")),
          )
        ],
      ),
    );
  }

  Widget _buildSubscribedServicesExpansionPanel(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            if (isExpanded) {
              expandThis = "";
            } else {
              expandThis =
                  widget.subacribedServicesSnapshot!.data![index]!.serviceId;
            }
          });
        },
        children: widget.subacribedServicesSnapshot!.data!
            .map<ExpansionPanel>((service) {
          return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  leading: const Icon(Icons.miscellaneous_services),
                  title: Text(
                    service.serviceId,
                    style: const TextStyle(color: ColorManager.primaryColor),
                  ),
                  subtitle: Text(service.status),
                  trailing: Text(
                      "${service.startDate.day}/${service.startDate.month}/${service.startDate.year}"),
                );
              },
              body: _expandedSubscribedServicesBody(service),
              isExpanded: service!.serviceId == expandThis,
              canTapOnHeader: true);
        }).toList(),
        elevation: 4,
        dividerColor: ColorManager.primaryColor,
        expandIconColor: ColorManager.primaryColor,
        expandedHeaderPadding: const EdgeInsets.all(10),
      ),
    );
  }

  Widget _expandedSubscribedServicesBody(SubscribedService? service) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(TextSpan(
              text: "Service Name: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: service!.serviceId,
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "Service Start Date: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text:
                        "${service.startDate.day}/${service.startDate.month}/${service.startDate.year}",
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "Service End Date: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text:
                        "${service.endDate.day}/${service.endDate.month}/${service.endDate.year}",
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "Service Status: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: service.status,
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
        ],
      ),
    );
  }

  Widget _buildNasExpansionPanel(BuildContext context) {
    return SingleChildScrollView(
      child: ExpansionPanelList(
        expansionCallback: (int index, bool isExpanded) {
          setState(() {
            if (isExpanded) {
              expandThis = "";
            } else {
              expandThis = widget.nasSnapshot!.data![index]!.id;
            }
          });
        },
        children: widget.nasSnapshot!.data!.map<ExpansionPanel>((nasEntry) {
          return ExpansionPanel(
              headerBuilder: (BuildContext context, bool isExpanded) {
                return ListTile(
                  leading: const Icon(Icons.miscellaneous_services_outlined),
                  title: Text(
                    nasEntry.nasname,
                    style: const TextStyle(color: ColorManager.primaryColor),
                  ),
                  subtitle: Text(nasEntry.shortname),
                  trailing: Text(nasEntry.type),
                );
              },
              body: _expandedNasPanel(nasEntry),
              isExpanded: nasEntry!.id == expandThis,
              canTapOnHeader: true);
        }).toList(),
        elevation: 4,
        dividerColor: ColorManager.primaryColor,
        expandIconColor: ColorManager.primaryColor,
        expandedHeaderPadding: const EdgeInsets.all(10),
      ),
    );
  }

  Widget _expandedNasPanel(Nas? nasEntry) {
    return Padding(
      padding: const EdgeInsets.only(left: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text.rich(TextSpan(
              text: "Name:",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: nasEntry!.shortname,
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          Text.rich(TextSpan(
              text: "NAS Name: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: nasEntry.nasname,
                    style: Theme.of(context).textTheme.labelMedium)
              ])),

          Text.rich(TextSpan(
              text: "Type:",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: nasEntry.type,
                    style: Theme.of(context).textTheme.labelMedium)
              ])),

          Text.rich(TextSpan(
              text: "NAS Shared Secret: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: nasEntry.secret,
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          // Text.rich(TextSpan(
          //     text: "Server: ",
          //     style: Theme.of(context).textTheme.labelLarge,
          //     children: [
          //       TextSpan(
          //           text: nasEntry.server,
          //           style: Theme.of(context).textTheme.labelMedium)
          //     ])),
          // Text.rich(TextSpan(
          //     text: "Community: ",
          //     style: Theme.of(context).textTheme.labelLarge,
          //     children: [
          //       TextSpan(
          //           text: nasEntry.community,
          //           style: Theme.of(context).textTheme.labelMedium)
          //     ])),
          Text.rich(TextSpan(
              text: "Description: ",
              style: Theme.of(context).textTheme.labelLarge,
              children: [
                TextSpan(
                    text: nasEntry.description,
                    style: Theme.of(context).textTheme.labelMedium)
              ])),
          // Text.rich(TextSpan(
          //     text: "Port: ",
          //     style: Theme.of(context).textTheme.labelLarge,
          //     children: [
          //       TextSpan(
          //           text: nasEntry.ports.toString(),
          //           style: Theme.of(context).textTheme.labelMedium)
          //     ])),
        ],
      ),
    );
  }
}
