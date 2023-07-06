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
}
