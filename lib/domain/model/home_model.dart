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


