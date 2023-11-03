import 'package:freezed_annotation/freezed_annotation.dart';
part 'freezed_data_classes.freezed.dart';

@freezed
class LoginObject with _$LoginObject {
  factory LoginObject(String username, String password) = _LoginObject;
}

@freezed
class VerifyOtpObject with _$VerifyOtpObject {
  factory VerifyOtpObject(String otp) = _VerifyOtpObject;
}

@freezed
class RegisterObject with _$RegisterObject {
  factory RegisterObject(
      String firstName,
      String lastName,
      String aadharNumber,
      String email,
      String country,
      String city,
      String address,
      String mobileNumber,
      String garudaDomain,
      String userName,
      String password,
      String tenancyType,
      String countryCode,
      String confirmPassword,
      String companyName,
      String brandName) = _RegisterObject;
}

@freezed
class ForgotPasswordObject with _$ForgotPasswordObject {
  factory ForgotPasswordObject(
      String userName,
      String? otp,
      String? newPaasCode,
      String confirmPassword,
      bool isOtpSent) = _ForgotPasswordObject;
}

@freezed
class CreateNewUserObject with _$CreateNewUserObject {
  factory CreateNewUserObject(
    String firstName,
    String lastName,
    //String aadharNumber,
    String email,
    String userName,
    String password,
    String countryCode,
    String mobileNumber,
    String gstNumber,
    String companyName,
    String brandName,
    String country,
    String address,
    String pincode,
    String city,
    String state,
    String owner,
    String userType,
  ) = _CreateNewUserObject;
}

@freezed
class CreatePlan with _$CreatePlan {
  factory CreatePlan(
      String planName,
      String planDescription,
      String planType,
      double planBasicCost,
      double planOfferedCost,
      double planEnteredCost,
      double taxAmount,
      int planValidity,
      String planValidityUnit,
      int downloadSpeed,
      String downloadSpeedUnit,
      int uploadSpeed,
      String uploadSpeedUnit,
      int dataLimit,
      String dataLimitUnit,
      int downloadSpeedFUP,
      int uploadSpeedFUP,
      String downloadSpeedFUPUnit,
      String uploadSpeedFUPUnit,
      int dataLimitFUP,
      String dataLimitFUPUnit,
      int maxSessionTimeInsec,
      int maxDataTransferInSession,
      int maxSimultaneousUser,
      int gracePeriodInDays) = _CreatePlan;
}

@freezed
class CreateResellerPriceChart with _$CreateResellerPriceChart {
  factory CreateResellerPriceChart(
      String planName,
      String resellerUserName,
      double planBasicCost,
      double planOfferedCost,
      double planEnteredMargin,
      double taxAmount) = _CreateResellerPriceChart;
}

@freezed
class CreateOperatorPriceChart with _$CreateOperatorPriceChart {
  factory CreateOperatorPriceChart(
      String planName,
      String operatorUserName,
      String resellerUserName,
      double planBasicCost,
      double planOfferedCost,
      double planEnteredMargin,
      double taxAmount) = _CreateOperatorPriceChart;
}

@freezed
class CreateNewSubscriber with _$CreateNewSubscriber {
  factory CreateNewSubscriber(
    String firstName,
    String lastName,
    String email,
    String userName,
    String password,
    String countryCode,
    String mobileNumber,
    String gstNumber,
    String companyName,
    String brandName,
    String country,
    String address,
    String pincode,
    String city,
    String state,
    String billingCountry,
    String billingAddress,
    String billingPincode,
    String billingCity,
    String billingState,
    String resellerUserName,
    String operatorUserName,
    bool isSameAsPermanentAddress,
  ) = _CreateNewSubscriber;
}

@freezed
class CreateNewSubscription with _$CreateNewSubscription {
  factory CreateNewSubscription(
    String userName,
    String password,
    String resellerUserName,
    String operatorUserName,
    String subscriberId,
    String planName,
    String networkType,
    String ipType,
    String assignedIp,
    bool isInstallationAddressSameAsBilling,
    bool isInstallationAddressSameAsPermanent,
    String country,
    String address,
    String pincode,
    String city,
    String state,
    double planBasicCost,
    double planOfferedCost,
    double planMarginCost,
    double taxAmount,
    double installationCost,
    double securityDeposit,
  ) = _CreateNewSubscription;
}

@freezed
class CreateNewNas with _$CreateNewNas {
  factory CreateNewNas(
      String nasName,
      String shortName,
      String nasType,
      int ports,
      String nasSecret,
      String nasDescription,
      String server,
      String community) = _CreateNewNas;
}

@freezed
class W2wTransferObject with _$W2wTransferObject {
  factory W2wTransferObject(double amount, String receiverUserName,
      String receiverUserId, String remarks) = _W2wTransferObject;
}

@freezed
class BillerData with _$BillerData {
  factory BillerData(String resellerUserName, String operatorUserName,
      String subscriberId, String subscriptionId) = _BillerData;
}
