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
  @JsonKey(name: "roleId")
  int? roleId;
  factory LoginDataResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$LoginDataResponseToJson(this);

  LoginDataResponse(
      {this.token,
      this.isVerified,
      this.firstName,
      this.lastName,
      this.userName,
      this.roleId});
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
  @JsonKey(name: "basePrice")
  double? basePrice;
  @JsonKey(name: "planType")
  String? planType;
  @JsonKey(name: "downloadSpeed")
  String? downloadSpeed;
  @JsonKey(name: "uploadSpeed")
  String? uploadSpeed;
  @JsonKey(name: "dataLimit")
  String? dataLimit;
  @JsonKey(name: "dataLimitFUP")
  String? dataLimitFUP;
  @JsonKey(name: "downloadSpeedFUP")
  String? downloadSpeedFUP;
  @JsonKey(name: "uploadSpeedFUP")
  String? uploadSpeedFUP;
  @JsonKey(name: "planValidity")
  String? planValidity;

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
    this.basePrice,
    this.planType,
    this.downloadSpeed,
    this.uploadSpeed,
    this.dataLimit,
    this.dataLimitFUP,
    this.downloadSpeedFUP,
    this.uploadSpeedFUP,
    this.planValidity,
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
  @JsonKey(name: "securityDeposit")
  double? securityDeposit;
  @JsonKey(name: "installationCharge")
  double? installationCharge;

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
      this.offeredPrice,
      this.securityDeposit,
      this.installationCharge});

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
  List<PayeeResponse>? payee;

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

@JsonSerializable()
class SettingsProfileMetaResponse {
  @JsonKey(name: 'role')
  String? role;
  @JsonKey(name: 'ownerUserName')
  String? ownerUserName;
  @JsonKey(name: 'userName')
  String? userName;
  @JsonKey(name: 'settingScreens')
  List<MainPageModelResponseData>? settingScreens;
  @JsonKey(name: 'tenantId')
  String? tenantId;
  @JsonKey(name: 'supportedNasType')
  List<String>? supportedNasType;

  SettingsProfileMetaResponse(
      {this.role,
      this.ownerUserName,
      this.userName,
      this.settingScreens,
      this.tenantId,
      this.supportedNasType});

  factory SettingsProfileMetaResponse.fromJson(Map<String, dynamic> json) =>
      _$SettingsProfileMetaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SettingsProfileMetaResponseToJson(this);
}

@JsonSerializable()
class GetSettingsProfileMetaResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<SettingsProfileMetaResponse>? data;

  GetSettingsProfileMetaResponse({this.data});

  factory GetSettingsProfileMetaResponse.fromJson(Map<String, dynamic> json) =>
      _$GetSettingsProfileMetaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetSettingsProfileMetaResponseToJson(this);
}

@JsonSerializable()
class PaymentProfileMetaResponse {
  @JsonKey(name: 'role')
  String? role;
  @JsonKey(name: 'ownerUserName')
  String? ownerUserName;
  @JsonKey(name: 'userName')
  String? userName;
  @JsonKey(name: 'paymentScreens')
  List<MainPageModelResponseData>? paymentScreens;

  PaymentProfileMetaResponse(
      {this.role, this.ownerUserName, this.userName, this.paymentScreens});

  factory PaymentProfileMetaResponse.fromJson(Map<String, dynamic> json) =>
      _$PaymentProfileMetaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$PaymentProfileMetaResponseToJson(this);
}

@JsonSerializable()
class GetPaymentProfileMetaResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<PaymentProfileMetaResponse>? data;

  GetPaymentProfileMetaResponse({this.data});

  factory GetPaymentProfileMetaResponse.fromJson(Map<String, dynamic> json) =>
      _$GetPaymentProfileMetaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetPaymentProfileMetaResponseToJson(this);
}

@JsonSerializable()
class ServiceResponse {
  @JsonKey(name: 'serviceId')
  String? serviceId;
  @JsonKey(name: 'serviceName')
  String? serviceName;
  @JsonKey(name: 'serviceDescription')
  String? serviceDescription;
  @JsonKey(name: 'serviceType')
  double? serviceCost;

  ServiceResponse(
      {this.serviceId,
      this.serviceName,
      this.serviceDescription,
      this.serviceCost});

  factory ServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$ServiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceResponseToJson(this);
}

@JsonSerializable()
class SubscribedServiceResponse {
  @JsonKey(name: 'tenantId')
  String? tenantId;
  @JsonKey(name: 'subscriptionId')
  String? subscriptionId;
  @JsonKey(name: 'serviceId')
  String? serviceId;
  @JsonKey(name: 'startDate')
  String? startDate;
  @JsonKey(name: 'endDate')
  String? endDate;
  @JsonKey(name: 'subscriptionData')
  Map<String, dynamic>? subscriptionData;
  @JsonKey(name: 'status')
  String? status;

  SubscribedServiceResponse(
      {this.tenantId,
      this.subscriptionId,
      this.serviceId,
      this.startDate,
      this.endDate,
      this.subscriptionData,
      this.status});

  factory SubscribedServiceResponse.fromJson(Map<String, dynamic> json) =>
      _$SubscribedServiceResponseFromJson(json);

  Map<String, dynamic> toJson() => _$SubscribedServiceResponseToJson(this);
}

@JsonSerializable()
class NasResponse {
  @JsonKey(name: 'id')
  String? id;
  @JsonKey(name: 'nasname')
  String? nasname;
  @JsonKey(name: 'shortname')
  String? shortname;
  @JsonKey(name: 'secret')
  String? secret;
  @JsonKey(name: 'type')
  String? type;
  @JsonKey(name: 'ports')
  int? ports;
  @JsonKey(name: 'description')
  String? description;
  @JsonKey(name: 'community')
  String? community;
  @JsonKey(name: 'server')
  String? server;

  NasResponse(
      {this.id,
      this.nasname,
      this.shortname,
      this.secret,
      this.type,
      this.ports,
      this.description,
      this.community,
      this.server});

  factory NasResponse.fromJson(Map<String, dynamic> json) =>
      _$NasResponseFromJson(json);

  Map<String, dynamic> toJson() => _$NasResponseToJson(this);
}

@JsonSerializable()
class ServiceInfoResponse {
  @JsonKey(name: "services")
  List<ServiceResponse>? services;
  @JsonKey(name: "subscribedServices")
  List<SubscribedServiceResponse>? subscribedServices;

  ServiceInfoResponse({this.services, this.subscribedServices});

  factory ServiceInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$ServiceInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ServiceInfoResponseToJson(this);
}

@JsonSerializable()
class GetServicesInfoResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<ServiceInfoResponse>? data;

  GetServicesInfoResponse({this.data});

  factory GetServicesInfoResponse.fromJson(Map<String, dynamic> json) =>
      _$GetServicesInfoResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetServicesInfoResponseToJson(this);
}

@JsonSerializable()
class GetNasListResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<NasResponse>? data;

  GetNasListResponse({this.data});

  factory GetNasListResponse.fromJson(Map<String, dynamic> json) =>
      _$GetNasListResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetNasListResponseToJson(this);
}

@JsonSerializable()
class OperatorSubscriberMapResponse {
  @JsonKey(name: 'subscriberUserName')
  String? subscriberUserName;
  @JsonKey(name: 'customerId')
  String? customerId;
  @JsonKey(name: 'mobileNumber')
  String? mobileNumber;
  @JsonKey(name: 'email')
  String? email;

  OperatorSubscriberMapResponse(
      {this.subscriberUserName,
      this.customerId,
      this.email,
      this.mobileNumber});

  factory OperatorSubscriberMapResponse.fromJson(Map<String, dynamic> json) =>
      _$OperatorSubscriberMapResponseFromJson(json);

  Map<String, dynamic> toJson() => _$OperatorSubscriberMapResponseToJson(this);
}

@JsonSerializable()
class SubscriptionSubscriberMapResponse {
  @JsonKey(name: 'planName')
  String? planName;
  @JsonKey(name: 'operatorUserName')
  String? operatorUserName;
  @JsonKey(name: 'offeredPrice')
  double? offeredPrice;
  @JsonKey(name: 'subscriptionId')
  String? subscriptionId;
  @JsonKey(name: 'subscriptionStatus')
  String? subscriptionStatus;
  @JsonKey(name: 'networkType')
  String? networkType;
  @JsonKey(name: 'ipType')
  String? ipType;
  @JsonKey(name: 'lastRenewalDate')
  String? lastRenewalDate;

  SubscriptionSubscriberMapResponse(
      {this.planName,
      this.operatorUserName,
      this.offeredPrice,
      this.subscriptionId,
      this.subscriptionStatus,
      this.networkType,
      this.ipType,
      this.lastRenewalDate});

  factory SubscriptionSubscriberMapResponse.fromJson(
          Map<String, dynamic> json) =>
      _$SubscriptionSubscriberMapResponseFromJson(json);

  Map<String, dynamic> toJson() =>
      _$SubscriptionSubscriberMapResponseToJson(this);
}

@JsonSerializable()
class BillingProfileMetaResponse {
  @JsonKey(name: 'role')
  String? role;
  @JsonKey(name: 'ownerUserName')
  String? ownerUserName;
  @JsonKey(name: 'userName')
  String? userName;
  @JsonKey(name: 'billingScreens')
  List<MainPageModelResponseData>? billingScreens;

  @JsonKey(name: 'resellerOperatorMap')
  Map<String, List<String>>? resellerOperatorMap;

  @JsonKey(name: 'operatorSubscriberMap')
  Map<String, List<OperatorSubscriberMapResponse>>? operatorSubscriberMap;

  @JsonKey(name: 'subscriberSubscriptionMap')
  Map<String, List<SubscriptionSubscriberMapResponse>>?
      subscriptionSubscriberMap;

  BillingProfileMetaResponse(
      {this.role,
      this.ownerUserName,
      this.userName,
      this.billingScreens,
      this.resellerOperatorMap,
      this.operatorSubscriberMap,
      this.subscriptionSubscriberMap});

  factory BillingProfileMetaResponse.fromJson(Map<String, dynamic> json) =>
      _$BillingProfileMetaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BillingProfileMetaResponseToJson(this);
}

@JsonSerializable()
class GetBillingProfileMetaResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<BillingProfileMetaResponse>? data;

  GetBillingProfileMetaResponse({this.data});

  factory GetBillingProfileMetaResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBillingProfileMetaResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetBillingProfileMetaResponseToJson(this);
}

@JsonSerializable()
class BillsResponse {
  @JsonKey(name: 'subscriberName')
  String? subscriberName;
  @JsonKey(name: 'subscriberUserName')
  String? subscriberUserName;
  @JsonKey(name: 'customerId')
  String? customerId;
  @JsonKey(name: 'operatorName')
  String? operatorName;
  @JsonKey(name: 'operatorUserName')
  String? operatorUserName;
  @JsonKey(name: 'operatorId')
  String? operatorId;
  @JsonKey(name: 'resellerName')
  String? resellerName;
  @JsonKey(name: 'resellerUserName')
  String? resellerUserName;
  @JsonKey(name: 'resellerId')
  String? resellerId;
  @JsonKey(name: 'planName')
  String? planName;
  @JsonKey(name: 'billNumber')
  String? billNumber;
  @JsonKey(name: 'billPeriod')
  String? billPeriod;
  @JsonKey(name: 'dueDate')
  String? dueDate;
  @JsonKey(name: 'billAmount')
  double? billAmount;
  @JsonKey(name: 'nextBillingDate')
  String? nextBillingDate;
  @JsonKey(name: 'status')
  String? status;
  @JsonKey(name: 'createdAt')
  String? createdAt;
  @JsonKey(name: 'updatedAt')
  String? updatedAt;

  BillsResponse(
      {this.subscriberName,
      this.subscriberUserName,
      this.customerId,
      this.operatorName,
      this.operatorUserName,
      this.operatorId,
      this.resellerName,
      this.resellerUserName,
      this.resellerId,
      this.planName,
      this.billNumber,
      this.billPeriod,
      this.dueDate,
      this.billAmount,
      this.nextBillingDate,
      this.status,
      this.createdAt,
      this.updatedAt});

  factory BillsResponse.fromJson(Map<String, dynamic> json) =>
      _$BillsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BillsResponseToJson(this);
}

@JsonSerializable()
class BillsDataResponse {
  @JsonKey(name: 'bills')
  List<BillsResponse>? bills;
  @JsonKey(name: 'isSearch')
  bool? isSearch;
  @JsonKey(name: 'screenTypeIdentity')
  String? screenTypeIdentity;

  BillsDataResponse({this.bills, this.isSearch, this.screenTypeIdentity});

  factory BillsDataResponse.fromJson(Map<String, dynamic> json) =>
      _$BillsDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$BillsDataResponseToJson(this);
}

@JsonSerializable()
class GetBillsResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<BillsDataResponse>? data;

  GetBillsResponse({this.data});

  factory GetBillsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetBillsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetBillsResponseToJson(this);
}

@JsonSerializable()
class UpcomingRenewalsResponse {
  @JsonKey(name: 'planName')
  String? planName;
  @JsonKey(name: 'operatorUserName')
  String? operatorUserName;
  @JsonKey(name: 'offeredPrice')
  double? offeredPrice;
  @JsonKey(name: 'subscriptionId')
  String? subscriptionId;
  @JsonKey(name: 'subscriptionStatus')
  String? subscriptionStatus;
  @JsonKey(name: 'networkType')
  String? networkType;
  @JsonKey(name: 'ipType')
  String? ipType;
  @JsonKey(name: 'lastRenewalDate')
  String? lastRenewalDate;
  @JsonKey(name: 'nextRenewalDate')
  String? nextRenewalDate;
  @JsonKey(name: 'resellerUserName')
  String? resellerUserName;
  @JsonKey(name: 'customerId')
  String? customerId;
  @JsonKey(name: 'subscriberUserName')
  String? subscriberUserName;
  @JsonKey(name: 'subscriberName')
  String? subscriberName;
  @JsonKey(name: 'subscriberEmail')
  String? subscriberEmail;

  UpcomingRenewalsResponse(
      {this.planName,
      this.operatorUserName,
      this.offeredPrice,
      this.subscriptionId,
      this.subscriptionStatus,
      this.networkType,
      this.ipType,
      this.lastRenewalDate,
      this.nextRenewalDate,
      this.resellerUserName,
      this.customerId,
      this.subscriberUserName,
      this.subscriberName,
      this.subscriberEmail});

  factory UpcomingRenewalsResponse.fromJson(Map<String, dynamic> json) =>
      _$UpcomingRenewalsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpcomingRenewalsResponseToJson(this);
}

@JsonSerializable()
class GetUpcomingRenewalsResponse extends BaseResponse {
  @JsonKey(name: 'data')
  List<UpcomingRenewalsResponse>? data;

  GetUpcomingRenewalsResponse({this.data});

  factory GetUpcomingRenewalsResponse.fromJson(Map<String, dynamic> json) =>
      _$GetUpcomingRenewalsResponseFromJson(json);

  Map<String, dynamic> toJson() => _$GetUpcomingRenewalsResponseToJson(this);
}
