import 'package:netify/domain/model/model.dart';

class Plans {
  String planId;
  String planName;
  String planDescription;
  bool isPlanActive;
  double planPrice;
  DateTime planStartDate;
  DateTime planUpdatedDate;

  Plans(
      {required this.planId,
      required this.planName,
      required this.planDescription,
      required this.isPlanActive,
      required this.planStartDate,
      required this.planPrice,
      required this.planUpdatedDate});

  factory Plans.fromJson(Map<String, dynamic> json) {
    return Plans(
        planId: json['planId'],
        planName: json['planName'],
        planDescription: json['planDescription'],
        isPlanActive: json['isPlanActive'],
        planStartDate: json['planStartDate'],
        planPrice: json['planPrice'],
        planUpdatedDate: json['planUpdatedDate']);
  }

  Map<String, dynamic> toJson() {
    return {
      'planId': planId,
      'planName': planName,
      'planDescription': planDescription,
      'isPlanActive': isPlanActive,
      'planStartDate': planStartDate,
      'planPrice': planPrice,
      'planUpdatedDate': planUpdatedDate
    };
  }
}

class ResellerPriceChart {
  int id;
  String resellerId;
  String resellerUserName;
  String planId;
  String planName;
  double price;
  DateTime createdAt;
  DateTime updatedAt;

  ResellerPriceChart(
      {required this.id,
      required this.resellerId,
      required this.resellerUserName,
      required this.planId,
      required this.price,
      required this.createdAt,
      required this.updatedAt,
      required this.planName});

  factory ResellerPriceChart.fromJson(Map<String, dynamic> json) {
    return ResellerPriceChart(
        id: json['id'],
        resellerId: json['resellerId'],
        resellerUserName: json['resellerUserName'],
        planId: json['planId'],
        price: json['price'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt'],
        planName: json['planName']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'resellerId': resellerId,
      'resellerUserName': resellerUserName,
      'planId': planId,
      'price': price,
      'createdAt': createdAt,
      'updatedAt': updatedAt,
      'planName': planName
    };
  }
}

class OperatorPriceChart {
  int id;
  String operatorId;
  String operatorUserName;
  String resellerId;
  String resellerUserName;
  String planName;
  double planPrice;
  String planId;

  DateTime createdAt;
  DateTime updatedAt;

  OperatorPriceChart(
      {required this.id,
      required this.operatorId,
      required this.operatorUserName,
      required this.resellerId,
      required this.resellerUserName,
      required this.planName,
      required this.planPrice,
      required this.planId,
      required this.createdAt,
      required this.updatedAt});

  factory OperatorPriceChart.fromJson(Map<String, dynamic> json) {
    return OperatorPriceChart(
        id: json['id'],
        operatorId: json['operatorId'],
        operatorUserName: json['operatorUserName'],
        resellerId: json['resellerId'],
        resellerUserName: json['resellerUserName'],
        planName: json['planName'],
        planPrice: json['planPrice'],
        planId: json['planId'],
        createdAt: json['createdAt'],
        updatedAt: json['updatedAt']);
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'operatorId': operatorId,
      'operatorUserName': operatorUserName,
      'resellerId': resellerId,
      'resellerUserName': resellerUserName,
      'planName': planName,
      'planPrice': planPrice,
      'planId': planId,
      'createdAt': createdAt,
      'updatedAt': updatedAt
    };
  }
}

class PlanProfileMetaPlan {
  String planId;
  String planName;
  double planPrice;

  PlanProfileMetaPlan(
      {required this.planId, required this.planName, required this.planPrice});

  factory PlanProfileMetaPlan.fromJson(Map<String, dynamic> json) {
    return PlanProfileMetaPlan(
        planId: json['planId'],
        planName: json['planName'],
        planPrice: json['planPrice']);
  }
}

class PlanProfileMeta {
  String role;
  String ownerUserName;
  String userName;
  List<String> planSpeedUnit;
  List<String> planDataLimitUnit;
  List<String> planValidityUnit;
  List<String> planType;
  double taxRate;
  Map<String, List<String>> resellerMap;
  List<PlanProfileMetaPlan> planList;
  List<MainPageModel> planScreens;
  Map<String, List<PlanProfileMetaPlan>> resellerPlanMap;

  PlanProfileMeta(
      {required this.role,
      required this.ownerUserName,
      required this.userName,
      required this.planSpeedUnit,
      required this.planDataLimitUnit,
      required this.planValidityUnit,
      required this.planType,
      required this.taxRate,
      required this.resellerMap,
      required this.planList,
      required this.planScreens,
      required this.resellerPlanMap});

  factory PlanProfileMeta.fromJson(Map<String, dynamic> json) {
    return PlanProfileMeta(
        role: json['role'],
        ownerUserName: json['ownerUserName'],
        userName: json['userName'],
        planSpeedUnit: json['planSpeedUnit'],
        planDataLimitUnit: json['planDataLimitUnit'],
        planValidityUnit: json['planValidityUnit'],
        planType: json['planType'],
        taxRate: json['taxRate'],
        resellerMap: json['resellerMap'],
        planList: json['planList'],
        planScreens: json['planScreens'],
        resellerPlanMap: json['resellerPlanMap']);
  }

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'ownerUserName': ownerUserName,
      'userName': userName,
      'planSpeedUnit': planSpeedUnit,
      'planDataLimitUnit': planDataLimitUnit,
      'planValidityUnit': planValidityUnit,
      'planType': planType,
      'taxRate': taxRate,
      'resellerMap': resellerMap,
      'planList': planList,
      'planScreens': planScreens,
      'resellerPlanMap': resellerPlanMap
    };
  }
}
