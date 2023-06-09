import 'package:json_annotation/json_annotation.dart';

part 'responses.g.dart';

@JsonSerializable()
class BaseResponse {
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "message")
  String? message;
  @JsonKey(name: "errorCode")
  String? errorCode;
}

@JsonSerializable()
class LoginDataResponse {
  @JsonKey(name: "token")
  String? token;
  @JsonKey(name: "isVerified")
  bool? isVerified;
  @JsonKey(name: "firstName")
  String? firstName;
  @JsonKey(name: "lastName")
  String? lastName;
  @JsonKey(name: "userName")
  String? userName;

  factory LoginDataResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataResponseToJson(this);

  LoginDataResponse(
      {this.token,
      this.isVerified,
      this.firstName,
      this.lastName,
      this.userName});
}

@JsonSerializable()
class SuccessMessageResponse {
  @JsonKey(name: "message")
  String? message;

  factory SuccessMessageResponse.fromJson(Map<String, dynamic> json) =>
      _$SuccessMessageResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SuccessMessageResponseToJson(this);

  SuccessMessageResponse({this.message});
}

@JsonSerializable()
class LoginResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<LoginDataResponse>? data;

  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginResponseToJson(this);

  LoginResponse({this.data});
}

@JsonSerializable()
class GeneralSuccessResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<SuccessMessageResponse>? data;

  factory GeneralSuccessResponse.fromJson(Map<String, dynamic> json) =>
      _$GeneralSuccessResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GeneralSuccessResponseToJson(this);

  GeneralSuccessResponse({this.data});
}
