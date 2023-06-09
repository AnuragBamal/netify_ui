import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class ForgotPasswordUseCase
    implements BaseUseCase<ForgotPasswordUseCaseInput, GeneralSuccess> {
  final Repository _repository;
  ForgotPasswordUseCase(this._repository);

  @override
  Future<Either<Failure, GeneralSuccess>> execute(
      ForgotPasswordUseCaseInput input) async {
    return await _repository.forgotpassword(ForgotPasswordRequest(
        userName: input.userName,
        otp: input.otp,
        newPasscode: input.newPasscode));
  }
}

class ForgotPasswordUseCaseInput {
  String userName;
  String? otp;
  String? newPasscode;

  ForgotPasswordUseCaseInput(
      {required this.userName, this.otp, this.newPasscode});
}
