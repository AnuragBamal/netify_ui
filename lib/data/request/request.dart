import 'dart:io';

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

class CreatePlanRequest {
  String planName;
  String planDescription;
  String planType;
  int planValidity;
  String planValidityUnit;
  double planBasicCost;
  double planOfferedCost;
  double taxAmount;
  int downloadSpeed;
  String downloadSpeedUnit;
  int uploadSpeed;
  String uploadSpeedUnit;
  int dataLimit;
  String dataLimitUnit;
  int downloadSpeedFUP;
  int uploadSpeedFUP;
  String downloadSpeedFUPUnit;
  String uploadSpeedFUPUnit;
  int dataLimitFUP;
  String dataLimitFUPUnit;
  int maxSessionTimeInsec;
  int maxDataTransferInSession;
  int maxSimultaneousUser;
  int gracePeriodInDays;

  CreatePlanRequest(
      {required this.planName,
      required this.planDescription,
      required this.planType,
      required this.planValidity,
      required this.planValidityUnit,
      required this.planBasicCost,
      required this.planOfferedCost,
      required this.taxAmount,
      required this.downloadSpeed,
      required this.downloadSpeedUnit,
      required this.uploadSpeed,
      required this.uploadSpeedUnit,
      required this.dataLimit,
      required this.dataLimitUnit,
      required this.downloadSpeedFUP,
      required this.uploadSpeedFUP,
      required this.downloadSpeedFUPUnit,
      required this.uploadSpeedFUPUnit,
      required this.dataLimitFUP,
      required this.dataLimitFUPUnit,
      required this.maxSessionTimeInsec,
      required this.maxDataTransferInSession,
      required this.maxSimultaneousUser,
      required this.gracePeriodInDays});

  Map<String, dynamic> toJson() => {
        "planName": planName,
        "planDescription": planDescription,
        "planType": planType,
        "planValidity": planValidity,
        "planValidityUnit": planValidityUnit,
        "planBasicCost": planBasicCost,
        "planOfferedCost": planOfferedCost,
        "taxAmount": taxAmount,
        "downloadSpeed": downloadSpeed,
        "downloadSpeedUnit": downloadSpeedUnit,
        "uploadSpeed": uploadSpeed,
        "uploadSpeedUnit": uploadSpeedUnit,
        "dataLimit": dataLimit,
        "dataLimitUnit": dataLimitUnit,
        "downloadSpeedFUP": downloadSpeedFUP,
        "uploadSpeedFUP": uploadSpeedFUP,
        "downloadSpeedFUPUnit": downloadSpeedFUPUnit,
        "uploadSpeedFUPUnit": uploadSpeedFUPUnit,
        "dataLimitFUP": dataLimitFUP,
        "dataLimitFUPUnit": dataLimitFUPUnit,
        "maxSessionTimeInsec": maxSessionTimeInsec,
        "maxDataTransferInSession": maxDataTransferInSession,
        "maxSimultaneousUser": maxSimultaneousUser,
        "gracePeriodInDays": gracePeriodInDays,
      };
}

class CreateResellerPriceChartRequest {
  String resellerUserName;
  String planName;
  double planBasicCost;
  double planOfferedCost;
  double taxAmount;

  CreateResellerPriceChartRequest(
      {required this.planName,
      required this.resellerUserName,
      required this.planBasicCost,
      required this.planOfferedCost,
      required this.taxAmount});

  Map<String, dynamic> toJson() => {
        "resellerUserName": resellerUserName,
        "planName": planName,
        "planBasicCost": planBasicCost,
        "planOfferedCost": planOfferedCost,
        "taxAmount": taxAmount,
      };
}

class CreateOperatorPriceChartRequest {
  String operatorUserName;
  String resellerUserName;
  String planName;
  double planBasicCost;
  double planOfferedCost;
  double taxAmount;

  CreateOperatorPriceChartRequest(
      {required this.planName,
      required this.operatorUserName,
      required this.resellerUserName,
      required this.planBasicCost,
      required this.planOfferedCost,
      required this.taxAmount});

  Map<String, dynamic> toJson() => {
        "operatorUserName": operatorUserName,
        "resellerUserName": resellerUserName,
        "planName": planName,
        "planBasicCost": planBasicCost,
        "planOfferedCost": planOfferedCost,
        "taxAmount": taxAmount,
      };
}

class CreateSubscriberRequest {
  String userName;
  String password;
  String firstName;
  String lastName;
  String email;
  String operatorUserName;
  String resellerUserName;
  String mobileNumber;
  String streetAddress;
  String city;
  String state;
  String country;
  String postalCode;
  bool isSameAsPermanentAddress;
  String billingStreetAddress;
  String billingCity;
  String billingState;
  String billingCountry;
  String billingPostalCode;
  String companyName;
  String brandName;
  String gstNumber;
  List<File> files;

  CreateSubscriberRequest(
      {required this.userName,
      required this.password,
      required this.firstName,
      required this.lastName,
      required this.email,
      required this.operatorUserName,
      required this.resellerUserName,
      required this.mobileNumber,
      required this.streetAddress,
      required this.city,
      required this.state,
      required this.postalCode,
      required this.country,
      required this.isSameAsPermanentAddress,
      required this.billingStreetAddress,
      required this.billingCity,
      required this.billingState,
      required this.billingCountry,
      required this.billingPostalCode,
      required this.companyName,
      required this.brandName,
      required this.gstNumber,
      required this.files});

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "password": password,
        "firstName": firstName,
        "lastName": lastName,
        "email": email,
        "operatorUserName": operatorUserName,
        "resellerUserName": resellerUserName,
        "mobileNumber": mobileNumber,
        "streetAddress": streetAddress,
        "city": city,
        "state": state,
        "country": country,
        "postalCode": postalCode,
        "isSameAsPermanentAddress": isSameAsPermanentAddress,
        "billingStreetAddress": billingStreetAddress,
        "billingCity": billingCity,
        "billingState": billingState,
        "billingCountry": billingCountry,
        "billingPostalCode": billingPostalCode,
        "companyName": companyName,
        "brandName": brandName,
        "gstNumber": gstNumber,
        "files": files,
      };
}

class CreateSubscriptionRequest {
  String userName;
  String password;
  String customerId;
  String planId;
  String operatorUserName;
  String resellerUserName;
  String networkType;
  String ipType;
  String assignedIp;
  bool installationAddressSameAsBilling;
  bool installationAddressSameAsPermanent;
  String installationStreetAddress;
  String installationCountry;
  String installationCity;
  String installationState;
  String installationPostalCode;
  double offeredPrice;
  double basePrice;
  double taxAmount;

  CreateSubscriptionRequest({
    required this.userName,
    required this.password,
    required this.customerId,
    required this.planId,
    required this.operatorUserName,
    required this.resellerUserName,
    required this.networkType,
    required this.ipType,
    required this.assignedIp,
    required this.installationAddressSameAsBilling,
    required this.installationAddressSameAsPermanent,
    required this.installationStreetAddress,
    required this.installationCountry,
    required this.installationCity,
    required this.installationState,
    required this.installationPostalCode,
    required this.offeredPrice,
    required this.basePrice,
    required this.taxAmount,
  });

  Map<String, dynamic> toJson() => {
        "userName": userName,
        "password": password,
        "customerId": customerId,
        "planId": planId,
        "operatorUserName": operatorUserName,
        "resellerUserName": resellerUserName,
        "networkType": networkType,
        "ipType": ipType,
        "assignedIp": assignedIp,
        "installationAddressSameAsBilling": installationAddressSameAsBilling,
        "installationAddressSameAsPermanent":
            installationAddressSameAsPermanent,
        "installationStreetAddress": installationStreetAddress,
        "installationAddressType": installationCountry,
        "installationCity": installationCity,
        "installationState": installationState,
        "installationPostalCode": installationPostalCode,
        "offeredPrice": offeredPrice,
        "basePrice": basePrice,
        "taxAmount": taxAmount,
      };
}

class W2WTransferRequest {
  String receiverId;
  String receiverUsername;
  double amount;

  W2WTransferRequest(
      {required this.receiverId,
      required this.receiverUsername,
      required this.amount});

  Map<String, dynamic> toJson() => {
        "receiverId": receiverId,
        "receiverUsername": receiverUsername,
        "amount": amount,
      };
}
