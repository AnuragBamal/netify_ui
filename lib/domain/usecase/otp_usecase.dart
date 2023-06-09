import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class VerifyOtpUseCase
    implements BaseUseCase<VerifyOtpUseCaseInput, GeneralSuccess> {
  final Repository _repository;

  VerifyOtpUseCase(this._repository);
  @override
  Future<Either<Failure, GeneralSuccess>> execute(
      VerifyOtpUseCaseInput input) async {
    return await _repository.otpservice(VerifyOtpRequest(otp: input.otp));
  }
}

class GetOtpUseCase implements BaseUseCaseGet<GeneralSuccess> {
  final Repository _repository;

  GetOtpUseCase(this._repository);
  @override
  Future<Either<Failure, GeneralSuccess>> execute() async {
    return await _repository.otpserviceGet();
  }
}

class VerifyOtpUseCaseInput {
  final String otp;

  VerifyOtpUseCaseInput({required this.otp});
}
