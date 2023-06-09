import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class LoginUseCase implements BaseUseCase<LoginUseCaseInput, Login> {
  final Repository _repository;
  LoginUseCase(this._repository);

  @override
  Future<Either<Failure, Login>> execute(LoginUseCaseInput input) async {
    return await _repository.login(
        LoginRequest(username: input.username, password: input.password));
  }
}

class LoginUseCaseInput {
  final String username;
  final String password;

  LoginUseCaseInput({required this.username, required this.password});
}
