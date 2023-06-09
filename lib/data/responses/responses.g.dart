// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responses.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponse _$BaseResponseFromJson(Map<String, dynamic> json) => BaseResponse()
  ..status = json['status'] as String?
  ..message = json['message'] as String?
  ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$BaseResponseToJson(BaseResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errorCode': instance.errorCode,
    };

LoginDataResponse _$LoginDataResponseFromJson(Map<String, dynamic> json) =>
    LoginDataResponse(
      token: json['token'] as String?,
      isVerified: json['isVerified'] as bool?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      userName: json['userName'] as String?,
    );

Map<String, dynamic> _$LoginDataResponseToJson(LoginDataResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'isVerified': instance.isVerified,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'userName': instance.userName,
    };

SuccessMessageResponse _$SuccessMessageResponseFromJson(
        Map<String, dynamic> json) =>
    SuccessMessageResponse(
      message: json['message'] as String?,
    );

Map<String, dynamic> _$SuccessMessageResponseToJson(
        SuccessMessageResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
    };

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => LoginDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?
      ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

GeneralSuccessResponse _$GeneralSuccessResponseFromJson(
        Map<String, dynamic> json) =>
    GeneralSuccessResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map(
              (e) => SuccessMessageResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?
      ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$GeneralSuccessResponseToJson(
        GeneralSuccessResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };
