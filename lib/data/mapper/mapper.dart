// to convert the response into a non nullable object (model)

import 'package:netify/app/extensions.dart';
import 'package:netify/data/responses/responses.dart';
import 'package:netify/domain/model/billing_model.dart';
import 'package:netify/domain/model/home_model.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/model/plan_model.dart';
import 'package:netify/domain/model/settings_model.dart';
import 'package:netify/domain/model/wallet_model.dart';
import 'package:intl/intl.dart';

const String defaultEmptyString = "";

extension LoginDataResponseExtension on LoginDataResponse? {
  LoginData toDomain() {
    return LoginData(
      token: this?.token?.nonNull ?? defaultEmptyString,
      isVerified: this?.isVerified?.nonNull ?? false,
      firstName: this?.firstName?.nonNull ?? defaultEmptyString,
      lastName: this?.lastName?.nonNull ?? defaultEmptyString,
      userName: this?.userName?.nonNull ?? defaultEmptyString,
      roleId: this?.roleId?.nonNull ?? -1,
    );
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

extension PanelButtonExtension on PanelButtonResponseData? {
  PanelButton toDomain() {
    return PanelButton(
      name: this?.name?.nonNull ?? defaultEmptyString,
      type: this?.type?.nonNull ?? defaultEmptyString,
      label: this?.label?.nonNull ?? defaultEmptyString,
      details: this?.details?.nonNull ?? defaultEmptyString,
      color: this?.color?.nonNull ?? defaultEmptyString,
      extractInfo: this?.extractInfo?.map((e) => e.toString()).toList() ?? [],
      disable: this?.disable?.map((key, value) =>
              MapEntry(key, value.map((e) => e.toString()).toList())) ??
          {},
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
      actionButtons:
          this?.actionButtons?.map((e) => e.toDomain()).toList() ?? [],
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
      planValidity: this?.planValidity?.nonNull ?? defaultEmptyString,
      downloadSpeed: this?.downloadSpeed?.nonNull ?? defaultEmptyString,
      uploadSpeed: this?.uploadSpeed?.nonNull ?? defaultEmptyString,
      dataLimit: this?.dataLimit?.nonNull ?? defaultEmptyString,
      planType: this?.planType?.nonNull ?? defaultEmptyString,
      dataLimitFUP: this?.dataLimitFUP?.nonNull ?? defaultEmptyString,
      downloadSpeedFUP: this?.downloadSpeedFUP?.nonNull ?? defaultEmptyString,
      uploadSpeedFUP: this?.uploadSpeedFUP?.nonNull ?? defaultEmptyString,
      basePrice: this?.basePrice ?? 0,
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
      taxRate: this?.taxRate ?? 0,
      planSpeedUnit:
          this?.planSpeedUnit?.map((e) => e.toString()).toList() ?? [],
      planDataLimitUnit:
          this?.planDataLimitUnit?.map((e) => e.toString()).toList() ?? [],
      planValidityUnit:
          this?.planValidityUnit?.map((e) => e.toString()).toList() ?? [],
      planType: this?.planType?.map((e) => e.toString()).toList() ?? [],
      planList: this?.planList?.map((e) => e.toDomain()).toList() ?? [],
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

extension AddressResponseExtension on AddressResponse? {
  Address toDomain() {
    return Address(
      addressId: this?.addressId?.nonNull ?? defaultEmptyString,
      streetAddress: this?.streetAddress?.nonNull ?? defaultEmptyString,
      addressType: this?.addressType?.nonNull ?? defaultEmptyString,
      city: this?.city?.nonNull ?? defaultEmptyString,
      state: this?.state?.nonNull ?? defaultEmptyString,
      country: this?.country?.nonNull ?? defaultEmptyString,
      postalcode: this?.postalcode?.nonNull ?? defaultEmptyString,
      updatedAt: DateTime.parse(this?.updatedAt?.nonNull ?? defaultEmptyString),
    );
  }
}

extension SubscriberResponseExtension on SubscriberResponse? {
  Subscriber toDomain() {
    return Subscriber(
        userName: this?.userName?.nonNull ?? defaultEmptyString,
        customerId: this?.customerId?.nonNull ?? defaultEmptyString,
        firstName: this?.firstName?.nonNull ?? defaultEmptyString,
        lastName: this?.lastName?.nonNull ?? defaultEmptyString,
        email: this?.email?.nonNull ?? defaultEmptyString,
        operatorUserName: this?.operatorUserName?.nonNull ?? defaultEmptyString,
        resellerUserName: this?.resellerUserName?.nonNull ?? defaultEmptyString,
        mobileNumber: this?.mobileNumber?.nonNull ?? defaultEmptyString,
        permanentAddress: this?.permanentAddress?.toDomain() ??
            Address(
                addressId: defaultEmptyString,
                streetAddress: defaultEmptyString,
                addressType: defaultEmptyString,
                city: defaultEmptyString,
                state: defaultEmptyString,
                country: defaultEmptyString,
                postalcode: defaultEmptyString,
                updatedAt: DateTime.now()),
        billingAddress: this?.billingAddress?.toDomain() ??
            Address(
                addressId: defaultEmptyString,
                streetAddress: defaultEmptyString,
                addressType: defaultEmptyString,
                city: defaultEmptyString,
                state: defaultEmptyString,
                country: defaultEmptyString,
                postalcode: defaultEmptyString,
                updatedAt: DateTime.now()),
        companyName: this?.companyName?.nonNull ?? defaultEmptyString,
        brandName: this?.brandName?.nonNull ?? defaultEmptyString,
        gstNumber: this?.gstNumber?.nonNull ?? defaultEmptyString,
        createdAt:
            DateTime.parse(this?.createdAt?.nonNull ?? defaultEmptyString),
        updatedAt:
            DateTime.parse(this?.updatedAt?.nonNull ?? defaultEmptyString));
  }
}

extension SubscriptionResponseExtension on SubscriptionResponse? {
  Subscription toDomain() {
    //DateFormat dateFormat = DateFormat("yyyy-MM-dd'T'HH:mm:ss.SSS'Z'");
    DateFormat dateFormat = DateFormat("dd-MM-yyyy");
    return Subscription(
      subscriptionId: this?.subscriptionId?.nonNull ?? defaultEmptyString,
      subscriberUserName:
          this?.subscriberUserName?.nonNull ?? defaultEmptyString,
      resellerUserName: this?.resellerUserName?.nonNull ?? defaultEmptyString,
      operatorUserName: this?.operatorUserName?.nonNull ?? defaultEmptyString,
      status: this?.status?.nonNull ?? defaultEmptyString,
      planName: this?.planName?.nonNull ?? defaultEmptyString,
      networkType: this?.networkType?.nonNull ?? defaultEmptyString,
      assignedIp: this?.assignedIp?.nonNull ?? defaultEmptyString,
      ipType: this?.ipType?.nonNull ?? defaultEmptyString,
      basePrice: this?.basePrice ?? 0,
      offeredPrice: this?.offeredPrice ?? 0,
      securityDeposit: this?.securityDeposit ?? 0,
      installationCharge: this?.installationCharge ?? 0,
      subscriptionDate:
          DateTime.parse(this?.subscriptionDate?.nonNull ?? defaultEmptyString),
      lastRenewalDate:
          dateFormat.parse(this?.lastRenewalDate?.nonNull ?? "01-01-0001"),
      nextRenewalDate:
          dateFormat.parse(this?.nextRenewalDate?.nonNull ?? "01-01-0001"),
      installationAddress: this?.installationAddress?.toDomain() ??
          Address(
              addressId: defaultEmptyString,
              streetAddress: defaultEmptyString,
              addressType: defaultEmptyString,
              city: defaultEmptyString,
              state: defaultEmptyString,
              country: defaultEmptyString,
              postalcode: defaultEmptyString,
              updatedAt: DateTime.now()),
      permanentAddress: this?.permanentAddress?.toDomain() ??
          Address(
              addressId: defaultEmptyString,
              streetAddress: defaultEmptyString,
              addressType: defaultEmptyString,
              city: defaultEmptyString,
              state: defaultEmptyString,
              country: defaultEmptyString,
              postalcode: defaultEmptyString,
              updatedAt: DateTime.now()),
      billingAddress: this?.billingAddress?.toDomain() ??
          Address(
              addressId: defaultEmptyString,
              streetAddress: defaultEmptyString,
              addressType: defaultEmptyString,
              city: defaultEmptyString,
              state: defaultEmptyString,
              country: defaultEmptyString,
              postalcode: defaultEmptyString,
              updatedAt: DateTime.now()),
    );
  }
}

extension SubscriberListBlockResponseExtension on SubscriberListBlockResponse? {
  SubscriberListBlock toDomain() {
    return SubscriberListBlock(
      subscribers: this?.subscribers?.map((e) => e.toDomain()).toList() ?? [],
      isSearch: this?.isSearch ?? false,
      screenTypeIdentity: this?.screenTypeIdentity ?? defaultEmptyString,
    );
  }
}

extension SubscriptionListBlockResponseExtension
    on SubscriptionListBlockResponse? {
  SubscriptionListBlock toDomain() {
    return SubscriptionListBlock(
      subscriptions:
          this?.subscriptions?.map((e) => e.toDomain()).toList() ?? [],
      isSearch: this?.isSearch ?? false,
      screenTypeIdentity: this?.screenTypeIdentity ?? defaultEmptyString,
    );
  }
}

extension GetSubscriberListBlockResponseExtension
    on GetSubscriberListBlockResponse? {
  GetSubscriberListBlock toDomain() {
    return GetSubscriberListBlock(
        status: this?.status?.nonNull ?? defaultEmptyString,
        message: this?.message?.nonNull ?? defaultEmptyString,
        errorCode: this?.errorCode?.nonNull ?? defaultEmptyString,
        data: this?.data?.map((e) => e.toDomain()).toList() ?? []);
  }
}

extension GetSubscriptionListBlockResponseExtension
    on GetSubscriptionListBlockResponse? {
  GetSubscriptionListBlock toDomain() {
    return GetSubscriptionListBlock(
        status: this?.status?.nonNull ?? defaultEmptyString,
        message: this?.message?.nonNull ?? defaultEmptyString,
        errorCode: this?.errorCode?.nonNull ?? defaultEmptyString,
        data: this?.data?.map((e) => e.toDomain()).toList() ?? []);
  }
}

extension PayeeResponseExtension on PayeeResponse? {
  Payee toDomain() {
    return Payee(
      userName: this?.userName?.nonNull ?? defaultEmptyString,
      userId: this?.userId?.nonNull ?? defaultEmptyString,
    );
  }
}

extension TransactionResponseExtension on TransactionResponse? {
  Transaction toDomain() {
    return Transaction(
      transactionId: this?.transactionId?.nonNull ?? defaultEmptyString,
      senderUsername: this?.senderUsername?.nonNull ?? defaultEmptyString,
      receiverUsername: this?.receiverUsername?.nonNull ?? defaultEmptyString,
      amount: this?.amount ?? 0,
      transactionStatus: this?.transactionStatus?.nonNull ?? defaultEmptyString,
      transactionType: this?.transactionType?.nonNull ?? defaultEmptyString,
      transactionDate:
          DateTime.parse(this?.transactionDate?.nonNull ?? defaultEmptyString),
    );
  }
}

extension UserWalletResponseExtension on UserWalletResponse? {
  UserWallet toDomain() {
    return UserWallet(
        balance: this?.balance ?? 0,
        transactions:
            this?.transactions?.map((e) => e.toDomain()).toList() ?? [],
        payee: this?.payee?.map((e) => e.toDomain()).toList() ?? []);
  }
}

extension GetUserWalletResponseExtension on GetUserWalletResponse? {
  GetUserWallet toDomain() {
    return GetUserWallet(
        status: this?.status?.nonNull ?? defaultEmptyString,
        message: this?.message?.nonNull ?? defaultEmptyString,
        errorCode: this?.errorCode?.nonNull ?? defaultEmptyString,
        data: this?.data?.map((e) => e.toDomain()).toList() ?? []);
  }
}

extension SubscriberMapInfoResponseExtension on SubscriberMapInfoResponse? {
  SubscriberMapInfo toDomain() {
    return SubscriberMapInfo(
      subscriberUserName:
          this?.subscriberUserName?.nonNull ?? defaultEmptyString,
      customerId: this?.customerId?.nonNull ?? defaultEmptyString,
      mobileNumber: this?.mobileNumber?.nonNull ?? defaultEmptyString,
      email: this?.email?.nonNull ?? defaultEmptyString,
    );
  }
}

extension SubscriptionMetaResponseExtension on SubscriptionMetaResponse? {
  SubscriptionMeta toDomain() {
    return SubscriptionMeta(
      resellerOperatorMap: this?.resellerOperatorMap ?? {},
      operatorPlanMap: this?.operatorPlanMap?.map(((key, value) =>
              MapEntry(key, value.map((e) => e.toDomain()).toList()))) ??
          {},
      operatorSubscriberMap: this?.operatorSubscriberMap?.map(((key, value) =>
              MapEntry(key, value.map((e) => e.toDomain()).toList()))) ??
          {},
      networkType: this?.networkType?.map((e) => e.toString()).toList() ?? [],
      availiableIps:
          this?.availiableIps?.map((e) => e.toString()).toList() ?? [],
      ipType: this?.ipType?.map((e) => e.toString()).toList() ?? [],
      taxRate: this?.taxRate ?? 0,
    );
  }
}

extension GetSubscriptionMetaResponseExtension on GetSubscriptionMetaResponse? {
  GetSubscriptionMeta toDomain() {
    return GetSubscriptionMeta(
      data: this?.data?.map((e) => e.toDomain()).toList() ?? [],
      status: this?.status?.nonNull ?? defaultEmptyString,
      message: this?.message?.nonNull ?? defaultEmptyString,
      errorCode: this?.errorCode?.nonNull ?? defaultEmptyString,
    );
  }
}

extension SettingsProfileMetaResponseExtension on SettingsProfileMetaResponse? {
  SettingsProfileMeta toDomain() {
    return SettingsProfileMeta(
      role: this?.role?.nonNull ?? defaultEmptyString,
      ownerUserName: this?.ownerUserName?.nonNull ?? defaultEmptyString,
      userName: this?.userName?.nonNull ?? defaultEmptyString,
      settingScreens:
          this?.settingScreens?.map((e) => e.toDomain()).toList() ?? [],
      tenantId: this?.tenantId?.nonNull ?? defaultEmptyString,
      supportedNasType:
          this?.supportedNasType?.map((e) => e.toString()).toList() ?? [],
    );
  }
}

extension GetSettingsProfileMetaResponseExtension
    on GetSettingsProfileMetaResponse? {
  GetSettingsProfileMeta toDomain() {
    return GetSettingsProfileMeta(
      data: this?.data?.map((e) => e.toDomain()).toList() ?? [],
      status: this?.status?.nonNull ?? defaultEmptyString,
      message: this?.message?.nonNull ?? defaultEmptyString,
      errorCode: this?.errorCode?.nonNull ?? defaultEmptyString,
    );
  }
}

extension PaymentProfileMetaResponseExtension on PaymentProfileMetaResponse? {
  PaymentProfileMeta toDomain() {
    return PaymentProfileMeta(
      role: this?.role?.nonNull ?? defaultEmptyString,
      ownerUserName: this?.ownerUserName?.nonNull ?? defaultEmptyString,
      userName: this?.userName?.nonNull ?? defaultEmptyString,
      paymentScreens:
          this?.paymentScreens?.map((e) => e.toDomain()).toList() ?? [],
    );
  }
}

extension GetPaymentProfileMetaResponseExtension
    on GetPaymentProfileMetaResponse? {
  GetPaymentProfileMeta toDomain() {
    return GetPaymentProfileMeta(
      data: this?.data?.map((e) => e.toDomain()).toList() ?? [],
      status: this?.status?.nonNull ?? defaultEmptyString,
      message: this?.message?.nonNull ?? defaultEmptyString,
      errorCode: this?.errorCode?.nonNull ?? defaultEmptyString,
    );
  }
}

extension ServiceResponseExtension on ServiceResponse? {
  Service toDomain() {
    return Service(
      serviceId: this?.serviceId?.nonNull ?? defaultEmptyString,
      serviceName: this?.serviceName?.nonNull ?? defaultEmptyString,
      serviceDescription:
          this?.serviceDescription?.nonNull ?? defaultEmptyString,
      serviceCost: this?.serviceCost ?? 0,
    );
  }
}

extension SubscribedServiceResponseExtension on SubscribedServiceResponse? {
  SubscribedService toDomain() {
    return SubscribedService(
      tenantId: this?.tenantId?.nonNull ?? defaultEmptyString,
      subscriptionId: this?.subscriptionId?.nonNull ?? defaultEmptyString,
      serviceId: this?.serviceId?.nonNull ?? defaultEmptyString,
      startDate: DateTime.parse(this?.startDate?.nonNull ?? defaultEmptyString),
      endDate: DateTime.parse(this?.endDate?.nonNull ?? defaultEmptyString),
      subscriptionData: this?.subscriptionData ?? {},
      status: this?.status?.nonNull ?? defaultEmptyString,
    );
  }
}

extension ServiceInfoResponseExtension on ServiceInfoResponse? {
  ServicesInfo toDomain() {
    return ServicesInfo(
        services: this?.services?.map(((e) => e.toDomain())).toList() ?? [],
        subscribedServices:
            this?.subscribedServices?.map(((e) => e.toDomain())).toList() ??
                []);
  }
}

extension GetServicesInfoResponseExtension on GetServicesInfoResponse? {
  GetServicesInfo toDomain() {
    return GetServicesInfo(
      data: this?.data?.map((e) => e.toDomain()).toList() ?? [],
      status: this?.status?.nonNull ?? defaultEmptyString,
      message: this?.message?.nonNull ?? defaultEmptyString,
      errorCode: this?.errorCode?.nonNull ?? defaultEmptyString,
    );
  }
}

extension NasResponseExtension on NasResponse? {
  Nas toDomain() {
    return Nas(
      id: this?.id?.nonNull ?? defaultEmptyString,
      nasname: this?.nasname?.nonNull ?? defaultEmptyString,
      shortname: this?.shortname?.nonNull ?? defaultEmptyString,
      secret: this?.secret?.nonNull ?? defaultEmptyString,
      type: this?.type?.nonNull ?? defaultEmptyString,
      ports: this?.ports ?? 0,
      description: this?.description?.nonNull ?? defaultEmptyString,
      community: this?.community?.nonNull ?? defaultEmptyString,
      server: this?.community?.nonNull ?? defaultEmptyString,
    );
  }
}

extension GetNasListResponseExtension on GetNasListResponse? {
  GetNasList toDomain() {
    return GetNasList(
      data: this?.data?.map((e) => e.toDomain()).toList() ?? [],
      status: this?.status?.nonNull ?? defaultEmptyString,
      message: this?.message?.nonNull ?? defaultEmptyString,
      errorCode: this?.errorCode?.nonNull ?? defaultEmptyString,
    );
  }
}

extension OperatorSubscriberMapResponseExtension
    on OperatorSubscriberMapResponse? {
  OperatorSubscriberMap toDomain() {
    return OperatorSubscriberMap(
      subscriberUserName:
          this?.subscriberUserName?.nonNull ?? defaultEmptyString,
      customerId: this?.customerId?.nonNull ?? defaultEmptyString,
      mobileNumber: this?.mobileNumber?.nonNull ?? defaultEmptyString,
      email: this?.email?.nonNull ?? defaultEmptyString,
    );
  }
}

extension SubscriptionSubscriberMapResponseExtension
    on SubscriptionSubscriberMapResponse? {
  SubscriptionSubscriberMap toDomain() {
    return SubscriptionSubscriberMap(
      planName: this?.planName?.nonNull ?? defaultEmptyString,
      networkType: this?.networkType?.nonNull ?? defaultEmptyString,
      ipType: this?.ipType?.nonNull ?? defaultEmptyString,
      lastRenewalDate: this?.lastRenewalDate?.nonNull ?? defaultEmptyString,
      subscriptionStatus:
          this?.subscriptionStatus?.nonNull ?? defaultEmptyString,
      subscriptionId: this?.subscriptionId?.nonNull ?? defaultEmptyString,
      operatorUserName: this?.operatorUserName?.nonNull ?? defaultEmptyString,
      offeredPrice: this?.offeredPrice ?? 0,
    );
  }
}

extension BillingProfileMetaResponseExtension on BillingProfileMetaResponse? {
  BillingProfileMeta toDomain() {
    return BillingProfileMeta(
      role: this?.role?.nonNull ?? defaultEmptyString,
      ownerUserName: this?.ownerUserName?.nonNull ?? defaultEmptyString,
      userName: this?.userName?.nonNull ?? defaultEmptyString,
      billingScreens:
          this?.billingScreens?.map((e) => e.toDomain()).toList() ?? [],
      resellerOperatorMap: this?.resellerOperatorMap ?? {},
      operatorSubscriberMap: this?.operatorSubscriberMap?.map(((key, value) =>
              MapEntry(key, value.map((e) => e.toDomain()).toList()))) ??
          {},
      subscriberSubscriptionMap: this?.subscriptionSubscriberMap?.map(
              ((key, value) =>
                  MapEntry(key, value.map((e) => e.toDomain()).toList()))) ??
          {},
    );
  }
}

extension GetBillingProfileMetaResponseExtension
    on GetBillingProfileMetaResponse? {
  GetBillingProfileMeta toDomain() {
    return GetBillingProfileMeta(
      data: this?.data?.map((e) => e.toDomain()).toList() ?? [],
      status: this?.status?.nonNull ?? defaultEmptyString,
      message: this?.message?.nonNull ?? defaultEmptyString,
      errorCode: this?.errorCode?.nonNull ?? defaultEmptyString,
    );
  }
}

extension UpcomingRenewalsResponseExtension on UpcomingRenewalsResponse? {
  UpcomingRenewals toDomain() {
    return UpcomingRenewals(
      subscriptionId: this?.subscriptionId?.nonNull ?? defaultEmptyString,
      resellerUserName: this?.resellerUserName?.nonNull ?? defaultEmptyString,
      operatorUserName: this?.operatorUserName?.nonNull ?? defaultEmptyString,
      planName: this?.planName?.nonNull ?? defaultEmptyString,
      networkType: this?.networkType?.nonNull ?? defaultEmptyString,
      ipType: this?.ipType?.nonNull ?? defaultEmptyString,
      lastRenewalDate: this?.lastRenewalDate?.nonNull ?? defaultEmptyString,
      nextRenewalDate: this?.nextRenewalDate?.nonNull ?? defaultEmptyString,
      offeredPrice: this?.offeredPrice ?? 0,
      subscriptionStatus:
          this?.subscriptionStatus?.nonNull ?? defaultEmptyString,
      customerId: this?.customerId?.nonNull ?? defaultEmptyString,
      subscriberUserName:
          this?.subscriberUserName?.nonNull ?? defaultEmptyString,
      subscriberName: this?.subscriberName?.nonNull ?? defaultEmptyString,
      subscriberEmail: this?.subscriberEmail?.nonNull ?? defaultEmptyString,
    );
  }
}

extension GetUpcomingRenewalsResponseExtension on GetUpcomingRenewalsResponse? {
  GetUpcomingRenewals toDomain() {
    return GetUpcomingRenewals(
      data: this?.data?.map((e) => e.toDomain()).toList() ?? [],
      status: this?.status?.nonNull ?? defaultEmptyString,
      message: this?.message?.nonNull ?? defaultEmptyString,
      errorCode: this?.errorCode?.nonNull ?? defaultEmptyString,
    );
  }
}

extension BillsResponseExtension on BillsResponse? {
  Bills toDomain() {
    return Bills(
      subscriberName: this?.subscriberName?.nonNull ?? defaultEmptyString,
      subscriberUserName:
          this?.subscriberUserName?.nonNull ?? defaultEmptyString,
      customerId: this?.customerId?.nonNull ?? defaultEmptyString,
      operatorName: this?.operatorName?.nonNull ?? defaultEmptyString,
      operatorUserName: this?.operatorUserName?.nonNull ?? defaultEmptyString,
      operatorId: this?.operatorId?.nonNull ?? defaultEmptyString,
      resellerName: this?.resellerName?.nonNull ?? defaultEmptyString,
      resellerUserName: this?.resellerUserName?.nonNull ?? defaultEmptyString,
      resellerId: this?.resellerId?.nonNull ?? defaultEmptyString,
      planName: this?.planName?.nonNull ?? defaultEmptyString,
      billNumber: this?.billNumber?.nonNull ?? defaultEmptyString,
      billPeriod: this?.billPeriod?.nonNull ?? defaultEmptyString,
      dueDate: this?.dueDate?.nonNull ?? defaultEmptyString,
      billAmount: this?.billAmount ?? 0,
      nextBillingDate: this?.nextBillingDate?.nonNull ?? defaultEmptyString,
      status: this?.status?.nonNull ?? defaultEmptyString,
      createdAt: DateTime.parse(this?.createdAt?.nonNull ?? defaultEmptyString),
      updatedAt: DateTime.parse(this?.updatedAt?.nonNull ?? defaultEmptyString),
    );
  }
}

extension BillsDataResponseExtension on BillsDataResponse? {
  BillsData toDomain() {
    return BillsData(
      bills: this?.bills?.map((e) => e.toDomain()).toList() ?? [],
      isSearch: this?.isSearch ?? false,
      screenTypeIdentity: this?.screenTypeIdentity ?? defaultEmptyString,
    );
  }
}

extension GetBillsResponseExtension on GetBillsResponse? {
  GetBills toDomain() {
    return GetBills(
      data: this?.data?.map((e) => e.toDomain()).toList() ?? [],
      status: this?.status?.nonNull ?? defaultEmptyString,
      message: this?.message?.nonNull ?? defaultEmptyString,
      errorCode: this?.errorCode?.nonNull ?? defaultEmptyString,
    );
  }
}
