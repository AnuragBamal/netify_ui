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
  Future<GetUserResponse> getUserData();
  Future<GetDashboardResponse> getDashboardData(
      GetDashboardRequest getDashboardRequest);
  Future<GetUserListResponse> getUserListData(
      GetScreenRequest getScreenRequest);
  Future<GetResellerMapResponse> getResellerMap();
  Future<GeneralSuccessResponse> createuser(
      CreateUserRequest createUserRequest);
  Future<GeneralSuccessResponse> createPlan(
      CreatePlanRequest createPlanRequest);
  Future<GeneralSuccessResponse> createResellerPriceChart(
      CreateResellerPriceChartRequest createResellerPriceChartRequest);
  Future<GeneralSuccessResponse> createOperatorPriceChart(
      CreateOperatorPriceChartRequest createOperatorPriceChartRequest);
  Future<GetOperatorPriceChartResponse> getOperatorPriceChart();
  Future<GetPlansResponse> getPlans();
  Future<GetResellerPriceChartResponse> getResellerPriceChart();
  Future<GetPlanProfileMetaResponse> getPlanProfile();
  Future<GeneralSuccessResponse> createSubscriber(
      CreateSubscriberRequest createSubscriberRequest);
  Future<GeneralSuccessResponse> createSubscription(
      CreateSubscriptionRequest createSubscriptionRequest);
  Future<GeneralSuccessResponse> w2wTransfer(
      W2WTransferRequest w2WTransferRequest);
  Future<GetSubscriberListBlockResponse> getSubscriberList(
      GetScreenRequest getScreenRequest);
  Future<GetSubscriptionListBlockResponse> getSubscriptionList(
      GetScreenRequest getScreenRequest);
  Future<GetUserWalletResponse> getUserWallet();
  Future<GetSubscriptionMetaResponse> getSubscriptionMetadata();
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

  @override
  Future<GetUserResponse> getUserData() async {
    return await _apiServiceClient.getUserData();
  }

  @override
  Future<GetDashboardResponse> getDashboardData(
      GetDashboardRequest getDashboardRequest) async {
    return await _apiServiceClient
        .getDashboardData(getDashboardRequest.toJson());
  }

  @override
  Future<GetUserListResponse> getUserListData(
      GetScreenRequest getScreenRequest) async {
    return await _apiServiceClient.getUserListData(getScreenRequest.toJson());
  }

  @override
  Future<GeneralSuccessResponse> createuser(
      CreateUserRequest createUserRequest) async {
    return await _apiServiceClient.createuser(createUserRequest.toJson());
  }

  @override
  Future<GetResellerMapResponse> getResellerMap() async {
    return await _apiServiceClient.getResellerMap();
  }

  @override
  Future<GeneralSuccessResponse> createPlan(
      CreatePlanRequest createPlanRequest) async {
    return await _apiServiceClient.createPlan(createPlanRequest.toJson());
  }

  @override
  Future<GeneralSuccessResponse> createResellerPriceChart(
      CreateResellerPriceChartRequest createResellerPriceChartRequest) async {
    return await _apiServiceClient
        .createResellerPriceChart(createResellerPriceChartRequest.toJson());
  }

  @override
  Future<GeneralSuccessResponse> createOperatorPriceChart(
      CreateOperatorPriceChartRequest createOperatorPriceChartRequest) async {
    return await _apiServiceClient
        .createOperatorPriceChart(createOperatorPriceChartRequest.toJson());
  }

  @override
  Future<GetOperatorPriceChartResponse> getOperatorPriceChart() async {
    return await _apiServiceClient.getOperatorPriceChart();
  }

  @override
  Future<GetPlansResponse> getPlans() async {
    return await _apiServiceClient.getPlans();
  }

  @override
  Future<GetResellerPriceChartResponse> getResellerPriceChart() async {
    return await _apiServiceClient.getResellerPriceChart();
  }

  @override
  Future<GetPlanProfileMetaResponse> getPlanProfile() async {
    return await _apiServiceClient.getPlanProfile();
  }

  @override
  Future<GeneralSuccessResponse> createSubscriber(
      CreateSubscriberRequest createSubscriberRequest) async {
    return await _apiServiceClient
        .createSubscriber(createSubscriberRequest.toJson());
  }

  @override
  Future<GeneralSuccessResponse> createSubscription(
      CreateSubscriptionRequest createSubscriptionRequest) async {
    return await _apiServiceClient
        .createSubscription(createSubscriptionRequest.toJson());
  }

  @override
  Future<GetSubscriberListBlockResponse> getSubscriberList(
      GetScreenRequest getScreenRequest) async {
    return await _apiServiceClient.getSubscriberList(getScreenRequest.toJson());
  }

  @override
  Future<GetSubscriptionListBlockResponse> getSubscriptionList(
      GetScreenRequest getScreenRequest) async {
    return await _apiServiceClient
        .getSubscriptionList(getScreenRequest.toJson());
  }

  @override
  Future<GetUserWalletResponse> getUserWallet() async {
    return await _apiServiceClient.getUserWallet();
  }

  @override
  Future<GeneralSuccessResponse> w2wTransfer(
      W2WTransferRequest w2WTransferRequest) async {
    return await _apiServiceClient.w2wTransfer(w2WTransferRequest.toJson());
  }

  @override
  Future<GetSubscriptionMetaResponse> getSubscriptionMetadata() async {
    return await _apiServiceClient.getSubscriptionMetadata();
  }
}
