import 'package:netify/domain/model/plan_model.dart';

class DashboardItem {
  final String assetName;
  final int assetCount;
  final int referenceScreenId;
  final String screenTypeIdentity;
  final String color;

  DashboardItem(
      {required this.assetName,
      required this.assetCount,
      required this.referenceScreenId,
      required this.screenTypeIdentity,
      required this.color});

  factory DashboardItem.fromJson(Map<String, dynamic> json) {
    return DashboardItem(
        assetName: json['assetName'],
        assetCount: json['assetCount'],
        referenceScreenId: json['referenceScreenId'],
        screenTypeIdentity: json['screenTypeIdentity'],
        color: json['color']);
  }
}

class User {
  final String userId;
  final String firstName;
  final String lastName;
  final String userName;
  final String email;
  final String mobileNumber;
  final String companyName;
  final String brandName;
  final String role;
  final String status;
  final String address;
  final String pincode;
  final String city;
  final String state;
  final String country;
  final String gstNumber;

  User(
      {required this.userId,
      required this.firstName,
      required this.lastName,
      required this.userName,
      required this.email,
      required this.mobileNumber,
      required this.companyName,
      required this.brandName,
      required this.role,
      required this.status,
      required this.address,
      required this.pincode,
      required this.city,
      required this.state,
      required this.country,
      required this.gstNumber});

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
        userId: json['userId'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        userName: json['userName'],
        email: json['email'],
        mobileNumber: json['mobileNumber'],
        companyName: json['companyName'],
        brandName: json['brandName'],
        role: json['role'],
        status: json['status'],
        address: json['address'],
        pincode: json['pincode'],
        city: json['city'],
        state: json['state'],
        country: json['country'],
        gstNumber: json['gstNumber']);
  }
}

class UserListBlock {
  final List<User> users;
  final bool isSearch;
  final String screenTypeIdentity;

  UserListBlock(
      {required this.users,
      required this.isSearch,
      required this.screenTypeIdentity});

  factory UserListBlock.fromJson(Map<String, dynamic> json) {
    return UserListBlock(
        users: json['userList'],
        isSearch: json['isSearch'],
        screenTypeIdentity: json['screenTypeIdentity']);
  }
}

class ResellerOperatorMap {
  Map<String, List<String>> resellerMap;
  String userName;
  String garudaDomain;

  ResellerOperatorMap(
      {required this.resellerMap,
      required this.userName,
      required this.garudaDomain});

  factory ResellerOperatorMap.fromJson(Map<String, dynamic> json) {
    return ResellerOperatorMap(
        resellerMap: (json['resellerMap'] as Map<String, List<String>>),
        userName: json['userName'],
        garudaDomain: json['garudaDomain']);
  }

  Map<String, dynamic> toJson() {
    return {
      'resellerMap': resellerMap,
      'userName': userName,
      'garudaDomain': garudaDomain
    };
  }
}

class Address {
  final String addressId;
  final String streetAddress;
  final String addressType;
  final String city;
  final String state;
  final String country;
  final String postalcode;
  final DateTime updatedAt;

  Address(
      {required this.addressId,
      required this.streetAddress,
      required this.addressType,
      required this.city,
      required this.state,
      required this.country,
      required this.postalcode,
      required this.updatedAt});

  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        addressId: json['addressId'],
        streetAddress: json['streetAddress'],
        addressType: json['addressType'],
        city: json['city'],
        state: json['state'],
        country: json['country'],
        postalcode: json['postalcode'],
        updatedAt: json['updatedAt']);
  }
}

class Subscriber {
  final String userName;
  final String customerId;
  final String firstName;
  final String lastName;
  final String email;
  final String operatorUserName;
  final String resellerUserName;
  final String mobileNumber;
  final Address permanentAddress;
  final Address billingAddress;
  final String companyName;
  final String brandName;
  final String gstNumber;
  final DateTime createdAt;
  final DateTime updatedAt;

  Subscriber(
      {required this.userName,
      required this.customerId,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.operatorUserName,
      required this.resellerUserName,
      required this.mobileNumber,
      required this.permanentAddress,
      required this.billingAddress,
      required this.companyName,
      required this.brandName,
      required this.gstNumber,
      required this.createdAt,
      required this.updatedAt});

  factory Subscriber.fromJson(Map<String, dynamic> json) {
    return Subscriber(
        userName: json['userName'],
        customerId: json['customerId'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        email: json['email'],
        operatorUserName: json['operatorUserName'],
        resellerUserName: json['resellerUserName'],
        mobileNumber: json['mobileNumber'],
        permanentAddress: json['permanentAddress'],
        billingAddress: json['billingAddress'],
        companyName: json['companyName'],
        brandName: json['brandName'],
        gstNumber: json['gstNumber'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }
}

class Subscription {
  final String subscriptionId;
  final String subscriberUserName;
  final String resellerUserName;
  final String operatorUserName;
  final String status;
  final String planName;
  final String networkType;
  final String assignedIp;
  final String ipType;
  final DateTime subscriptionDate;
  final DateTime lastRenewalDate;
  final DateTime nextRenewalDate;
  final Address installationAddress;
  final Address permanentAddress;
  final Address billingAddress;

  Subscription(
      {required this.subscriptionId,
      required this.subscriberUserName,
      required this.resellerUserName,
      required this.operatorUserName,
      required this.status,
      required this.planName,
      required this.networkType,
      required this.assignedIp,
      required this.ipType,
      required this.subscriptionDate,
      required this.lastRenewalDate,
      required this.nextRenewalDate,
      required this.installationAddress,
      required this.permanentAddress,
      required this.billingAddress});

  factory Subscription.fromJson(Map<String, dynamic> json) {
    return Subscription(
        subscriptionId: json['subscriptionId'],
        subscriberUserName: json['subscriberUserName'],
        resellerUserName: json['resellerUserName'],
        operatorUserName: json['operatorUserName'],
        status: json['status'],
        planName: json['planName'],
        networkType: json['networkType'],
        assignedIp: json['assignedIp'],
        ipType: json['ipType'],
        subscriptionDate: json['subscriptionDate'],
        lastRenewalDate: json['lastRenewalDate'],
        nextRenewalDate: json['nextRenewalDate'],
        installationAddress: json['installationAddress'],
        permanentAddress: json['permanentAddress'],
        billingAddress: json['billingAddress']);
  }
}

class SubscriberListBlock {
  final List<Subscriber> subscribers;
  final bool isSearch;
  final String screenTypeIdentity;

  SubscriberListBlock(
      {required this.subscribers,
      required this.isSearch,
      required this.screenTypeIdentity});

  factory SubscriberListBlock.fromJson(Map<String, dynamic> json) {
    return SubscriberListBlock(
        subscribers: json['subscriberList'],
        isSearch: json['isSearch'],
        screenTypeIdentity: json['screenTypeIdentity']);
  }
}

class SubscriptionListBlock {
  final List<Subscription> subscriptions;
  final bool isSearch;
  final String screenTypeIdentity;

  SubscriptionListBlock(
      {required this.subscriptions,
      required this.isSearch,
      required this.screenTypeIdentity});

  factory SubscriptionListBlock.fromJson(Map<String, dynamic> json) {
    return SubscriptionListBlock(
        subscriptions: json['subscriptionList'],
        isSearch: json['isSearch'],
        screenTypeIdentity: json['screenTypeIdentity']);
  }
}

class SubscriberMapInfo {
  final String subscriberUserName;
  final String customerId;
  final String mobileNumber;
  final String email;

  SubscriberMapInfo(
      {required this.subscriberUserName,
      required this.customerId,
      required this.mobileNumber,
      required this.email});

  factory SubscriberMapInfo.fromJson(Map<String, dynamic> json) {
    return SubscriberMapInfo(
        subscriberUserName: json['subscriberUserName'],
        customerId: json['customerId'],
        mobileNumber: json['mobileNumber'],
        email: json['email']);
  }
}

class SubscriptionMeta {
  final Map<String, List<String>> resellerOperatorMap;
  final Map<String, List<PlanProfileMetaPlan>> operatorPlanMap;
  final Map<String, List<SubscriberMapInfo>> operatorSubscriberMap;
  final List<String> networkType;
  final List<String> ipType;
  final List<String> availiableIps;

  SubscriptionMeta(
      {required this.resellerOperatorMap,
      required this.operatorPlanMap,
      required this.operatorSubscriberMap,
      required this.networkType,
      required this.availiableIps,
      required this.ipType});

  factory SubscriptionMeta.fromJson(Map<String, dynamic> json) {
    return SubscriptionMeta(
        resellerOperatorMap: json['resellerOperatorMap'],
        operatorPlanMap: json['operatorPlanMap'],
        operatorSubscriberMap: json['operatorSubscriberMap'],
        networkType: json['networkType'],
        availiableIps: json['availiableIps'],
        ipType: json['ipType']);
  }
}
//Basic model for home screen
// abstract class ListItem {}

// class ResellerItem implements ListItem {
//   final String name;
//   final int operatorCount;
//   final String companyName;
//   final String phoneNumber;
//   final String email;
//   final String brandName;

//   ResellerItem(
//       {required this.name,
//       required this.operatorCount,
//       required this.companyName,
//       required this.phoneNumber,
//       required this.email,
//       required this.brandName});
// }

// class OperatorItem implements ListItem {
//   final String name;
//   final int operatorCount;
//   final String companyName;
//   final String phoneNumber;
//   final String email;
//   final String brandName;

//   OperatorItem(
//       {required this.name,
//       required this.operatorCount,
//       required this.companyName,
//       required this.phoneNumber,
//       required this.email,
//       required this.brandName});
// }

// class SubscriberItem implements ListItem {
//   final String name;
//   final String userId;
//   final String mobileNumber;
//   final String planInfo;
//   final String ipType;

//   SubscriberItem(
//       {required this.name,
//       required this.userId,
//       required this.mobileNumber,
//       required this.planInfo,
//       required this.ipType});
// }

