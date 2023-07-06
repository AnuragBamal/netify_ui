// to convert the response into a non nullable object (model)

import 'package:netify/app/extensions.dart';
import 'package:netify/data/responses/responses.dart';
import 'package:netify/domain/model/home_model.dart';
import 'package:netify/domain/model/model.dart';

const String defaultEmptyString = "";

extension LoginDataResponseExtension on LoginDataResponse? {
  LoginData toDomain() {
    return LoginData(
        token: this?.token?.nonNull ?? defaultEmptyString,
        isVerified: this?.isVerified?.nonNull ?? false,
        firstName: this?.firstName?.nonNull ?? defaultEmptyString,
        lastName: this?.lastName?.nonNull ?? defaultEmptyString,
        userName: this?.userName?.nonNull ?? defaultEmptyString);
  }
}

extension LoginResponseExtension on LoginResponse? {
  Login toDomain() {
    return Login(
        status: this?.status?.nonNull ?? defaultEmptyString,
        message: this?.message?.nonNull ?? defaultEmptyString,
        errorCode: this?.errorCode?.nonNull ?? defaultEmptyString,
        data: this?.data?.map((e) => e.toDomain()).toList() ?? []);
  }
}

extension SuccessMessageResponseExtension on SuccessMessageResponse? {
  SuccessMessage toDomain() {
    return SuccessMessage(
        message: this?.message?.nonNull ?? defaultEmptyString);
  }
}

extension GeneralSuccessResponseExtension on GeneralSuccessResponse? {
  GeneralSuccess toDomain() {
    return GeneralSuccess(
        status: this?.status?.nonNull ?? defaultEmptyString,
        message: this?.message?.nonNull ?? defaultEmptyString,
        errorCode: this?.errorCode?.nonNull ?? defaultEmptyString,
        data: this?.data?.map((e) => e.toDomain()).toList() ?? []);
  }
}

extension FilterExtension on FilterResponseData? {
  Filter toDomain() {
    return Filter(
      name: this?.name?.nonNull ?? defaultEmptyString,
      type: this!.type! == "text" ? FilterType.text : FilterType.dropdown,
      label: this?.label?.nonNull ?? defaultEmptyString,
      placeholder: this?.placeholder?.nonNull ?? defaultEmptyString,
      options: this?.options?.map((e) => e.toString()).toList() ?? [],
    );
  }
}

extension MainPageModelExtension on MainPageModelResponseData? {
  MainPageModel toDomain() {
    return MainPageModel(
      dataTypeIdentity: this?.dataTypeIdentity?.nonNull ?? defaultEmptyString,
      index: this?.index?.nonNull ?? 0,
      screenTypeIdentity:
          this?.screenTypeIdentity?.nonNull ?? defaultEmptyString,
      title: this?.title?.nonNull ?? defaultEmptyString,
      viewType: this?.viewType?.nonNull ?? defaultEmptyString,
      filter: this?.filter?.map((e) => e.toDomain()).toList() ?? [],
    );
  }
}

extension GetUserDataExtension on GetUserResponseData? {
  GetUserData toDomain() {
    return GetUserData(
      brandName: this?.brandName?.nonNull ?? defaultEmptyString,
      companyName: this?.companyName?.nonNull ?? defaultEmptyString,
      email: this?.email?.nonNull ?? defaultEmptyString,
      firstName: this?.firstName?.nonNull ?? defaultEmptyString,
      lastName: this?.lastName?.nonNull ?? defaultEmptyString,
      mobileNumber: this?.mobileNumber?.nonNull ?? defaultEmptyString,
      userName: this?.userName?.nonNull ?? defaultEmptyString,
      role: this?.role?.nonNull ?? defaultEmptyString,
      userId: this?.userId?.nonNull ?? defaultEmptyString,
      homeScreens: this?.homeScreens?.map((e) => e.toDomain()).toList() ?? [],
      walletId: this?.walletId?.nonNull ?? defaultEmptyString,
      ownerUserName: this?.ownerUserName?.nonNull ?? defaultEmptyString,
      resellerList: this?.resellerList?.map((e) => e.toString()).toList() ?? [],
      operatorList: this?.operatorList?.map((e) => e.toString()).toList() ?? [],
      resellerOperatorMap: this?.resellerOperatorMap ?? {},
    );
  }
}

extension GetUserResponseExtension on GetUserResponse? {
  GetUser toDomain() {
    return GetUser(
        status: this?.status?.nonNull ?? defaultEmptyString,
        message: this?.message?.nonNull ?? defaultEmptyString,
        errorCode: this?.errorCode?.nonNull ?? defaultEmptyString,
        data: this?.data?.map((e) => e.toDomain()).toList() ?? []);
  }
}

extension GetDashboardItemResponseExtension on GetDashboardItemResponse? {
  DashboardItem toDomain() {
    return DashboardItem(
        assetName: this?.assetName?.nonNull ?? defaultEmptyString,
        assetCount: this?.assetCount?.nonNull ?? 0,
        referenceScreenId: this?.referenceScreenId?.nonNull ?? 0,
        screenTypeIdentity:
            this?.screenTypeIdentity?.nonNull ?? defaultEmptyString,
        color: this?.color?.nonNull ?? "#000000");
  }
}

extension GetUserListItemResponseExtension on GetUserListItemResponse? {
  User toDomain() {
    return User(
      userId: this?.userId?.nonNull ?? defaultEmptyString,
      firstName: this?.firstName?.nonNull ?? defaultEmptyString,
      lastName: this?.lastName?.nonNull ?? defaultEmptyString,
      userName: this?.userName?.nonNull ?? defaultEmptyString,
      email: this?.email?.nonNull ?? defaultEmptyString,
      mobileNumber: this?.mobileNumber?.nonNull ?? defaultEmptyString,
      companyName: this?.companyName?.nonNull ?? defaultEmptyString,
      brandName: this?.brandName?.nonNull ?? defaultEmptyString,
      role: this?.role?.nonNull ?? defaultEmptyString,
      status: this?.status?.nonNull ?? defaultEmptyString,
      address: this?.address?.nonNull ?? defaultEmptyString,
      city: this?.city?.nonNull ?? defaultEmptyString,
      state: this?.state?.nonNull ?? defaultEmptyString,
      country: this?.country?.nonNull ?? defaultEmptyString,
      pincode: this?.pincode?.nonNull ?? defaultEmptyString,
      gstNumber: this?.gstNumber?.nonNull ?? defaultEmptyString,
    );
  }
}

extension GetUserListBlockResponseExtension on GetUserListBlockResponse? {
  UserListBlock toDomain() {
    return UserListBlock(
        users: this?.users?.map((e) => e.toDomain()).toList() ?? [],
        isSearch: this?.isSearch ?? false,
        screenTypeIdentity:
            this?.screenTypeIdentity?.nonNull ?? defaultEmptyString);
  }
}

extension GetUserListResponseExtension on GetUserListResponse? {
  GetUserList toDomain() {
    return GetUserList(
        status: this?.status?.nonNull ?? defaultEmptyString,
        message: this?.message?.nonNull ?? defaultEmptyString,
        errorCode: this?.errorCode?.nonNull ?? defaultEmptyString,
        data: this?.data?.map((e) => e.toDomain()).toList() ?? []);
  }
}

extension GetDashboardResponseExtension on GetDashboardResponse? {
  GetDashboardItemList toDomain() {
    return GetDashboardItemList(
        status: this?.status?.nonNull ?? defaultEmptyString,
        message: this?.message?.nonNull ?? defaultEmptyString,
        errorCode: this?.errorCode?.nonNull ?? defaultEmptyString,
        data: this?.data?.map((e) => e.toDomain()).toList() ?? []);
  }
}

extension ResellerMapResponseExtension on ResellerMapResponse? {
  ResellerOperatorMap toDomain() {
    return ResellerOperatorMap(
      userName: this?.userName?.nonNull ?? defaultEmptyString,
      garudaDomain: this?.garudaDomain?.nonNull ?? defaultEmptyString,
      resellerMap: this?.resellerMap ?? {},
    );
  }
}

extension GetResellerMapResponseExtension on GetResellerMapResponse? {
  GetResellerMap toDomain() {
    return GetResellerMap(
        status: this?.status?.nonNull ?? defaultEmptyString,
        message: this?.message?.nonNull ?? defaultEmptyString,
        errorCode: this?.errorCode?.nonNull ?? defaultEmptyString,
        data: this?.data?.map((e) => e.toDomain()).toList() ?? []);
  }
}

extension PlansResponseExtension on PlansResponse? {
  Plans toDomain() {
    return Plans(
      planId: this?.planId?.nonNull ?? defaultEmptyString,
      planName: this?.planName?.nonNull ?? defaultEmptyString,
      planDescription: this?.planDescription?.nonNull ?? defaultEmptyString,
      isPlanActive: this?.isPlanActive ?? false,
      planStartDate:
          DateTime.parse(this?.planStartDate?.nonNull ?? defaultEmptyString),
      planPrice: this?.planPrice ?? 0,
      planUpdatedDate:
          DateTime.parse(this?.planUpdatedDate?.nonNull ?? defaultEmptyString),
    );
  }
}

extension GetPlansResponseExtension on GetPlansResponse? {
  GetPlans toDomain() {
    return GetPlans(
        status: this?.status?.nonNull ?? defaultEmptyString,
        message: this?.message?.nonNull ?? defaultEmptyString,
        errorCode: this?.errorCode?.nonNull ?? defaultEmptyString,
        data: this?.data?.map((e) => e.toDomain()).toList() ?? []);
  }
}

extension ResellerPriceChartResponseExtension on ResellerPriceChartResponse? {
  ResellerPriceChart toDomain() {
    return ResellerPriceChart(
      id: this?.id ?? 0,
      resellerId: this?.resellerId?.nonNull ?? defaultEmptyString,
      resellerUserName: this?.resellerUserName?.nonNull ?? defaultEmptyString,
      planId: this?.planId?.nonNull ?? defaultEmptyString,
      planName: this?.planName?.nonNull ?? defaultEmptyString,
      price: this?.price ?? 0,
      createdAt: DateTime.parse(this?.createdAt?.nonNull ?? defaultEmptyString),
      updatedAt: DateTime.parse(this?.updatedAt?.nonNull ?? defaultEmptyString),
    );
  }
}

extension GetResellerPriceChartResponseExtension
    on GetResellerPriceChartResponse? {
  GetResellerPriceChart toDomain() {
    return GetResellerPriceChart(
        status: this?.status?.nonNull ?? defaultEmptyString,
        message: this?.message?.nonNull ?? defaultEmptyString,
        errorCode: this?.errorCode?.nonNull ?? defaultEmptyString,
        data: this?.data?.map((e) => e.toDomain()).toList() ?? []);
  }
}

extension OperatorPriceChartResponseExtension on OperatorPriceChartResponse? {
  OperatorPriceChart toDomain() {
    return OperatorPriceChart(
      id: this?.id ?? 0,
      resellerId: this?.resellerId?.nonNull ?? defaultEmptyString,
      resellerUserName: this?.resellerUserName?.nonNull ?? defaultEmptyString,
      operatorId: this?.operatorId?.nonNull ?? defaultEmptyString,
      operatorUserName: this?.operatorUserName?.nonNull ?? defaultEmptyString,
      planId: this?.planId?.nonNull ?? defaultEmptyString,
      planName: this?.planName?.nonNull ?? defaultEmptyString,
      planPrice: this?.planPrice ?? 0,
      createdAt: DateTime.parse(this?.createdAt?.nonNull ?? defaultEmptyString),
      updatedAt: DateTime.parse(this?.updatedAt?.nonNull ?? defaultEmptyString),
    );
  }
}

extension GetOperatorPriceChartResponseExtension
    on GetOperatorPriceChartResponse? {
  GetOperatorPriceChart toDomain() {
    return GetOperatorPriceChart(
        status: this?.status?.nonNull ?? defaultEmptyString,
        message: this?.message?.nonNull ?? defaultEmptyString,
        errorCode: this?.errorCode?.nonNull ?? defaultEmptyString,
        data: this?.data?.map((e) => e.toDomain()).toList() ?? []);
  }
}

extension PlanProfileMetaPlanResponseExtension on PlanProfileMetaPlanResponse? {
  PlanProfileMetaPlan toDomain() {
    return PlanProfileMetaPlan(
      planId: this?.planId?.nonNull ?? defaultEmptyString,
      planName: this?.planName?.nonNull ?? defaultEmptyString,
      planPrice: this?.planPrice ?? 0,
    );
  }
}

extension PlanProfileMetaResponseExtension on PlanProfileMetaResponse? {
  PlanProfileMeta toDomain() {
    return PlanProfileMeta(
      role: this?.role?.nonNull ?? defaultEmptyString,
      ownerUserName: this?.ownerUserName?.nonNull ?? defaultEmptyString,
      userName: this?.userName?.nonNull ?? defaultEmptyString,
      planList: this?.planList?.map((e) => e.toString()).toList() ?? [],
      resellerMap: this?.resellerOperatorMap ?? {},
      planScreens: this?.planScreens?.map((e) => e.toDomain()).toList() ?? [],
      resellerPlanMap: this?.resellerPlanMap?.map(((key, value) =>
              MapEntry(key, value.map((e) => e.toDomain()).toList()))) ??
          {},
    );
  }
}

extension GetPlanProfileMetaResponseExtension on GetPlanProfileMetaResponse? {
  GetPlanProfileMeta toDomain() {
    return GetPlanProfileMeta(
        status: this?.status?.nonNull ?? defaultEmptyString,
        message: this?.message?.nonNull ?? defaultEmptyString,
        errorCode: this?.errorCode?.nonNull ?? defaultEmptyString,
        data: this?.data?.map((e) => e.toDomain()).toList() ?? []);
  }
}
