import 'package:netify/domain/model/model.dart';

class OperatorSubscriberMap {
  final String subscriberUserName;
  final String customerId;
  final String mobileNumber;
  final String email;

  OperatorSubscriberMap(
      {required this.subscriberUserName,
      required this.customerId,
      required this.mobileNumber,
      required this.email});

  factory OperatorSubscriberMap.fromJson(Map<String, dynamic> json) {
    return OperatorSubscriberMap(
        subscriberUserName: json['subscriberUserName'],
        customerId: json['customerId'],
        mobileNumber: json['mobileNumber'],
        email: json['email']);
  }

  Map<String, dynamic> toJson() => {
        "subscriberUserName": subscriberUserName,
        "customerId": customerId,
        "mobileNumber": mobileNumber,
        "email": email,
      };
}

class SubscriptionSubscriberMap {
  final String planName;
  final String operatorUserName;
  final double offeredPrice;
  final String subscriptionId;
  final String subscriptionStatus;
  final String networkType;
  final String ipType;
  final String lastRenewalDate;

  SubscriptionSubscriberMap(
      {required this.planName,
      required this.operatorUserName,
      required this.offeredPrice,
      required this.subscriptionId,
      required this.subscriptionStatus,
      required this.networkType,
      required this.ipType,
      required this.lastRenewalDate});

  factory SubscriptionSubscriberMap.fromJson(Map<String, dynamic> json) {
    return SubscriptionSubscriberMap(
        planName: json['planName'],
        operatorUserName: json['operatorUserName'],
        offeredPrice: json['offeredPrice'],
        subscriptionId: json['subscriptionId'],
        subscriptionStatus: json['subscriptionStatus'],
        networkType: json['networkType'],
        ipType: json['ipType'],
        lastRenewalDate: json['lastRenewalDate']);
  }

  Map<String, dynamic> toJson() => {
        "planName": planName,
        "operatorUserName": operatorUserName,
        "offeredPrice": offeredPrice,
        "subscriptionId": subscriptionId,
        "subscriptionStatus": subscriptionStatus,
        "networkType": networkType,
        "ipType": ipType,
        "lastRenewalDate": lastRenewalDate,
      };
}

class BillingProfileMeta {
  final String role;
  final String ownerUserName;
  final String userName;
  List<MainPageModel> billingScreens;
  final Map<String, List<String>> resellerOperatorMap;
  final Map<String, List<OperatorSubscriberMap>> operatorSubscriberMap;
  final Map<String, List<SubscriptionSubscriberMap>> subscriberSubscriptionMap;

  BillingProfileMeta(
      {required this.role,
      required this.ownerUserName,
      required this.userName,
      required this.billingScreens,
      required this.resellerOperatorMap,
      required this.operatorSubscriberMap,
      required this.subscriberSubscriptionMap});

  factory BillingProfileMeta.fromJson(Map<String, dynamic> json) {
    return BillingProfileMeta(
        role: json['role'],
        ownerUserName: json['ownerUserName'],
        userName: json['userName'],
        billingScreens: (json['billingScreens'] as List)
            .map((e) => MainPageModel.fromJson(e))
            .toList(),
        resellerOperatorMap: (json['resellerOperatorMap'] as Map<String, dynamic>)
            .map((key, value) => MapEntry(key, List<String>.from(value))),
        operatorSubscriberMap:
            (json['operatorSubscriberMap'] as Map<String, dynamic>).map(
                (key, value) => MapEntry(
                    key,
                    List<OperatorSubscriberMap>.from(
                        value.map((x) => OperatorSubscriberMap.fromJson(x))))),
        subscriberSubscriptionMap:
            (json['subscriberSubscriptionMap'] as Map<String, dynamic>).map(
                (key, value) =>
                    MapEntry(key, List<SubscriptionSubscriberMap>.from(value.map((x) => SubscriptionSubscriberMap.fromJson(x))))));
  }

  Map<String, dynamic> toJson() => {
        "role": role,
        "ownerUserName": ownerUserName,
        "userName": userName,
        "billingScreens": billingScreens,
        "resellerOperatorMap": resellerOperatorMap,
        "operatorSubscriberMap": operatorSubscriberMap,
        "subscriberSubscriptionMap": subscriberSubscriptionMap,
      };
}

class Bills {
  final String subscriberName;
  final String subscriberUserName;
  final String customerId;
  final String operatorName;
  final String operatorUserName;
  final String operatorId;
  final String resellerName;
  final String resellerUserName;
  final String resellerId;
  final String planName;
  final String billNumber;
  final String billPeriod;
  final String dueDate;
  final double billAmount;
  final double basicBillAmount;
  final String billAmountComponents;
  final String nextBillingDate;
  final String status;
  final DateTime createdAt;
  final DateTime updatedAt;

  Bills({
    required this.subscriberName,
    required this.subscriberUserName,
    required this.customerId,
    required this.operatorName,
    required this.operatorUserName,
    required this.operatorId,
    required this.resellerName,
    required this.resellerUserName,
    required this.resellerId,
    required this.planName,
    required this.billNumber,
    required this.billPeriod,
    required this.dueDate,
    required this.billAmount,
    required this.nextBillingDate,
    required this.status,
    required this.createdAt,
    required this.updatedAt,
    required this.basicBillAmount,
    required this.billAmountComponents,
  });

  factory Bills.fromJson(Map<String, dynamic> json) => Bills(
        subscriberName: json["subscriberName"],
        subscriberUserName: json["subscriberUserName"],
        customerId: json["customerId"],
        operatorName: json["operatorName"],
        operatorUserName: json["operatorUserName"],
        operatorId: json["operatorId"],
        resellerName: json["resellerName"],
        resellerUserName: json["resellerUserName"],
        resellerId: json["resellerId"],
        planName: json["planName"],
        billNumber: json["billNumber"],
        billPeriod: json["billPeriod"],
        dueDate: json["dueDate"],
        billAmount: json["billAmount"].toDouble(),
        nextBillingDate: json["nextBillingDate"],
        status: json["status"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        basicBillAmount: json["basicBillAmount"].toDouble(),
        billAmountComponents: json["billAmountComponents"],
      );

  Map<String, dynamic> toJson() => {
        "subscriberName": subscriberName,
        "subscriberUserName": subscriberUserName,
        "customerId": customerId,
        "operatorName": operatorName,
        "operatorUserName": operatorUserName,
        "operatorId": operatorId,
        "resellerName": resellerName,
        "resellerUserName": resellerUserName,
        "resellerId": resellerId,
        "planName": planName,
        "billNumber": billNumber,
        "billPeriod": billPeriod,
        "dueDate": dueDate,
        "billAmount": billAmount,
        "nextBillingDate": nextBillingDate,
        "status": status,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "basicBillAmount": basicBillAmount,
        "billAmountComponents": billAmountComponents,
      };
}

class BillsData {
  final List<Bills> bills;
  final String screenTypeIdentity;
  final bool isSearch;

  BillsData({
    required this.bills,
    required this.screenTypeIdentity,
    required this.isSearch,
  });

  factory BillsData.fromJson(Map<String, dynamic> json) => BillsData(
        bills: List<Bills>.from(json["bills"].map((x) => Bills.fromJson(x))),
        screenTypeIdentity: json["screenTypeIdentity"],
        isSearch: json["isSearch"],
      );

  Map<String, dynamic> toJson() => {
        "bills": List<dynamic>.from(bills.map((x) => x.toJson())),
        "screenTypeIdentity": screenTypeIdentity,
        "isSearch": isSearch,
      };
}

class UpcomingRenewals {
  final String planName;
  final String operatorUserName;
  final double offeredPrice;
  final String subscriptionId;
  final String subscriptionStatus;
  final String networkType;
  final String ipType;
  final String lastRenewalDate;
  final String nextRenewalDate;
  final String resellerUserName;
  final String customerId;
  final String subscriberUserName;
  final String subscriberName;
  final String subscriberEmail;

  UpcomingRenewals({
    required this.planName,
    required this.operatorUserName,
    required this.offeredPrice,
    required this.subscriptionId,
    required this.subscriptionStatus,
    required this.networkType,
    required this.ipType,
    required this.lastRenewalDate,
    required this.nextRenewalDate,
    required this.resellerUserName,
    required this.customerId,
    required this.subscriberUserName,
    required this.subscriberName,
    required this.subscriberEmail,
  });

  factory UpcomingRenewals.fromJson(Map<String, dynamic> json) =>
      UpcomingRenewals(
        planName: json["planName"],
        operatorUserName: json["operatorUserName"],
        offeredPrice: json["offeredPrice"].toDouble(),
        subscriptionId: json["subscriptionId"],
        subscriptionStatus: json["subscriptionStatus"],
        networkType: json["networkType"],
        ipType: json["ipType"],
        lastRenewalDate: json["lastRenewalDate"],
        nextRenewalDate: json["nextRenewalDate"],
        resellerUserName: json["resellerUserName"],
        customerId: json["customerId"],
        subscriberUserName: json["subscriberUserName"],
        subscriberName: json["subscriberName"],
        subscriberEmail: json["subscriberEmail"],
      );

  Map<String, dynamic> toJson() => {
        "planName": planName,
        "operatorUserName": operatorUserName,
        "offeredPrice": offeredPrice,
        "subscriptionId": subscriptionId,
        "subscriptionStatus": subscriptionStatus,
        "networkType": networkType,
        "ipType": ipType,
        "lastRenewalDate": lastRenewalDate,
        "nextRenewalDate": nextRenewalDate,
        "resellerUserName": resellerUserName,
        "customerId": customerId,
        "subscriberUserName": subscriberUserName,
        "subscriberName": subscriberName,
        "subscriberEmail": subscriberEmail,
      };
}
