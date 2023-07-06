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
  factory CreatePlan(String planName, String planDescription) = _CreatePlan;
}

@freezed
class CreateResellerPriceChart with _$CreateResellerPriceChart {
  factory CreateResellerPriceChart(
          String planName, String resellerUserName, int price) =
      _CreateResellerPriceChart;
}

@freezed
class CreateOperatorPriceChart with _$CreateOperatorPriceChart {
  factory CreateOperatorPriceChart(String planName, String operatorUserName,
      String resellerUserName, int price) = _CreateOperatorPriceChart;
}
