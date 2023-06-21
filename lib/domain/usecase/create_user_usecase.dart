import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class CreateUserUseCase
    implements BaseUseCase<CreateUserRequest, GeneralSuccess> {
  final Repository _repository;
  CreateUserUseCase(this._repository);

  @override
  Future<Either<Failure, GeneralSuccess>> execute(
      CreateUserRequest input) async {
    return await _repository.createuser(input);
  }
}
