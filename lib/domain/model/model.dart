import 'package:netify/domain/model/home_model.dart';

class SliderObject {
  final String title;
  final String description;
  final String imagePath;

  SliderObject(this.title, this.description, this.imagePath);
}

class BaseResponse {
  final String status;
  final String message;
  final String errorCode;

  BaseResponse(
      {required this.status, required this.message, required this.errorCode});

  factory BaseResponse.fromJson(Map<String, dynamic> json) {
    return BaseResponse(
        status: json['status'],
        message: json['message'],
        errorCode: json['errorCode']);
  }
}

class LoginData {
  final String token;
  final bool isVerified;
  final String firstName;
  final String lastName;
  final String userName;

  LoginData(
      {required this.token,
      required this.isVerified,
      required this.firstName,
      required this.lastName,
      required this.userName});

  factory LoginData.fromJson(Map<String, dynamic> json) {
    return LoginData(
        token: json['token'],
        isVerified: json['isVerified'],
        firstName: json['firstName'],
        lastName: json['lastName'],
        userName: json['userName']);
  }
}

class Login {
  final String status;
  final String message;
  final String errorCode;
  final List<LoginData> data;

  Login(
      {required this.status,
      required this.message,
      required this.errorCode,
      required this.data});

  factory Login.fromJson(Map<String, dynamic> json) {
    return Login(
        status: json['status'],
        message: json['message'],
        errorCode: json['errorCode'],
        data:
            (json['data'] as List).map((e) => LoginData.fromJson(e)).toList());
  }
}

class DeviceInfo {
  String name;
  String version;
  String identifier;
  String model;
  String manufacturer;
  String isPhysicalDevice;
  String systemName;
  String systemVersion;

  DeviceInfo(
      {required this.name,
      required this.version,
      required this.identifier,
      required this.model,
      required this.manufacturer,
      required this.isPhysicalDevice,
      required this.systemName,
      required this.systemVersion});
}

class SuccessMessage {
  final String message;

  SuccessMessage({required this.message});

  factory SuccessMessage.fromJson(Map<String, dynamic> json) {
    return SuccessMessage(message: json['message']);
  }
}

class GeneralSuccess extends BaseResponse {
  final List<SuccessMessage> data;

  GeneralSuccess(
      {required this.data,
      required String status,
      required String message,
      required String errorCode})
      : super(status: status, message: message, errorCode: errorCode);

  factory GeneralSuccess.fromJson(Map<String, dynamic> json) {
    return GeneralSuccess(
        data: (json['data'] as List)
            .map((e) => SuccessMessage.fromJson(e))
            .toList(),
        status: json['status'],
        message: json['message'],
        errorCode: json['errorCode']);
  }
}

enum FilterType {
  text,
  dropdown,
}

class Filter {
  String name;
  FilterType type;
  String label;
  String placeholder;
  List<String> options;

  Filter(
      {required this.name,
      required this.type,
      required this.label,
      required this.placeholder,
      required this.options});

  factory Filter.fromJson(Map<String, dynamic> json) {
    return Filter(
        name: json['name'],
        type: json['type'],
        label: json['label'],
        placeholder: json['placeholder'],
        options: (json['options'] as List).map((e) => e.toString()).toList());
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'type': type,
      'label': label,
      'placeholder': placeholder,
      'options': options
    };
  }
}

class MainPageModel {
  String viewType;
  String title;
  String dataTypeIdentity;
  String screenTypeIdentity;
  int index;
  List<Filter> filter;

  MainPageModel(
      {required this.viewType,
      required this.title,
      required this.dataTypeIdentity,
      required this.screenTypeIdentity,
      required this.index,
      required this.filter});

  factory MainPageModel.fromJson(Map<String, dynamic> json) {
    return MainPageModel(
        viewType: json['viewType'],
        title: json['title'],
        dataTypeIdentity: json['dataTypeIdentity'],
        screenTypeIdentity: json['screenTypeIdentiy'],
        index: json['index'],
        filter:
            (json['filter'] as List).map((e) => Filter.fromJson(e)).toList());
  }
}

class GetUserData {
  String firstName;
  String lastName;
  String userName;
  String email;
  String mobileNumber;
  String companyName;
  String brandName;
  String role;
  String userId;

  String ownerUserName;
  String walletId;
  List<MainPageModel> homeScreens;
  List<String> resellerList;
  List<String> operatorList;
  Map<String, List<String>> resellerOperatorMap;

  GetUserData(
      {required this.firstName,
      required this.lastName,
      required this.userName,
      required this.email,
      required this.mobileNumber,
      required this.companyName,
      required this.brandName,
      required this.role,
      required this.userId,
      required this.homeScreens,
      required this.resellerList,
      required this.operatorList,
      required this.resellerOperatorMap,
      required this.ownerUserName,
      required this.walletId});

  factory GetUserData.fromJson(Map<String, dynamic> json) {
    return GetUserData(
        firstName: json['firstName'],
        lastName: json['lastName'],
        userName: json['userName'],
        email: json['email'],
        mobileNumber: json['mobileNumber'],
        companyName: json['companyName'],
        brandName: json['brandName'],
        role: json['role'],
        userId: json['userId'],
        homeScreens: (json['homeScreens'] as List)
            .map((e) => MainPageModel.fromJson(e))
            .toList(),
        resellerList:
            (json['resellerList'] as List).map((e) => e.toString()).toList(),
        operatorList:
            (json['operatorList'] as List).map((e) => e.toString()).toList(),
        resellerOperatorMap:
            (json['resellerOperatorMap'] as Map<String, List<String>>),
        ownerUserName: json['ownerUserName'],
        walletId: json['walletId']);
  }
}

class GetUser extends BaseResponse {
  final List<GetUserData> data;

  GetUser(
      {required this.data,
      required String status,
      required String message,
      required String errorCode})
      : super(status: status, message: message, errorCode: errorCode);

  factory GetUser.fromJson(Map<String, dynamic> json) {
    return GetUser(
        data:
            (json['data'] as List).map((e) => GetUserData.fromJson(e)).toList(),
        status: json['status'],
        message: json['message'],
        errorCode: json['errorCode']);
  }
}

class GetUserList extends BaseResponse {
  final List<UserListBlock> data;

  GetUserList(
      {required this.data,
      required String status,
      required String message,
      required String errorCode})
      : super(status: status, message: message, errorCode: errorCode);

  factory GetUserList.fromJson(Map<String, dynamic> json) {
    return GetUserList(
        data: (json['data'] as List)
            .map((e) => UserListBlock.fromJson(e))
            .toList(),
        status: json['status'],
        message: json['message'],
        errorCode: json['errorCode']);
  }
}

class GetDashboardItemList extends BaseResponse {
  final List<DashboardItem> data;

  GetDashboardItemList(
      {required this.data,
      required String status,
      required String message,
      required String errorCode})
      : super(status: status, message: message, errorCode: errorCode);

  factory GetDashboardItemList.fromJson(Map<String, dynamic> json) {
    return GetDashboardItemList(
        data: (json['data'] as List)
            .map((e) => DashboardItem.fromJson(e))
            .toList(),
        status: json['status'],
        message: json['message'],
        errorCode: json['errorCode']);
  }
}
