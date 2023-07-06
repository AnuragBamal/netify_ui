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
  @JsonKey(name: "planList")
  List<String>? planList;
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
