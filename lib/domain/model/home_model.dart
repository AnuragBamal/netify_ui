import 'package:netify/domain/model/model.dart';

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
  Map<String, List<String>> resellerMap;
  List<String> planList;
  List<MainPageModel> planScreens;
  Map<String, List<PlanProfileMetaPlan>> resellerPlanMap;
  PlanProfileMeta(
      {required this.role,
      required this.ownerUserName,
      required this.userName,
      required this.resellerMap,
      required this.planList,
      required this.planScreens,
      required this.resellerPlanMap});

  factory PlanProfileMeta.fromJson(Map<String, dynamic> json) {
    return PlanProfileMeta(
        role: json['role'],
        ownerUserName: json['owneruserName'],
        userName: json['userName'],
        resellerMap: json['resellerMap'],
        planList: json['planList'],
        planScreens: json['planScreens'],
        resellerPlanMap: json['resellerPlanMap']);
  }

  Map<String, dynamic> toJson() {
    return {
      'role': role,
      'owneruserName': ownerUserName,
      'userName': userName,
      'resellerMap': resellerMap,
      'planList': planList,
      'planScreens': planScreens,
      'resellerPlanMap': resellerPlanMap
    };
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


