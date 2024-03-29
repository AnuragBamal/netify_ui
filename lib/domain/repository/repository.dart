import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/model.dart';

abstract class Repository {
  Future<Either<Failure, Login>> login(LoginRequest loginRequest);

  Future<Either<Failure, GeneralSuccess>> otpservice(
      VerifyOtpRequest verifyOtpRequest);

  Future<Either<Failure, GeneralSuccess>> otpserviceGet();

  Future<Either<Failure, GeneralSuccess>> signup(SignUpRequest signUpRequest);

  Future<Either<Failure, GeneralSuccess>> checkdomainavailiability(
      CheckDomainAvailiabilityRequest checkDomainAvailiabilityRequest);

  Future<Either<Failure, GeneralSuccess>> forgotpassword(
      ForgotPasswordRequest forgotPasswordRequest);

  Future<Either<Failure, GetUser>> getUserData();

  Future<Either<Failure, GetDashboardItemList>> getDashboardData(
      GetDashboardRequest getDashboardRequest);

  Future<Either<Failure, GetUserList>> getUserListData(
      GetScreenRequest getScreenRequest);

  Future<Either<Failure, GetResellerMap>> getResellerMap();

  Future<Either<Failure, GeneralSuccess>> createuser(
      CreateUserRequest createUserRequest);

  Future<Either<Failure, GeneralSuccess>> createPlan(
      CreatePlanRequest createPlanRequest);

  Future<Either<Failure, GeneralSuccess>> createResellerPriceChart(
      CreateResellerPriceChartRequest createResellerPriceChartRequest);

  Future<Either<Failure, GeneralSuccess>> createOperatorPriceChart(
      CreateOperatorPriceChartRequest createOperatorPriceChartRequest);

  Future<Either<Failure, GetOperatorPriceChart>> getOperatorPriceChart();

  Future<Either<Failure, GetPlans>> getPlans();

  Future<Either<Failure, GetResellerPriceChart>> getResellerPriceChart();

  Future<Either<Failure, GetPlanProfileMeta>> getPlanProfile();

  Future<Either<Failure, GeneralSuccess>> createSubscriber(
      CreateSubscriberRequest createSubscriberRequest);

  Future<Either<Failure, GeneralSuccess>> createSubscription(
      CreateSubscriptionRequest createSubscriptionRequest);

  Future<Either<Failure, GeneralSuccess>> w2wTransfer(
      W2WTransferRequest w2WTransferRequest);

  Future<Either<Failure, GetSubscriberListBlock>> getSubscriberList(
      GetScreenRequest getScreenRequest);

  Future<Either<Failure, GetSubscriptionListBlock>> getSubscriptionList(
      GetScreenRequest getScreenRequest);

  Future<Either<Failure, GetUserWallet>> getUserWallet();

  Future<Either<Failure, GetSubscriptionMeta>> getSubscriptionMetadata();

  Future<Either<Failure, GetPaymentProfileMeta>> getPaymentsMetadata();

  Future<Either<Failure, GetSettingsProfileMeta>> getSettingsMetadata();

  Future<Either<Failure, GetBillingProfileMeta>> getBillingMetadata();

  Future<Either<Failure, GetNasList>> getNasInfo();

  Future<Either<Failure, GetServicesInfo>> getServiceInfo();

  Future<Either<Failure, GeneralSuccess>> createServiceSubscription(
      ServiceSubscriptionRequest newSubscriptionRequest);

  Future<Either<Failure, GeneralSuccess>> createNasEntry(
      NasEntryRequest newNasEntryRequest);

  Future<Either<Failure, GetUpcomingRenewals>> getRenewals(
      GetRenewalsRequest getRenewalsRequest);

  Future<Either<Failure, GetBills>> getBills(GetBillRequest getBillRequest);

  Future<Either<Failure, GeneralSuccess>> createBills(
      GenerateBillRequest generateBillRequest);

  Future<Either<Failure, GeneralSuccess>> getPanelActionDone(
      PanelActionRequest panelActionRequest);

  Future<Either<Failure, SuccessMessage>> getPanelActionDownloadDone(
      PanelActionRequest panelActionRequest);

  Future<Either<Failure, GetTransactionsData>> getTransactionsData(
      GetTransactionsRequest getTransactionsRequest);

  Future<Either<Failure, GetSalesdata>> getSalesData(
      GetSalesRequest getSalesRequest);
}
