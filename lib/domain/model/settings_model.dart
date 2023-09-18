import 'package:netify/domain/model/model.dart';

class SettingsProfileMeta {
  final String role;
  final String ownerUserName;
  final String userName;
  final String tenantId;
  List<MainPageModel> settingScreens;
  List<String> supportedNasType;

  SettingsProfileMeta(
      {required this.role,
      required this.ownerUserName,
      required this.userName,
      required this.settingScreens,
      required this.tenantId,
      required this.supportedNasType});

  factory SettingsProfileMeta.fromJson(Map<String, dynamic> json) {
    return SettingsProfileMeta(
        role: json['role'],
        ownerUserName: json['ownerUserName'],
        userName: json['userName'],
        settingScreens: json['settingScreens'],
        tenantId: json['tenantId'],
        supportedNasType: json['supportedNasType']);
  }
}

class Service {
  final String serviceId;
  final String serviceName;
  final String serviceDescription;
  final double serviceCost;

  Service(
      {required this.serviceId,
      required this.serviceName,
      required this.serviceDescription,
      required this.serviceCost});

  factory Service.fromJson(Map<String, dynamic> json) {
    return Service(
        serviceId: json['serviceId'],
        serviceName: json['serviceName'],
        serviceDescription: json['serviceDescription'],
        serviceCost: json['serviceCost']);
  }
}

class SubscribedService {
  final String tenantId;
  final String subscriptionId;
  final String serviceId;
  final DateTime startDate;
  final DateTime endDate;
  final Map<String, dynamic> subscriptionData;
  final String status;

  SubscribedService(
      {required this.tenantId,
      required this.subscriptionId,
      required this.serviceId,
      required this.startDate,
      required this.endDate,
      required this.subscriptionData,
      required this.status});

  factory SubscribedService.fromJson(Map<String, dynamic> json) {
    return SubscribedService(
        tenantId: json['tenantId'],
        subscriptionId: json['subscriptionId'],
        serviceId: json['serviceId'],
        startDate: json['startDate'],
        endDate: json['endDate'],
        subscriptionData: json['subscriptionData'],
        status: json['status']);
  }
}

class ServicesInfo {
  List<Service> services;
  List<SubscribedService> subscribedServices;

  ServicesInfo({required this.services, required this.subscribedServices});

  factory ServicesInfo.fromJson(Map<String, dynamic> json) {
    return ServicesInfo(
        services:
            (json['services'] as List).map((e) => Service.fromJson(e)).toList(),
        subscribedServices: (json['subscribedServices'] as List)
            .map((e) => SubscribedService.fromJson(e))
            .toList());
  }
}

class Nas {
  final String id;
  final String nasname;
  final String shortname;
  final String secret;
  final String type;
  final int ports;
  final String description;
  final String community;
  final String server;

  Nas(
      {required this.id,
      required this.nasname,
      required this.shortname,
      required this.secret,
      required this.type,
      required this.ports,
      required this.description,
      required this.community,
      required this.server});

  factory Nas.fromJson(Map<String, dynamic> json) {
    return Nas(
        id: json['id'],
        nasname: json['nasname'],
        shortname: json['shortname'],
        secret: json['secret'],
        type: json['type'],
        ports: json['ports'],
        description: json['description'],
        community: json['community'],
        server: json['server']);
  }
}
