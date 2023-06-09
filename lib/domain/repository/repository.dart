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
}
