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
  String companyName;
  String brandName;

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
      required this.tenancyType,
      required this.companyName,
      required this.brandName});

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
        "companyName": companyName,
        "brandName": brandName,
      };
}

class CheckDomainAvailiabilityRequest {
  String garudaDomain;

  CheckDomainAvailiabilityRequest({required this.garudaDomain});

  Map<String, dynamic> toJson() => {
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

class GetDashboardRequest {
  String screenTypeIdentity;

  GetDashboardRequest({required this.screenTypeIdentity});

  Map<String, dynamic> toJson() => {
        "screenTypeIdentity": screenTypeIdentity,
      };
}

class GetScreenRequest {
  String screenTypeIdentity;
  bool isSearch;
  String? searchValue;
  String? searchFilter;
  int pageNumber;
  int pageSize;

  GetScreenRequest(
      {required this.screenTypeIdentity,
      required this.isSearch,
      this.searchValue,
      this.searchFilter,
      required this.pageNumber,
      required this.pageSize});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = {
      "screenTypeIdentity": screenTypeIdentity,
      "isSearch": isSearch,
      "pageNumber": pageNumber,
      "pageSize": pageSize
    };
    if (searchValue != null) {
      data["searchValue"] = searchValue;
    }
    if (searchFilter != null) {
      data["searchFilter"] = searchFilter;
    }
    return data;
  }
}

class CreateUserRequest {
  String firstName;
  String lastName;
  //String aadharNumber;
  String email;
  String country;
  String city;
  String address;
  String mobileNumber;
  String userName;
  String password;
  String companyName;
  String brandName;
  String role;
  String pincode;
  String state;
  String gstNumber;
  String ownerUserName;

  CreateUserRequest(
      {required this.firstName,
      required this.lastName,
      //required this.aadharNumber,
      required this.email,
      required this.country,
      required this.city,
      required this.address,
      required this.mobileNumber,
      required this.userName,
      required this.password,
      required this.companyName,
      required this.brandName,
      required this.role,
      required this.pincode,
      required this.state,
      required this.gstNumber,
      required this.ownerUserName});

  Map<String, dynamic> toJson() => {
        "firstName": firstName,
        "lastName": lastName,
        //"aadharNumber": aadharNumber,
        "email": email,
        "country": country,
        "city": city,
        "address": address,
        "mobileNumber": mobileNumber,
        "userName": userName,
        "password": password,
        "companyName": companyName,
        "brandName": brandName,
        "role": role,
        "pincode": pincode,
        "state": state,
        "gstNumber": gstNumber,
        "ownerUserName": ownerUserName,
      };
}
