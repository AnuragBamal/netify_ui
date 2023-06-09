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
      String confirmPassword) = _RegisterObject;
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
