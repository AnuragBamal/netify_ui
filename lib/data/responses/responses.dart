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

@JsonSerializable()
class FilterResponseData {
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "type")
  String? type;
  @JsonKey(name: "label")
  String? label;
  @JsonKey(name: "options")
  List<String>? options;
  @JsonKey(name: "placeholder")
  String? placeholder;

  FilterResponseData(
      {this.name, this.type, this.label, this.options, this.placeholder});

  factory FilterResponseData.fromJson(Map<String, dynamic> json) =>
      _$FilterResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$FilterResponseDataToJson(this);
}

@JsonSerializable()
class MainPageModelResponseData {
  @JsonKey(name: "viewType")
  String? viewType;
  @JsonKey(name: "title")
  String? title;
  @JsonKey(name: "dataTypeIdentity")
  String? dataTypeIdentity;
  @JsonKey(name: "screenTypeIdentity")
  String? screenTypeIdentity;
  @JsonKey(name: "index")
  int? index;
  @JsonKey(name: "filter")
  List<FilterResponseData>? filter;

  MainPageModelResponseData(
      {this.viewType,
      this.title,
      this.dataTypeIdentity,
      this.screenTypeIdentity,
      this.index,
      this.filter});

  factory MainPageModelResponseData.fromJson(Map<String, dynamic> json) =>
      _$MainPageModelResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$MainPageModelResponseDataToJson(this);
}

@JsonSerializable()
class GetUserResponseData {
  @JsonKey(name: "firstName")
  String? firstName;
  @JsonKey(name: "lastName")
  String? lastName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "mobileNumber")
  String? mobileNumber;
  @JsonKey(name: "userName")
  String? userName;
  @JsonKey(name: "companyName")
  String? companyName;
  @JsonKey(name: "brandName")
  String? brandName;
  @JsonKey(name: "role")
  String? role;
  @JsonKey(name: "userId")
  String? userId;
  @JsonKey(name: "ownerUsername")
  String? ownerUserName;
  @JsonKey(name: "walletId")
  String? walletId;
  @JsonKey(name: "homeScreens")
  List<MainPageModelResponseData>? homeScreens;
  @JsonKey(name: "resellerList")
  List<String>? resellerList;
  @JsonKey(name: "operatorList")
  List<String>? operatorList;
  @JsonKey(name: "resellerOperatorMap")
  Map<String, List<String>>? resellerOperatorMap;
  // @JsonKey(name: "dashboardData")
  // List<DashBoardItemResponse>? dashboardData;

  GetUserResponseData(
      {this.firstName,
      this.lastName,
      this.email,
      this.mobileNumber,
      this.userName,
      this.companyName,
      this.brandName,
      this.role,
      this.userId,
      this.ownerUserName,
      this.walletId,
      this.homeScreens,
      this.resellerList,
      this.operatorList,
      this.resellerOperatorMap});

  factory GetUserResponseData.fromJson(Map<String, dynamic> json) =>
      _$GetUserResponseDataFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserResponseDataToJson(this);
}

@JsonSerializable()
class GetUserResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<GetUserResponseData>? data;

  factory GetUserResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserResponseToJson(this);

  GetUserResponse({this.data});
}

@JsonSerializable()
class GetDashboardItemResponse {
  @JsonKey(name: "assetName")
  String? assetName;
  @JsonKey(name: "assetCount")
  int? assetCount;
  @JsonKey(name: "referenceScreenId")
  int? referenceScreenId;
  @JsonKey(name: "screenTypeIdentity")
  String? screenTypeIdentity;
  @JsonKey(name: "color")
  String? color;

  GetDashboardItemResponse(
      {this.assetName,
      this.assetCount,
      this.referenceScreenId,
      this.screenTypeIdentity,
      this.color});

  factory GetDashboardItemResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDashboardItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetDashboardItemResponseToJson(this);
}

@JsonSerializable()
class GetUserListItemResponse {
  @JsonKey(name: "firstName")
  String? firstName;
  @JsonKey(name: "lastName")
  String? lastName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "mobileNumber")
  String? mobileNumber;
  @JsonKey(name: "userName")
  String? userName;
  @JsonKey(name: "companyName")
  String? companyName;
  @JsonKey(name: "brandName")
  String? brandName;
  @JsonKey(name: "role")
  String? role;
  @JsonKey(name: "userId")
  String? userId;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "address")
  String? address;
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "state")
  String? state;
  @JsonKey(name: "country")
  String? country;
  @JsonKey(name: "pincode")
  String? pincode;
  @JsonKey(name: "gstNumber")
  String? gstNumber;

  GetUserListItemResponse({
    this.firstName,
    this.lastName,
    this.email,
    this.mobileNumber,
    this.userName,
    this.companyName,
    this.brandName,
    this.role,
    this.userId,
    this.status,
    this.address,
    this.city,
    this.state,
    this.country,
    this.pincode,
    this.gstNumber,
  });

  factory GetUserListItemResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserListItemResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserListItemResponseToJson(this);
}

@JsonSerializable()
class GetUserListBlockResponse {
  @JsonKey(name: "users")
  List<GetUserListItemResponse>? users;
  @JsonKey(name: "isSearch")
  bool? isSearch;
  @JsonKey(name: "screenTypeIdentity")
  String? screenTypeIdentity;

  GetUserListBlockResponse(
      {this.users, this.isSearch, this.screenTypeIdentity});

  factory GetUserListBlockResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserListBlockResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserListBlockResponseToJson(this);
}

@JsonSerializable()
class GetUserListResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<GetUserListBlockResponse>? data;

  factory GetUserListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserListResponseToJson(this);

  GetUserListResponse({this.data});
}

@JsonSerializable()
class GetDashboardResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<GetDashboardItemResponse>? data;

  factory GetDashboardResponse.fromJson(Map<String, dynamic> json) =>
      _$GetDashboardResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetDashboardResponseToJson(this);

  GetDashboardResponse({this.data});
}

@JsonSerializable()
class ResellerMapResponse {
  @JsonKey(name: "resellerMap")
  Map<String, List<String>>? resellerMap;
  @JsonKey(name: "userName")
  String? userName;
  @JsonKey(name: "garudaDomain")
  String? garudaDomain;

  ResellerMapResponse({
    this.resellerMap,
    this.userName,
    this.garudaDomain,
  });

  factory ResellerMapResponse.fromJson(Map<String, dynamic> json) =>
      _$ResellerMapResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResellerMapResponseToJson(this);
}

@JsonSerializable()
class GetResellerMapResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<ResellerMapResponse>? data;

  factory GetResellerMapResponse.fromJson(Map<String, dynamic> json) =>
      _$GetResellerMapResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetResellerMapResponseToJson(this);

  GetResellerMapResponse({this.data});
}

@JsonSerializable()
class PlansResponse {
  @JsonKey(name: "planId")
  String? planId;
  @JsonKey(name: "planName")
  String? planName;
  @JsonKey(name: "planDescription")
  String? planDescription;
  @JsonKey(name: "isActive")
  bool? isPlanActive;
  @JsonKey(name: "price")
  double? planPrice;
  @JsonKey(name: "createdAt")
  String? planStartDate;
  @JsonKey(name: "updatedAt")
  String? planUpdatedDate;

  PlansResponse({
    this.planId,
    this.planName,
    this.planDescription,
    this.isPlanActive,
    this.planPrice,
    this.planStartDate,
    this.planUpdatedDate,
  });

  factory PlansResponse.fromJson(Map<String, dynamic> json) =>
      _$PlansResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlansResponseToJson(this);
}

@JsonSerializable()
class GetPlansResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<PlansResponse>? data;

  factory GetPlansResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPlansResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPlansResponseToJson(this);

  GetPlansResponse({this.data});
}

@JsonSerializable()
class ResellerPriceChartResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "planId")
  String? planId;
  @JsonKey(name: "planName")
  String? planName;
  @JsonKey(name: "resellerId")
  String? resellerId;
  @JsonKey(name: "resellerUserName")
  String? resellerUserName;
  @JsonKey(name: "price")
  double? price;
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "updatedAt")
  String? updatedAt;

  ResellerPriceChartResponse({
    this.id,
    this.planId,
    this.planName,
    this.resellerId,
    this.resellerUserName,
    this.price,
    this.createdAt,
    this.updatedAt,
  });

  factory ResellerPriceChartResponse.fromJson(Map<String, dynamic> json) =>
      _$ResellerPriceChartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ResellerPriceChartResponseToJson(this);
}

@JsonSerializable()
class GetResellerPriceChartResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<ResellerPriceChartResponse>? data;

  factory GetResellerPriceChartResponse.fromJson(Map<String, dynamic> json) =>
      _$GetResellerPriceChartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetResellerPriceChartResponseToJson(this);

  GetResellerPriceChartResponse({this.data});
}

@JsonSerializable()
class OperatorPriceChartResponse {
  @JsonKey(name: "id")
  int? id;
  @JsonKey(name: "planId")
  String? planId;
  @JsonKey(name: "planName")
  String? planName;
  @JsonKey(name: "operatorId")
  String? operatorId;
  @JsonKey(name: "operatorUserName")
  String? operatorUserName;
  @JsonKey(name: "resellerId")
  String? resellerId;
  @JsonKey(name: "resellerUserName")
  String? resellerUserName;
  @JsonKey(name: "price")
  double? planPrice;
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "updatedAt")
  String? updatedAt;

  OperatorPriceChartResponse({
    this.id,
    this.planId,
    this.planName,
    this.operatorId,
    this.operatorUserName,
    this.resellerId,
    this.resellerUserName,
    this.planPrice,
    this.createdAt,
    this.updatedAt,
  });

  factory OperatorPriceChartResponse.fromJson(Map<String, dynamic> json) =>
      _$OperatorPriceChartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OperatorPriceChartResponseToJson(this);
}

@JsonSerializable()
class GetOperatorPriceChartResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<OperatorPriceChartResponse>? data;

  factory GetOperatorPriceChartResponse.fromJson(Map<String, dynamic> json) =>
      _$GetOperatorPriceChartResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetOperatorPriceChartResponseToJson(this);

  GetOperatorPriceChartResponse({this.data});
}

@JsonSerializable()
class PlanProfileMetaPlanResponse {
  @JsonKey(name: "planId")
  String? planId;
  @JsonKey(name: "planName")
  String? planName;
  @JsonKey(name: "planPrice")
  double? planPrice;

  PlanProfileMetaPlanResponse({this.planId, this.planName, this.planPrice});

  factory PlanProfileMetaPlanResponse.fromJson(Map<String, dynamic> json) =>
      _$PlanProfileMetaPlanResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlanProfileMetaPlanResponseToJson(this);
}

@JsonSerializable()
class PlanProfileMetaResponse {
  @JsonKey(name: "role")
  String? role;
  @JsonKey(name: "ownerUserName")
  String? ownerUserName;
  @JsonKey(name: "userName")
  String? userName;
  @JsonKey(name: "taxRate")
  double? taxRate;
  @JsonKey(name: "planList")
  List<PlanProfileMetaPlanResponse>? planList;
  @JsonKey(name: "planSpeedUnit")
  List<String>? planSpeedUnit;
  @JsonKey(name: "planDataLimitUnit")
  List<String>? planDataLimitUnit;
  @JsonKey(name: "planValidityUnit")
  List<String>? planValidityUnit;
  @JsonKey(name: "planType")
  List<String>? planType;
  @JsonKey(name: "resellerOperatorMap")
  Map<String, List<String>>? resellerOperatorMap;
  @JsonKey(name: "planScreens")
  List<MainPageModelResponseData>? planScreens;
  @JsonKey(name: "resellerPlanMap")
  Map<String, List<PlanProfileMetaPlanResponse>>? resellerPlanMap;

  PlanProfileMetaResponse(
      {this.role,
      this.ownerUserName,
      this.userName,
      this.planList,
      this.resellerOperatorMap,
      this.planScreens,
      this.resellerPlanMap});

  factory PlanProfileMetaResponse.fromJson(Map<String, dynamic> json) =>
      _$PlanProfileMetaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PlanProfileMetaResponseToJson(this);
}

@JsonSerializable()
class GetPlanProfileMetaResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<PlanProfileMetaResponse>? data;

  factory GetPlanProfileMetaResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPlanProfileMetaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPlanProfileMetaResponseToJson(this);

  GetPlanProfileMetaResponse({this.data});
}

@JsonSerializable()
class AddressResponse {
  @JsonKey(name: "addressId")
  String? addressId;
  @JsonKey(name: "streetAddress")
  String? streetAddress;
  @JsonKey(name: "addressType")
  String? addressType;
  @JsonKey(name: "city")
  String? city;
  @JsonKey(name: "state")
  String? state;
  @JsonKey(name: "country")
  String? country;
  @JsonKey(name: "postalcode")
  String? postalcode;
  @JsonKey(name: "updatedAt")
  String? updatedAt;

  AddressResponse(
      {this.addressId,
      this.streetAddress,
      this.addressType,
      this.city,
      this.state,
      this.country,
      this.postalcode,
      this.updatedAt});

  factory AddressResponse.fromJson(Map<String, dynamic> json) =>
      _$AddressResponseFromJson(json);

  Map<String, dynamic> toJson() => _$AddressResponseToJson(this);
}

@JsonSerializable()
class SubscriberResponse {
  @JsonKey(name: "userName")
  String? userName;
  @JsonKey(name: "customerId")
  String? customerId;
  @JsonKey(name: "firstName")
  String? firstName;
  @JsonKey(name: "lastName")
  String? lastName;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "mobileNumber")
  String? mobileNumber;
  @JsonKey(name: "operatorUserName")
  String? operatorUserName;
  @JsonKey(name: "resellerUserName")
  String? resellerUserName;
  @JsonKey(name: "permanentAddress")
  AddressResponse? permanentAddress;
  @JsonKey(name: "billingAddress")
  AddressResponse? billingAddress;
  @JsonKey(name: "companyName")
  String? companyName;
  @JsonKey(name: "brandName")
  String? brandName;
  @JsonKey(name: "gstNumber")
  String? gstNumber;
  @JsonKey(name: "createdAt")
  String? createdAt;
  @JsonKey(name: "updatedAt")
  String? updatedAt;

  SubscriberResponse(
      {this.userName,
      this.customerId,
      this.firstName,
      this.lastName,
      this.email,
      this.mobileNumber,
      this.operatorUserName,
      this.resellerUserName,
      this.permanentAddress,
      this.billingAddress,
      this.companyName,
      this.brandName,
      this.gstNumber,
      this.createdAt,
      this.updatedAt});

  factory SubscriberResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscriberResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriberResponseToJson(this);
}

@JsonSerializable()
class SubscriptionResponse {
  @JsonKey(name: "subscriptionId")
  String? subscriptionId;
  @JsonKey(name: "subscriberUserName")
  String? subscriberUserName;
  @JsonKey(name: "resellerUserName")
  String? resellerUserName;
  @JsonKey(name: "operatorUserName")
  String? operatorUserName;
  @JsonKey(name: "status")
  String? status;
  @JsonKey(name: "planName")
  String? planName;
  @JsonKey(name: "networkType")
  String? networkType;
  @JsonKey(name: "assignedIp")
  String? assignedIp;
  @JsonKey(name: "ipType")
  String? ipType;
  @JsonKey(name: "subscriptionDate")
  String? subscriptionDate;
  @JsonKey(name: "lastRenewalDate")
  String? lastRenewalDate;
  @JsonKey(name: "nextRenewalDate")
  String? nextRenewalDate;
  @JsonKey(name: "installationAddress")
  AddressResponse? installationAddress;
  @JsonKey(name: "permanentAddress")
  AddressResponse? permanentAddress;
  @JsonKey(name: "billingAddress")
  AddressResponse? billingAddress;
  @JsonKey(name: "basePrice")
  double? basePrice;
  @JsonKey(name: "offeredPrice")
  double? offeredPrice;

  SubscriptionResponse(
      {this.subscriptionId,
      this.subscriberUserName,
      this.resellerUserName,
      this.operatorUserName,
      this.status,
      this.planName,
      this.networkType,
      this.assignedIp,
      this.ipType,
      this.subscriptionDate,
      this.lastRenewalDate,
      this.nextRenewalDate,
      this.installationAddress,
      this.permanentAddress,
      this.billingAddress,
      this.basePrice,
      this.offeredPrice});

  factory SubscriptionResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionResponseToJson(this);
}

@JsonSerializable()
class SubscriberListBlockResponse {
  @JsonKey(name: "subscribers")
  List<SubscriberResponse>? subscribers;
  @JsonKey(name: "isSearch")
  bool? isSearch;
  @JsonKey(name: "screenTypeIdentity")
  String? screenTypeIdentity;

  SubscriberListBlockResponse(
      {this.subscribers, this.isSearch, this.screenTypeIdentity});

  factory SubscriberListBlockResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscriberListBlockResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriberListBlockResponseToJson(this);
}

@JsonSerializable()
class SubscriptionListBlockResponse {
  @JsonKey(name: "subscriptions")
  List<SubscriptionResponse>? subscriptions;
  @JsonKey(name: "isSearch")
  bool? isSearch;
  @JsonKey(name: "screenTypeIdentity")
  String? screenTypeIdentity;

  SubscriptionListBlockResponse(
      {this.subscriptions, this.isSearch, this.screenTypeIdentity});

  factory SubscriptionListBlockResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionListBlockResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionListBlockResponseToJson(this);
}

@JsonSerializable()
class GetSubscriberListBlockResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<SubscriberListBlockResponse>? data;

  GetSubscriberListBlockResponse({this.data});

  factory GetSubscriberListBlockResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSubscriberListBlockResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSubscriberListBlockResponseToJson(this);
}

@JsonSerializable()
class GetSubscriptionListBlockResponse extends BaseResponse {
  @JsonKey(name: "data")
  List<SubscriptionListBlockResponse>? data;

  GetSubscriptionListBlockResponse({this.data});

  factory GetSubscriptionListBlockResponse.fromJson(
          Map<String, dynamic> json) =>
      _$GetSubscriptionListBlockResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$GetSubscriptionListBlockResponseToJson(this);
}

@JsonSerializable()
class PayeeResponse {
  @JsonKey(name: "userName")
  String? userName;
  @JsonKey(name: "userId")
  String? userId;

  PayeeResponse({this.userName, this.userId});

  factory PayeeResponse.fromJson(Map<String, dynamic> json) =>
      _$PayeeResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PayeeResponseToJson(this);
}

@JsonSerializable()
class TransactionResponse {
  @JsonKey(name: 'transactionId')
  String? transactionId;
  @JsonKey(name: 'senderUsername')
  String? senderUsername;
  @JsonKey(name: 'receiverUsername')
  String? receiverUsername;
  @JsonKey(name: 'amount')
  double? amount;
  @JsonKey(name: 'transactionStatus')
  String? transactionStatus;
  @JsonKey(name: 'transactionType')
  String? transactionType;
  @JsonKey(name: 'transactionDate')
  String? transactionDate;

  TransactionResponse(
      {this.transactionId,
      this.senderUsername,
      this.receiverUsername,
      this.amount,
      this.transactionStatus,
      this.transactionType,
      this.transactionDate});

  factory TransactionResponse.fromJson(Map<String, dynamic> json) =>
      _$TransactionResponseFromJson(json);

  Map<String, dynamic> toJson() => _$TransactionResponseToJson(this);
}

@JsonSerializable()
class UserWalletResponse {
  @JsonKey(name: 'balance')
  double? balance;
  @JsonKey(name: 'transactions')
  List<TransactionResponse>? transactions;
  @JsonKey(name: 'payee')
  PayeeResponse? payee;

  UserWalletResponse({this.balance, this.transactions, this.payee});

  factory UserWalletResponse.fromJson(Map<String, dynamic> json) =>
      _$UserWalletResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UserWalletResponseToJson(this);
}

@JsonSerializable()
class GetUserWalletResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<UserWalletResponse>? data;

  GetUserWalletResponse({this.data});

  factory GetUserWalletResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUserWalletResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetUserWalletResponseToJson(this);
}

@JsonSerializable()
class SubscriberMapInfoResponse {
  @JsonKey(name: 'subscriberUserName')
  String? subscriberUserName;
  @JsonKey(name: 'customerId')
  String? customerId;
  @JsonKey(name: 'mobileNumber')
  String? mobileNumber;
  @JsonKey(name: 'email')
  String? email;

  SubscriberMapInfoResponse(
      {this.subscriberUserName,
      this.customerId,
      this.email,
      this.mobileNumber});

  factory SubscriberMapInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscriberMapInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriberMapInfoResponseToJson(this);
}

@JsonSerializable()
class SubscriptionMetaResponse {
  @JsonKey(name: "resellerOperatorMap")
  Map<String, List<String>>? resellerOperatorMap;
  @JsonKey(name: "operatorPlanMap")
  Map<String, List<PlanProfileMetaPlanResponse>>? operatorPlanMap;
  @JsonKey(name: "operatorSubscriberMap")
  Map<String, List<SubscriberMapInfoResponse>>? operatorSubscriberMap;
  @JsonKey(name: "networkType")
  List<String>? networkType;
  @JsonKey(name: "ipType")
  List<String>? ipType;
  @JsonKey(name: "availiableIps")
  List<String>? availiableIps;
  @JsonKey(name: "taxRate")
  double? taxRate;

  SubscriptionMetaResponse(
      {this.resellerOperatorMap,
      this.operatorSubscriberMap,
      this.operatorPlanMap,
      this.networkType,
      this.ipType,
      this.availiableIps,
      this.taxRate});

  factory SubscriptionMetaResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscriptionMetaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubscriptionMetaResponseToJson(this);
}

@JsonSerializable()
class GetSubscriptionMetaResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<SubscriptionMetaResponse>? data;

  GetSubscriptionMetaResponse({this.data});

  factory GetSubscriptionMetaResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSubscriptionMetaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSubscriptionMetaResponseToJson(this);
}
