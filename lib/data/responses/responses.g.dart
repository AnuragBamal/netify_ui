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
      roleId: json['roleId'] as int?,
    );

Map<String, dynamic> _$LoginDataResponseToJson(LoginDataResponse instance) =>
    <String, dynamic>{
      'token': instance.token,
      'isVerified': instance.isVerified,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'userName': instance.userName,
      'roleId': instance.roleId,
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

PanelButtonResponseData _$PanelButtonResponseDataFromJson(
        Map<String, dynamic> json) =>
    PanelButtonResponseData(
      name: json['name'] as String?,
      type: json['type'] as String?,
      label: json['label'] as String?,
      details: json['details'] as String?,
      color: json['color'] as String?,
      extractInfo: (json['extractInfo'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      disable: (json['disable'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$PanelButtonResponseDataToJson(
        PanelButtonResponseData instance) =>
    <String, dynamic>{
      'name': instance.name,
      'type': instance.type,
      'label': instance.label,
      'details': instance.details,
      'color': instance.color,
      'extractInfo': instance.extractInfo,
      'disable': instance.disable,
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
    )..actionButtons = (json['actionButtons'] as List<dynamic>?)
        ?.map(
            (e) => PanelButtonResponseData.fromJson(e as Map<String, dynamic>))
        .toList();

Map<String, dynamic> _$MainPageModelResponseDataToJson(
        MainPageModelResponseData instance) =>
    <String, dynamic>{
      'viewType': instance.viewType,
      'title': instance.title,
      'dataTypeIdentity': instance.dataTypeIdentity,
      'screenTypeIdentity': instance.screenTypeIdentity,
      'index': instance.index,
      'filter': instance.filter,
      'actionButtons': instance.actionButtons,
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
      basePrice: (json['basePrice'] as num?)?.toDouble(),
      planType: json['planType'] as String?,
      downloadSpeed: json['downloadSpeed'] as String?,
      uploadSpeed: json['uploadSpeed'] as String?,
      dataLimit: json['dataLimit'] as String?,
      dataLimitFUP: json['dataLimitFUP'] as String?,
      downloadSpeedFUP: json['downloadSpeedFUP'] as String?,
      uploadSpeedFUP: json['uploadSpeedFUP'] as String?,
      planValidity: json['planValidity'] as String?,
    );

Map<String, dynamic> _$PlansResponseToJson(PlansResponse instance) =>
    <String, dynamic>{
      'planId': instance.planId,
      'planName': instance.planName,
      'planDescription': instance.planDescription,
      'isActive': instance.isPlanActive,
      'price': instance.planPrice,
      'basePrice': instance.basePrice,
      'planType': instance.planType,
      'downloadSpeed': instance.downloadSpeed,
      'uploadSpeed': instance.uploadSpeed,
      'dataLimit': instance.dataLimit,
      'dataLimitFUP': instance.dataLimitFUP,
      'downloadSpeedFUP': instance.downloadSpeedFUP,
      'uploadSpeedFUP': instance.uploadSpeedFUP,
      'planValidity': instance.planValidity,
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
          ?.map((e) =>
              PlanProfileMetaPlanResponse.fromJson(e as Map<String, dynamic>))
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
    )
      ..taxRate = (json['taxRate'] as num?)?.toDouble()
      ..planSpeedUnit = (json['planSpeedUnit'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..planDataLimitUnit = (json['planDataLimitUnit'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..planValidityUnit = (json['planValidityUnit'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList()
      ..planType = (json['planType'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList();

Map<String, dynamic> _$PlanProfileMetaResponseToJson(
        PlanProfileMetaResponse instance) =>
    <String, dynamic>{
      'role': instance.role,
      'ownerUserName': instance.ownerUserName,
      'userName': instance.userName,
      'taxRate': instance.taxRate,
      'planList': instance.planList,
      'planSpeedUnit': instance.planSpeedUnit,
      'planDataLimitUnit': instance.planDataLimitUnit,
      'planValidityUnit': instance.planValidityUnit,
      'planType': instance.planType,
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

AddressResponse _$AddressResponseFromJson(Map<String, dynamic> json) =>
    AddressResponse(
      addressId: json['addressId'] as String?,
      streetAddress: json['streetAddress'] as String?,
      addressType: json['addressType'] as String?,
      city: json['city'] as String?,
      state: json['state'] as String?,
      country: json['country'] as String?,
      postalcode: json['postalcode'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$AddressResponseToJson(AddressResponse instance) =>
    <String, dynamic>{
      'addressId': instance.addressId,
      'streetAddress': instance.streetAddress,
      'addressType': instance.addressType,
      'city': instance.city,
      'state': instance.state,
      'country': instance.country,
      'postalcode': instance.postalcode,
      'updatedAt': instance.updatedAt,
    };

SubscriberResponse _$SubscriberResponseFromJson(Map<String, dynamic> json) =>
    SubscriberResponse(
      userName: json['userName'] as String?,
      customerId: json['customerId'] as String?,
      firstName: json['firstName'] as String?,
      lastName: json['lastName'] as String?,
      email: json['email'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
      operatorUserName: json['operatorUserName'] as String?,
      resellerUserName: json['resellerUserName'] as String?,
      permanentAddress: json['permanentAddress'] == null
          ? null
          : AddressResponse.fromJson(
              json['permanentAddress'] as Map<String, dynamic>),
      billingAddress: json['billingAddress'] == null
          ? null
          : AddressResponse.fromJson(
              json['billingAddress'] as Map<String, dynamic>),
      companyName: json['companyName'] as String?,
      brandName: json['brandName'] as String?,
      gstNumber: json['gstNumber'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
    );

Map<String, dynamic> _$SubscriberResponseToJson(SubscriberResponse instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'customerId': instance.customerId,
      'firstName': instance.firstName,
      'lastName': instance.lastName,
      'email': instance.email,
      'mobileNumber': instance.mobileNumber,
      'operatorUserName': instance.operatorUserName,
      'resellerUserName': instance.resellerUserName,
      'permanentAddress': instance.permanentAddress,
      'billingAddress': instance.billingAddress,
      'companyName': instance.companyName,
      'brandName': instance.brandName,
      'gstNumber': instance.gstNumber,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

SubscriptionResponse _$SubscriptionResponseFromJson(
        Map<String, dynamic> json) =>
    SubscriptionResponse(
      subscriptionId: json['subscriptionId'] as String?,
      subscriberUserName: json['subscriberUserName'] as String?,
      resellerUserName: json['resellerUserName'] as String?,
      operatorUserName: json['operatorUserName'] as String?,
      status: json['status'] as String?,
      planName: json['planName'] as String?,
      networkType: json['networkType'] as String?,
      assignedIp: json['assignedIp'] as String?,
      ipType: json['ipType'] as String?,
      subscriptionDate: json['subscriptionDate'] as String?,
      lastRenewalDate: json['lastRenewalDate'] as String?,
      nextRenewalDate: json['nextRenewalDate'] as String?,
      installationAddress: json['installationAddress'] == null
          ? null
          : AddressResponse.fromJson(
              json['installationAddress'] as Map<String, dynamic>),
      permanentAddress: json['permanentAddress'] == null
          ? null
          : AddressResponse.fromJson(
              json['permanentAddress'] as Map<String, dynamic>),
      billingAddress: json['billingAddress'] == null
          ? null
          : AddressResponse.fromJson(
              json['billingAddress'] as Map<String, dynamic>),
      basePrice: (json['basePrice'] as num?)?.toDouble(),
      offeredPrice: (json['offeredPrice'] as num?)?.toDouble(),
      securityDeposit: (json['securityDeposit'] as num?)?.toDouble(),
      installationCharge: (json['installationCharge'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SubscriptionResponseToJson(
        SubscriptionResponse instance) =>
    <String, dynamic>{
      'subscriptionId': instance.subscriptionId,
      'subscriberUserName': instance.subscriberUserName,
      'resellerUserName': instance.resellerUserName,
      'operatorUserName': instance.operatorUserName,
      'status': instance.status,
      'planName': instance.planName,
      'networkType': instance.networkType,
      'assignedIp': instance.assignedIp,
      'ipType': instance.ipType,
      'subscriptionDate': instance.subscriptionDate,
      'lastRenewalDate': instance.lastRenewalDate,
      'nextRenewalDate': instance.nextRenewalDate,
      'installationAddress': instance.installationAddress,
      'permanentAddress': instance.permanentAddress,
      'billingAddress': instance.billingAddress,
      'basePrice': instance.basePrice,
      'offeredPrice': instance.offeredPrice,
      'securityDeposit': instance.securityDeposit,
      'installationCharge': instance.installationCharge,
    };

SubscriberListBlockResponse _$SubscriberListBlockResponseFromJson(
        Map<String, dynamic> json) =>
    SubscriberListBlockResponse(
      subscribers: (json['subscribers'] as List<dynamic>?)
          ?.map((e) => SubscriberResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      isSearch: json['isSearch'] as bool?,
      screenTypeIdentity: json['screenTypeIdentity'] as String?,
    );

Map<String, dynamic> _$SubscriberListBlockResponseToJson(
        SubscriberListBlockResponse instance) =>
    <String, dynamic>{
      'subscribers': instance.subscribers,
      'isSearch': instance.isSearch,
      'screenTypeIdentity': instance.screenTypeIdentity,
    };

SubscriptionListBlockResponse _$SubscriptionListBlockResponseFromJson(
        Map<String, dynamic> json) =>
    SubscriptionListBlockResponse(
      subscriptions: (json['subscriptions'] as List<dynamic>?)
          ?.map((e) => SubscriptionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      isSearch: json['isSearch'] as bool?,
      screenTypeIdentity: json['screenTypeIdentity'] as String?,
    );

Map<String, dynamic> _$SubscriptionListBlockResponseToJson(
        SubscriptionListBlockResponse instance) =>
    <String, dynamic>{
      'subscriptions': instance.subscriptions,
      'isSearch': instance.isSearch,
      'screenTypeIdentity': instance.screenTypeIdentity,
    };

GetSubscriberListBlockResponse _$GetSubscriberListBlockResponseFromJson(
        Map<String, dynamic> json) =>
    GetSubscriberListBlockResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              SubscriberListBlockResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?
      ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$GetSubscriberListBlockResponseToJson(
        GetSubscriberListBlockResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

GetSubscriptionListBlockResponse _$GetSubscriptionListBlockResponseFromJson(
        Map<String, dynamic> json) =>
    GetSubscriptionListBlockResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              SubscriptionListBlockResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?
      ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$GetSubscriptionListBlockResponseToJson(
        GetSubscriptionListBlockResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

PayeeResponse _$PayeeResponseFromJson(Map<String, dynamic> json) =>
    PayeeResponse(
      userName: json['userName'] as String?,
      userId: json['userId'] as String?,
    );

Map<String, dynamic> _$PayeeResponseToJson(PayeeResponse instance) =>
    <String, dynamic>{
      'userName': instance.userName,
      'userId': instance.userId,
    };

TransactionResponse _$TransactionResponseFromJson(Map<String, dynamic> json) =>
    TransactionResponse(
      transactionId: json['transactionId'] as String?,
      senderUsername: json['senderUsername'] as String?,
      receiverUsername: json['receiverUsername'] as String?,
      amount: (json['amount'] as num?)?.toDouble(),
      transactionStatus: json['transactionStatus'] as String?,
      transactionType: json['transactionType'] as String?,
      transactionDate: json['transactionDate'] as String?,
      openingBalance: (json['openingBalance'] as num?)?.toDouble(),
      closingBalance: (json['closingBalance'] as num?)?.toDouble(),
      remarks: json['remarks'] as String?,
      billNumber: json['billNumber'] as String?,
      billAmount: (json['billAmount'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$TransactionResponseToJson(
        TransactionResponse instance) =>
    <String, dynamic>{
      'transactionId': instance.transactionId,
      'senderUsername': instance.senderUsername,
      'receiverUsername': instance.receiverUsername,
      'amount': instance.amount,
      'transactionStatus': instance.transactionStatus,
      'transactionType': instance.transactionType,
      'transactionDate': instance.transactionDate,
      'openingBalance': instance.openingBalance,
      'closingBalance': instance.closingBalance,
      'remarks': instance.remarks,
      'billNumber': instance.billNumber,
      'billAmount': instance.billAmount,
    };

UserWalletResponse _$UserWalletResponseFromJson(Map<String, dynamic> json) =>
    UserWalletResponse(
      balance: (json['balance'] as num?)?.toDouble(),
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => TransactionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      payee: (json['payee'] as List<dynamic>?)
          ?.map((e) => PayeeResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$UserWalletResponseToJson(UserWalletResponse instance) =>
    <String, dynamic>{
      'balance': instance.balance,
      'transactions': instance.transactions,
      'payee': instance.payee,
    };

GetUserWalletResponse _$GetUserWalletResponseFromJson(
        Map<String, dynamic> json) =>
    GetUserWalletResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => UserWalletResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?
      ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$GetUserWalletResponseToJson(
        GetUserWalletResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

SubscriberMapInfoResponse _$SubscriberMapInfoResponseFromJson(
        Map<String, dynamic> json) =>
    SubscriberMapInfoResponse(
      subscriberUserName: json['subscriberUserName'] as String?,
      customerId: json['customerId'] as String?,
      email: json['email'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
    );

Map<String, dynamic> _$SubscriberMapInfoResponseToJson(
        SubscriberMapInfoResponse instance) =>
    <String, dynamic>{
      'subscriberUserName': instance.subscriberUserName,
      'customerId': instance.customerId,
      'mobileNumber': instance.mobileNumber,
      'email': instance.email,
    };

SubscriptionMetaResponse _$SubscriptionMetaResponseFromJson(
        Map<String, dynamic> json) =>
    SubscriptionMetaResponse(
      resellerOperatorMap:
          (json['resellerOperatorMap'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      operatorSubscriberMap:
          (json['operatorSubscriberMap'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => SubscriberMapInfoResponse.fromJson(
                    e as Map<String, dynamic>))
                .toList()),
      ),
      operatorPlanMap: (json['operatorPlanMap'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => PlanProfileMetaPlanResponse.fromJson(
                    e as Map<String, dynamic>))
                .toList()),
      ),
      networkType: (json['networkType'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      ipType:
          (json['ipType'] as List<dynamic>?)?.map((e) => e as String).toList(),
      availiableIps: (json['availiableIps'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
      taxRate: (json['taxRate'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$SubscriptionMetaResponseToJson(
        SubscriptionMetaResponse instance) =>
    <String, dynamic>{
      'resellerOperatorMap': instance.resellerOperatorMap,
      'operatorPlanMap': instance.operatorPlanMap,
      'operatorSubscriberMap': instance.operatorSubscriberMap,
      'networkType': instance.networkType,
      'ipType': instance.ipType,
      'availiableIps': instance.availiableIps,
      'taxRate': instance.taxRate,
    };

GetSubscriptionMetaResponse _$GetSubscriptionMetaResponseFromJson(
        Map<String, dynamic> json) =>
    GetSubscriptionMetaResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              SubscriptionMetaResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?
      ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$GetSubscriptionMetaResponseToJson(
        GetSubscriptionMetaResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

SettingsProfileMetaResponse _$SettingsProfileMetaResponseFromJson(
        Map<String, dynamic> json) =>
    SettingsProfileMetaResponse(
      role: json['role'] as String?,
      ownerUserName: json['ownerUserName'] as String?,
      userName: json['userName'] as String?,
      settingScreens: (json['settingScreens'] as List<dynamic>?)
          ?.map((e) =>
              MainPageModelResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
      tenantId: json['tenantId'] as String?,
      supportedNasType: (json['supportedNasType'] as List<dynamic>?)
          ?.map((e) => e as String)
          .toList(),
    );

Map<String, dynamic> _$SettingsProfileMetaResponseToJson(
        SettingsProfileMetaResponse instance) =>
    <String, dynamic>{
      'role': instance.role,
      'ownerUserName': instance.ownerUserName,
      'userName': instance.userName,
      'settingScreens': instance.settingScreens,
      'tenantId': instance.tenantId,
      'supportedNasType': instance.supportedNasType,
    };

GetSettingsProfileMetaResponse _$GetSettingsProfileMetaResponseFromJson(
        Map<String, dynamic> json) =>
    GetSettingsProfileMetaResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              SettingsProfileMetaResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?
      ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$GetSettingsProfileMetaResponseToJson(
        GetSettingsProfileMetaResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

PaymentProfileMetaResponse _$PaymentProfileMetaResponseFromJson(
        Map<String, dynamic> json) =>
    PaymentProfileMetaResponse(
      role: json['role'] as String?,
      ownerUserName: json['ownerUserName'] as String?,
      userName: json['userName'] as String?,
      paymentScreens: (json['paymentScreens'] as List<dynamic>?)
          ?.map((e) =>
              MainPageModelResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$PaymentProfileMetaResponseToJson(
        PaymentProfileMetaResponse instance) =>
    <String, dynamic>{
      'role': instance.role,
      'ownerUserName': instance.ownerUserName,
      'userName': instance.userName,
      'paymentScreens': instance.paymentScreens,
    };

GetPaymentProfileMetaResponse _$GetPaymentProfileMetaResponseFromJson(
        Map<String, dynamic> json) =>
    GetPaymentProfileMetaResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              PaymentProfileMetaResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?
      ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$GetPaymentProfileMetaResponseToJson(
        GetPaymentProfileMetaResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

ServiceResponse _$ServiceResponseFromJson(Map<String, dynamic> json) =>
    ServiceResponse(
      serviceId: json['serviceId'] as String?,
      serviceName: json['serviceName'] as String?,
      serviceDescription: json['serviceDescription'] as String?,
      serviceCost: (json['serviceType'] as num?)?.toDouble(),
    );

Map<String, dynamic> _$ServiceResponseToJson(ServiceResponse instance) =>
    <String, dynamic>{
      'serviceId': instance.serviceId,
      'serviceName': instance.serviceName,
      'serviceDescription': instance.serviceDescription,
      'serviceType': instance.serviceCost,
    };

SubscribedServiceResponse _$SubscribedServiceResponseFromJson(
        Map<String, dynamic> json) =>
    SubscribedServiceResponse(
      tenantId: json['tenantId'] as String?,
      subscriptionId: json['subscriptionId'] as String?,
      serviceId: json['serviceId'] as String?,
      startDate: json['startDate'] as String?,
      endDate: json['endDate'] as String?,
      subscriptionData: json['subscriptionData'] as Map<String, dynamic>?,
      status: json['status'] as String?,
    );

Map<String, dynamic> _$SubscribedServiceResponseToJson(
        SubscribedServiceResponse instance) =>
    <String, dynamic>{
      'tenantId': instance.tenantId,
      'subscriptionId': instance.subscriptionId,
      'serviceId': instance.serviceId,
      'startDate': instance.startDate,
      'endDate': instance.endDate,
      'subscriptionData': instance.subscriptionData,
      'status': instance.status,
    };

NasResponse _$NasResponseFromJson(Map<String, dynamic> json) => NasResponse(
      id: json['id'] as String?,
      nasname: json['nasname'] as String?,
      shortname: json['shortname'] as String?,
      secret: json['secret'] as String?,
      type: json['type'] as String?,
      ports: json['ports'] as int?,
      description: json['description'] as String?,
      community: json['community'] as String?,
      server: json['server'] as String?,
    );

Map<String, dynamic> _$NasResponseToJson(NasResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'nasname': instance.nasname,
      'shortname': instance.shortname,
      'secret': instance.secret,
      'type': instance.type,
      'ports': instance.ports,
      'description': instance.description,
      'community': instance.community,
      'server': instance.server,
    };

ServiceInfoResponse _$ServiceInfoResponseFromJson(Map<String, dynamic> json) =>
    ServiceInfoResponse(
      services: (json['services'] as List<dynamic>?)
          ?.map((e) => ServiceResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      subscribedServices: (json['subscribedServices'] as List<dynamic>?)
          ?.map((e) =>
              SubscribedServiceResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ServiceInfoResponseToJson(
        ServiceInfoResponse instance) =>
    <String, dynamic>{
      'services': instance.services,
      'subscribedServices': instance.subscribedServices,
    };

GetServicesInfoResponse _$GetServicesInfoResponseFromJson(
        Map<String, dynamic> json) =>
    GetServicesInfoResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => ServiceInfoResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?
      ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$GetServicesInfoResponseToJson(
        GetServicesInfoResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

GetNasListResponse _$GetNasListResponseFromJson(Map<String, dynamic> json) =>
    GetNasListResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => NasResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?
      ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$GetNasListResponseToJson(GetNasListResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

OperatorSubscriberMapResponse _$OperatorSubscriberMapResponseFromJson(
        Map<String, dynamic> json) =>
    OperatorSubscriberMapResponse(
      subscriberUserName: json['subscriberUserName'] as String?,
      customerId: json['customerId'] as String?,
      email: json['email'] as String?,
      mobileNumber: json['mobileNumber'] as String?,
    );

Map<String, dynamic> _$OperatorSubscriberMapResponseToJson(
        OperatorSubscriberMapResponse instance) =>
    <String, dynamic>{
      'subscriberUserName': instance.subscriberUserName,
      'customerId': instance.customerId,
      'mobileNumber': instance.mobileNumber,
      'email': instance.email,
    };

SubscriptionSubscriberMapResponse _$SubscriptionSubscriberMapResponseFromJson(
        Map<String, dynamic> json) =>
    SubscriptionSubscriberMapResponse(
      planName: json['planName'] as String?,
      operatorUserName: json['operatorUserName'] as String?,
      offeredPrice: (json['offeredPrice'] as num?)?.toDouble(),
      subscriptionId: json['subscriptionId'] as String?,
      subscriptionStatus: json['subscriptionStatus'] as String?,
      networkType: json['networkType'] as String?,
      ipType: json['ipType'] as String?,
      lastRenewalDate: json['lastRenewalDate'] as String?,
    );

Map<String, dynamic> _$SubscriptionSubscriberMapResponseToJson(
        SubscriptionSubscriberMapResponse instance) =>
    <String, dynamic>{
      'planName': instance.planName,
      'operatorUserName': instance.operatorUserName,
      'offeredPrice': instance.offeredPrice,
      'subscriptionId': instance.subscriptionId,
      'subscriptionStatus': instance.subscriptionStatus,
      'networkType': instance.networkType,
      'ipType': instance.ipType,
      'lastRenewalDate': instance.lastRenewalDate,
    };

BillingProfileMetaResponse _$BillingProfileMetaResponseFromJson(
        Map<String, dynamic> json) =>
    BillingProfileMetaResponse(
      role: json['role'] as String?,
      ownerUserName: json['ownerUserName'] as String?,
      userName: json['userName'] as String?,
      billingScreens: (json['billingScreens'] as List<dynamic>?)
          ?.map((e) =>
              MainPageModelResponseData.fromJson(e as Map<String, dynamic>))
          .toList(),
      resellerOperatorMap:
          (json['resellerOperatorMap'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
      operatorSubscriberMap:
          (json['operatorSubscriberMap'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => OperatorSubscriberMapResponse.fromJson(
                    e as Map<String, dynamic>))
                .toList()),
      ),
      subscriptionSubscriberMap:
          (json['subscriberSubscriptionMap'] as Map<String, dynamic>?)?.map(
        (k, e) => MapEntry(
            k,
            (e as List<dynamic>)
                .map((e) => SubscriptionSubscriberMapResponse.fromJson(
                    e as Map<String, dynamic>))
                .toList()),
      ),
    );

Map<String, dynamic> _$BillingProfileMetaResponseToJson(
        BillingProfileMetaResponse instance) =>
    <String, dynamic>{
      'role': instance.role,
      'ownerUserName': instance.ownerUserName,
      'userName': instance.userName,
      'billingScreens': instance.billingScreens,
      'resellerOperatorMap': instance.resellerOperatorMap,
      'operatorSubscriberMap': instance.operatorSubscriberMap,
      'subscriberSubscriptionMap': instance.subscriptionSubscriberMap,
    };

GetBillingProfileMetaResponse _$GetBillingProfileMetaResponseFromJson(
        Map<String, dynamic> json) =>
    GetBillingProfileMetaResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              BillingProfileMetaResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?
      ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$GetBillingProfileMetaResponseToJson(
        GetBillingProfileMetaResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

BillsResponse _$BillsResponseFromJson(Map<String, dynamic> json) =>
    BillsResponse(
      subscriberName: json['subscriberName'] as String?,
      subscriberUserName: json['subscriberUserName'] as String?,
      customerId: json['customerId'] as String?,
      operatorName: json['operatorName'] as String?,
      operatorUserName: json['operatorUserName'] as String?,
      operatorId: json['operatorId'] as String?,
      resellerName: json['resellerName'] as String?,
      resellerUserName: json['resellerUserName'] as String?,
      resellerId: json['resellerId'] as String?,
      planName: json['planName'] as String?,
      billNumber: json['billNumber'] as String?,
      billPeriod: json['billPeriod'] as String?,
      dueDate: json['dueDate'] as String?,
      billAmount: (json['billAmount'] as num?)?.toDouble(),
      nextBillingDate: json['nextBillingDate'] as String?,
      status: json['status'] as String?,
      createdAt: json['createdAt'] as String?,
      updatedAt: json['updatedAt'] as String?,
      basicBillAmount: (json['basicBillAmount'] as num?)?.toDouble(),
      billAmountComponents: json['billAmountComponents'] as String?,
    );

Map<String, dynamic> _$BillsResponseToJson(BillsResponse instance) =>
    <String, dynamic>{
      'subscriberName': instance.subscriberName,
      'subscriberUserName': instance.subscriberUserName,
      'customerId': instance.customerId,
      'operatorName': instance.operatorName,
      'operatorUserName': instance.operatorUserName,
      'operatorId': instance.operatorId,
      'resellerName': instance.resellerName,
      'resellerUserName': instance.resellerUserName,
      'resellerId': instance.resellerId,
      'planName': instance.planName,
      'billNumber': instance.billNumber,
      'billPeriod': instance.billPeriod,
      'dueDate': instance.dueDate,
      'billAmount': instance.billAmount,
      'basicBillAmount': instance.basicBillAmount,
      'nextBillingDate': instance.nextBillingDate,
      'billAmountComponents': instance.billAmountComponents,
      'status': instance.status,
      'createdAt': instance.createdAt,
      'updatedAt': instance.updatedAt,
    };

BillsDataResponse _$BillsDataResponseFromJson(Map<String, dynamic> json) =>
    BillsDataResponse(
      bills: (json['bills'] as List<dynamic>?)
          ?.map((e) => BillsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      isSearch: json['isSearch'] as bool?,
      screenTypeIdentity: json['screenTypeIdentity'] as String?,
    );

Map<String, dynamic> _$BillsDataResponseToJson(BillsDataResponse instance) =>
    <String, dynamic>{
      'bills': instance.bills,
      'isSearch': instance.isSearch,
      'screenTypeIdentity': instance.screenTypeIdentity,
    };

GetBillsResponse _$GetBillsResponseFromJson(Map<String, dynamic> json) =>
    GetBillsResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => BillsDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?
      ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$GetBillsResponseToJson(GetBillsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

UpcomingRenewalsResponse _$UpcomingRenewalsResponseFromJson(
        Map<String, dynamic> json) =>
    UpcomingRenewalsResponse(
      planName: json['planName'] as String?,
      operatorUserName: json['operatorUserName'] as String?,
      offeredPrice: (json['offeredPrice'] as num?)?.toDouble(),
      subscriptionId: json['subscriptionId'] as String?,
      subscriptionStatus: json['subscriptionStatus'] as String?,
      networkType: json['networkType'] as String?,
      ipType: json['ipType'] as String?,
      lastRenewalDate: json['lastRenewalDate'] as String?,
      nextRenewalDate: json['nextRenewalDate'] as String?,
      resellerUserName: json['resellerUserName'] as String?,
      customerId: json['customerId'] as String?,
      subscriberUserName: json['subscriberUserName'] as String?,
      subscriberName: json['subscriberName'] as String?,
      subscriberEmail: json['subscriberEmail'] as String?,
    );

Map<String, dynamic> _$UpcomingRenewalsResponseToJson(
        UpcomingRenewalsResponse instance) =>
    <String, dynamic>{
      'planName': instance.planName,
      'operatorUserName': instance.operatorUserName,
      'offeredPrice': instance.offeredPrice,
      'subscriptionId': instance.subscriptionId,
      'subscriptionStatus': instance.subscriptionStatus,
      'networkType': instance.networkType,
      'ipType': instance.ipType,
      'lastRenewalDate': instance.lastRenewalDate,
      'nextRenewalDate': instance.nextRenewalDate,
      'resellerUserName': instance.resellerUserName,
      'customerId': instance.customerId,
      'subscriberUserName': instance.subscriberUserName,
      'subscriberName': instance.subscriberName,
      'subscriberEmail': instance.subscriberEmail,
    };

GetUpcomingRenewalsResponse _$GetUpcomingRenewalsResponseFromJson(
        Map<String, dynamic> json) =>
    GetUpcomingRenewalsResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              UpcomingRenewalsResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?
      ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$GetUpcomingRenewalsResponseToJson(
        GetUpcomingRenewalsResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

GetFileDownloadResponse _$GetFileDownloadResponseFromJson(
        Map<String, dynamic> json) =>
    GetFileDownloadResponse(
      data: (json['data'] as List<dynamic>?)?.map((e) => e as int).toList(),
      statusCode: json['statusCode'] as int?,
      statusMessage: json['statusMessage'] as String?,
      headers: (json['headers'] as Map<String, dynamic>?)?.map(
        (k, e) =>
            MapEntry(k, (e as List<dynamic>).map((e) => e as String).toList()),
      ),
    );

Map<String, dynamic> _$GetFileDownloadResponseToJson(
        GetFileDownloadResponse instance) =>
    <String, dynamic>{
      'data': instance.data,
      'statusCode': instance.statusCode,
      'statusMessage': instance.statusMessage,
      'headers': instance.headers,
    };

TransactionsDataResponse _$TransactionsDataResponseFromJson(
        Map<String, dynamic> json) =>
    TransactionsDataResponse(
      transactions: (json['transactions'] as List<dynamic>?)
          ?.map((e) => TransactionResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      isSearch: json['isSearch'] as bool?,
      screenTypeIdentity: json['screenTypeIdentity'] as String?,
    );

Map<String, dynamic> _$TransactionsDataResponseToJson(
        TransactionsDataResponse instance) =>
    <String, dynamic>{
      'transactions': instance.transactions,
      'isSearch': instance.isSearch,
      'screenTypeIdentity': instance.screenTypeIdentity,
    };

GetTransactionsDataResponse _$GetTransactionsDataResponseFromJson(
        Map<String, dynamic> json) =>
    GetTransactionsDataResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) =>
              TransactionsDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?
      ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$GetTransactionsDataResponseToJson(
        GetTransactionsDataResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };

SaleResponse _$SaleResponseFromJson(Map<String, dynamic> json) => SaleResponse(
      billNumber: json['billNumber'] as String?,
      planName: json['planName'] as String?,
      operatorUserName: json['operatorUserName'] as String?,
      resellerUserName: json['resellerUserName'] as String?,
      planBasicCost: (json['planBasicCost'] as num?)?.toDouble(),
      planOfferedCost: (json['planOfferedCost'] as num?)?.toDouble(),
      planTax: (json['planTax'] as num?)?.toDouble(),
      planProfit: (json['planProfit'] as num?)?.toDouble(),
      billAmount: (json['billAmount'] as num?)?.toDouble(),
      createdAt: json['createdAt'] as String?,
      totalTaxCollected: (json['totalTaxCollected'] as num?)?.toDouble(),
      basicBillAmount: (json['basicBillAmount'] as num?)?.toDouble(),
      billAmountComponents: json['billAmountComponents'] as String?,
    );

Map<String, dynamic> _$SaleResponseToJson(SaleResponse instance) =>
    <String, dynamic>{
      'billNumber': instance.billNumber,
      'planName': instance.planName,
      'operatorUserName': instance.operatorUserName,
      'resellerUserName': instance.resellerUserName,
      'planBasicCost': instance.planBasicCost,
      'planOfferedCost': instance.planOfferedCost,
      'planTax': instance.planTax,
      'planProfit': instance.planProfit,
      'billAmount': instance.billAmount,
      'createdAt': instance.createdAt,
      'totalTaxCollected': instance.totalTaxCollected,
      'basicBillAmount': instance.basicBillAmount,
      'billAmountComponents': instance.billAmountComponents,
    };

SalesDataResponse _$SalesDataResponseFromJson(Map<String, dynamic> json) =>
    SalesDataResponse(
      sales: (json['sales'] as List<dynamic>?)
          ?.map((e) => SaleResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
      isSearch: json['isSearch'] as bool?,
      screenTypeIdentity: json['screenTypeIdentity'] as String?,
    );

Map<String, dynamic> _$SalesDataResponseToJson(SalesDataResponse instance) =>
    <String, dynamic>{
      'sales': instance.sales,
      'isSearch': instance.isSearch,
      'screenTypeIdentity': instance.screenTypeIdentity,
    };

GetSalesDataResponse _$GetSalesDataResponseFromJson(
        Map<String, dynamic> json) =>
    GetSalesDataResponse(
      data: (json['data'] as List<dynamic>?)
          ?.map((e) => SalesDataResponse.fromJson(e as Map<String, dynamic>))
          .toList(),
    )
      ..status = json['status'] as String?
      ..message = json['message'] as String?
      ..errorCode = json['errorCode'] as String?;

Map<String, dynamic> _$GetSalesDataResponseToJson(
        GetSalesDataResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'errorCode': instance.errorCode,
      'data': instance.data,
    };
