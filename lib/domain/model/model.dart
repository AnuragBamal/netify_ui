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
