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

FilterResponseData _$FilterResponseDataFromJson(Map<String, dynamic> json) =>
    FilterResponseData(
      name: json['name'] as String?,
      type: json['type'] as String?,
      label: json['label'] as String?,
      options:
          (json['options'] as List<dynamic>?)?.map((e) => e as String).toList(),
      placeholder: json['placeholder'] as String?,
    );

Map<String, dynamic> _$FilterResponseDataToJson(FilterResponseData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'label': instance.label,
      'options': instance.options,
      'placeholder': instance.placeholder,
    };

MainPageModelResponseData _$MainPageModelResponseDataFromJson(
        Map<String, dynamic> json) =>
    MainPageModelResponseData(
      viewType: json['viewType'] as String?,
      title: json['title'] as String?,
      dataTypeIdentity: json['dataTypeIdentity'] as String?,
      screenTypeIdentity: json['screenTypeIdentity'] as String?,
      index: json['index'] as int?,
      filter: (json['filter'] as List<dynamic>?)
          ?.map((e) => FilterResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$MainPageModelResponseDataToJson(
        MainPageModelResponseData instance) =>
    <String, dynamic>{
      'viewType': instance.viewType,
      'title': instance.title,
      'dataTypeIdentity': instance.dataTypeIdentity,
      'screenTypeIdentity': instance.screenTypeIdentity,
      'index': instance.index,
      'filter': instance.filter,
    };

GetUserResponseData _$GetUserResponseDataFromJson(Map<String, dynamic> json) =>
    GetUserResponseData(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      userName: json['userName'] as String?,
      companyName: json['companyName'] as String?,
      brandName: json['brandName'] as String?,
      role: json['role'] as String?,
      userId: json['userId'] as String?,
      ownerUserName: json['ownerUsername'] as String?,
      walletId: json['walletId'] as String?,
      homeScreens: (json['homeScreens'] as List<dynamic>?)
          ?.map((e) =>
              MainPageModelResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
      resellerList: (json['resellerList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      operatorList: (json['operatorList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      resellerOperatorMap:
          (json['resellerOperatorMap'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$GetUserResponseDataToJson(
        GetUserResponseData instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'mobileNumber': instance.mobileNumber,
      'userName': instance.userName,
      'companyName': instance.companyName,
      'brandName': instance.brandName,
      'role': instance.role,
      'userId': instance.userId,
      'ownerUsername': instance.ownerUserName,
      'walletId': instance.walletId,
      'homeScreens': instance.homeScreens,
      'resellerList': instance.resellerList,
      'operatorList': instance.operatorList,
      'resellerOperatorMap': instance.resellerOperatorMap,
    };

GetUserResponse _$GetUserResponseFromJson(Map<String, dynamic> json) =>
    GetUserResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => GetUserResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?
      ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$GetUserResponseToJson(GetUserResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

GetDashboardItemResponse _$GetDashboardItemResponseFromJson(
        Map<String, dynamic> json) =>
    GetDashboardItemResponse(
      assetName: json['assetName'] as String?,
      assetCount: json['assetCount'] as int?,
      referenceScreenId: json['referenceScreenId'] as int?,
      screenTypeIdentity: json['screenTypeIdentity'] as String?,
      color: json['color'] as String?,
    );

Map<String, dynamic> _$GetDashboardItemResponseToJson(
        GetDashboardItemResponse instance) =>
    <String, dynamic>{
      'assetName': instance.assetName,
      'assetCount': instance.assetCount,
      'referenceScreenId': instance.referenceScreenId,
      'screenTypeIdentity': instance.screenTypeIdentity,
      'color': instance.color,
    };

GetUserListItemResponse _$GetUserListItemResponseFromJson(
        Map<String, dynamic> json) =>
    GetUserListItemResponse(
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      userName: json['userName'] as String?,
      companyName: json['companyName'] as String?,
      brandName: json['brandName'] as String?,
      role: json['role'] as String?,
      userId: json['userId'] as String?,
      status: json['status'] as String?,
      address: json['address'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      pincode: json['pincode'] as String?,
      gstNumber: json['gstNumber'] as String?,
    );

Map<String, dynamic> _$GetUserListItemResponseToJson(
        GetUserListItemResponse instance) =>
    <String, dynamic>{
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'mobileNumber': instance.mobileNumber,
      'userName': instance.userName,
      'companyName': instance.companyName,
      'brandName': instance.brandName,
      'role': instance.role,
      'userId': instance.userId,
      'status': instance.status,
      'address': instance.address,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'pincode': instance.pincode,
      'gstNumber': instance.gstNumber,
    };

GetUserListBlockResponse _$GetUserListBlockResponseFromJson(
        Map<String, dynamic> json) =>
    GetUserListBlockResponse(
      users: (json['users'] as List<dynamic>?)
          ?.map((e) =>
              GetUserListItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      isSearch: json['isSearch'] as bool?,
      screenTypeIdentity: json['screenTypeIdentity'] as String?,
    );

Map<String, dynamic> _$GetUserListBlockResponseToJson(
        GetUserListBlockResponse instance) =>
    <String, dynamic>{
      'users': instance.users,
      'isSearch': instance.isSearch,
      'screenTypeIdentity': instance.screenTypeIdentity,
    };

GetUserListResponse _$GetUserListResponseFromJson(Map<String, dynamic> json) =>
    GetUserListResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              GetUserListBlockResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?
      ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$GetUserListResponseToJson(
        GetUserListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

GetDashboardResponse _$GetDashboardResponseFromJson(
        Map<String, dynamic> json) =>
    GetDashboardResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              GetDashboardItemResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?
      ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$GetDashboardResponseToJson(
        GetDashboardResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };
