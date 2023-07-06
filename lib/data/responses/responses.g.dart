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

ResellerMapResponse _$ResellerMapResponseFromJson(Map<String, dynamic> json) =>
    ResellerMapResponse(
      resellerMap: (json['resellerMap'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      userName: json['userName'] as String?,
      garudaDomain: json['garudaDomain'] as String?,
    );

Map<String, dynamic> _$ResellerMapResponseToJson(
        ResellerMapResponse instance) =>
    <String, dynamic>{
      'resellerMap': instance.resellerMap,
      'userName': instance.userName,
      'garudaDomain': instance.garudaDomain,
    };

GetResellerMapResponse _$GetResellerMapResponseFromJson(
        Map<String, dynamic> json) =>
    GetResellerMapResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ResellerMapResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?
      ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$GetResellerMapResponseToJson(
        GetResellerMapResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

PlansResponse _$PlansResponseFromJson(Map<String, dynamic> json) =>
    PlansResponse(
      planId: json['planId'] as String?,
      planName: json['planName'] as String?,
      planDescription: json['planDescription'] as String?,
      isPlanActive: json['isActive'] as bool?,
      planPrice: (json['price'] as num?)?.toDouble(),
      planStartDate: json['createdAt'] as String?,
      planUpdatedDate: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$PlansResponseToJson(PlansResponse instance) =>
    <String, dynamic>{
      'planId': instance.planId,
      'planName': instance.planName,
      'planDescription': instance.planDescription,
      'isActive': instance.isPlanActive,
      'price': instance.planPrice,
      'createdAt': instance.planStartDate,
      'updatedAt': instance.planUpdatedDate,
    };

GetPlansResponse _$GetPlansResponseFromJson(Map<String, dynamic> json) =>
    GetPlansResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => PlansResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?
      ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$GetPlansResponseToJson(GetPlansResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

ResellerPriceChartResponse _$ResellerPriceChartResponseFromJson(
        Map<String, dynamic> json) =>
    ResellerPriceChartResponse(
      id: json['id'] as int?,
      planId: json['planId'] as String?,
      planName: json['planName'] as String?,
      resellerId: json['resellerId'] as String?,
      resellerUserName: json['resellerUserName'] as String?,
      price: (json['price'] as num?)?.toDouble(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$ResellerPriceChartResponseToJson(
        ResellerPriceChartResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'planId': instance.planId,
      'planName': instance.planName,
      'resellerId': instance.resellerId,
      'resellerUserName': instance.resellerUserName,
      'price': instance.price,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

GetResellerPriceChartResponse _$GetResellerPriceChartResponseFromJson(
        Map<String, dynamic> json) =>
    GetResellerPriceChartResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              ResellerPriceChartResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?
      ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$GetResellerPriceChartResponseToJson(
        GetResellerPriceChartResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

OperatorPriceChartResponse _$OperatorPriceChartResponseFromJson(
        Map<String, dynamic> json) =>
    OperatorPriceChartResponse(
      id: json['id'] as int?,
      planId: json['planId'] as String?,
      planName: json['planName'] as String?,
      operatorId: json['operatorId'] as String?,
      operatorUserName: json['operatorUserName'] as String?,
      resellerId: json['resellerId'] as String?,
      resellerUserName: json['resellerUserName'] as String?,
      planPrice: (json['price'] as num?)?.toDouble(),
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$OperatorPriceChartResponseToJson(
        OperatorPriceChartResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'planId': instance.planId,
      'planName': instance.planName,
      'operatorId': instance.operatorId,
      'operatorUserName': instance.operatorUserName,
      'resellerId': instance.resellerId,
      'resellerUserName': instance.resellerUserName,
      'price': instance.planPrice,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

GetOperatorPriceChartResponse _$GetOperatorPriceChartResponseFromJson(
        Map<String, dynamic> json) =>
    GetOperatorPriceChartResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              OperatorPriceChartResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?
      ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$GetOperatorPriceChartResponseToJson(
        GetOperatorPriceChartResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

PlanProfileMetaPlanResponse _$PlanProfileMetaPlanResponseFromJson(
        Map<String, dynamic> json) =>
    PlanProfileMetaPlanResponse(
      planId: json['planId'] as String?,
      planName: json['planName'] as String?,
      planPrice: (json['planPrice'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$PlanProfileMetaPlanResponseToJson(
        PlanProfileMetaPlanResponse instance) =>
    <String, dynamic>{
      'planId': instance.planId,
      'planName': instance.planName,
      'planPrice': instance.planPrice,
    };

PlanProfileMetaResponse _$PlanProfileMetaResponseFromJson(
        Map<String, dynamic> json) =>
    PlanProfileMetaResponse(
      role: json['role'] as String?,
      ownerUserName: json['ownerUserName'] as String?,
      userName: json['userName'] as String?,
      planList: (json['planList'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      resellerOperatorMap:
          (json['resellerOperatorMap'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      planScreens: (json['planScreens'] as List<dynamic>?)
          ?.map((e) =>
              MainPageModelResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
      resellerPlanMap: (json['resellerPlanMap'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => PlanProfileMetaPlanResponse.fromJson(
                    e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$PlanProfileMetaResponseToJson(
        PlanProfileMetaResponse instance) =>
    <String, dynamic>{
      'role': instance.role,
      'ownerUserName': instance.ownerUserName,
      'userName': instance.userName,
      'planList': instance.planList,
      'resellerOperatorMap': instance.resellerOperatorMap,
      'planScreens': instance.planScreens,
      'resellerPlanMap': instance.resellerPlanMap,
    };

GetPlanProfileMetaResponse _$GetPlanProfileMetaResponseFromJson(
        Map<String, dynamic> json) =>
    GetPlanProfileMetaResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              PlanProfileMetaResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?
      ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$GetPlanProfileMetaResponseToJson(
        GetPlanProfileMetaResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };
