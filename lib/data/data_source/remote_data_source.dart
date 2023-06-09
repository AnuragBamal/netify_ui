import 'package:netify/data/network/api.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/data/responses/responses.dart';

abstract class RemoteDataSource {
  Future<LoginResponse> login(LoginRequest loginRequest);
  Future<GeneralSuccessResponse> otpservice(VerifyOtpRequest verifyOtpRequest);
  Future<GeneralSuccessResponse> otpserviceGet();
  Future<GeneralSuccessResponse> signup(SignUpRequest signUpRequest);
  Future<GeneralSuccessResponse> checkdomainavailiability(
      CheckDomainAvailiabilityRequest checkDomainAvailiabilityRequest);
  Future<GeneralSuccessResponse> forgotpassword(
      ForgotPasswordRequest forgotPasswordRequest);
}

class RemoteDataSourceImplementer implements RemoteDataSource {
  final ApiServiceClient _apiServiceClient;

  RemoteDataSourceImplementer(this._apiServiceClient);
  @override
  Future<LoginResponse> login(LoginRequest loginRequest) async {
    return await _apiServiceClient.login(loginRequest.toJson());
  }

  @override
  Future<GeneralSuccessResponse> otpservice(
      VerifyOtpRequest verifyOtpRequest) async {
    return await _apiServiceClient.otpservice(verifyOtpRequest.toJson());
  }

  @override
  Future<GeneralSuccessResponse> otpserviceGet() async {
    return await _apiServiceClient.otpserviceGet();
  }

  @override
  Future<GeneralSuccessResponse> signup(SignUpRequest signUpRequest) async {
    return await _apiServiceClient.signup(signUpRequest.toJson());
  }

  @override
  Future<GeneralSuccessResponse> checkdomainavailiability(
      CheckDomainAvailiabilityRequest checkDomainAvailiabilityRequest) async {
    return await _apiServiceClient
        .checkdomainavailiability(checkDomainAvailiabilityRequest.toJson());
  }

  @override
  Future<GeneralSuccessResponse> forgotpassword(
      ForgotPasswordRequest forgotPasswordRequest) async {
    return await _apiServiceClient
        .forgotpassword(forgotPasswordRequest.toJson());
  }
}
