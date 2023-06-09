class LoginRequest {
  String username;
  String password;

  LoginRequest({required this.username, required this.password});

  Map<String, dynamic> toJson() => {
        "userName": username,
        "password": password,
      };
}

class VerifyOtpRequest {
  String otp;

  VerifyOtpRequest({required this.otp});

  Map<String, dynamic> toJson() => {
        "otp": otp,
      };
}

class SignUpRequest {
  String firstName;
  String lastName;
  String aadharNumber;
  String email;
  String country;
  String city;
  String address;
  String mobileNumber;
  String garudaDomain;
  String userName;
  String password;
  String tenancyType;

  SignUpRequest(
      {required this.firstName,
      required this.lastName,
      required this.aadharNumber,
      required this.email,
      required this.country,
      required this.city,
      required this.address,
      required this.mobileNumber,
      required this.garudaDomain,
      required this.userName,
      required this.password,
      required this.tenancyType});

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        "aadharNumber": aadharNumber,
        "email": email,
        "country": country,
        "city": city,
        "address": address,
        "mobileNumber": mobileNumber,
        "garudaDomain": garudaDomain,
        "userName": userName,
        "password": password,
        "tenancyType": tenancyType,
      };
}

class CheckDomainAvailiabilityRequest {
  String garudaDomain;

  CheckDomainAvailiabilityRequest({required this.garudaDomain});

  Map<String, String> toJson() => {
        "garudaDomain": garudaDomain,
      };
}

class ForgotPasswordRequest {
  String userName;
  String? otp;
  String? newPasscode;

  ForgotPasswordRequest({required this.userName, this.otp, this.newPasscode});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {"userName": userName};
    if (otp != null) {
      data["otp"] = otp;
    }
    if (newPasscode != null) {
      data["newPasscode"] = newPasscode;
    }
    return data;
  }
}
