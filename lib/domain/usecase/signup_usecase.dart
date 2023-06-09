import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class SignUpUseCase implements BaseUseCase<SignUpUseCaseInput, GeneralSuccess> {
  final Repository _repository;
  SignUpUseCase(this._repository);

  @override
  Future<Either<Failure, GeneralSuccess>> execute(
      SignUpUseCaseInput input) async {
    return await _repository.signup(SignUpRequest(
        firstName: input.firstName,
        lastName: input.lastName,
        aadharNumber: input.aadharNumber,
        email: input.email,
        country: input.country,
        city: input.city,
        address: input.address,
        mobileNumber: input.mobileNumber,
        garudaDomain: input.garudaDomain,
        userName: input.userName,
        password: input.password,
        tenancyType: input.tenancyType));
  }
}

class SignUpUseCaseInput {
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

  SignUpUseCaseInput(
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
}

class CheckDomainAvailiabilityUseCase
    implements
        BaseUseCase<CheckDomainAvailiabilityUseCaseInput, GeneralSuccess> {
  final Repository _repository;
  CheckDomainAvailiabilityUseCase(this._repository);

  @override
  Future<Either<Failure, GeneralSuccess>> execute(
      CheckDomainAvailiabilityUseCaseInput input) async {
    return await _repository.checkdomainavailiability(
        CheckDomainAvailiabilityRequest(garudaDomain: input.garudaDomain));
  }
}

class CheckDomainAvailiabilityUseCaseInput {
  String garudaDomain;

  CheckDomainAvailiabilityUseCaseInput({required this.garudaDomain});
}
