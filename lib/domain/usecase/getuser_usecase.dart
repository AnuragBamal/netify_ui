import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class GetUserUseCase implements BaseUseCaseGet<GetUser> {
  final Repository _repository;
  GetUserUseCase(this._repository);

  @override
  Future<Either<Failure, GetUser>> execute() async {
    return await _repository.getUserData();
  }
}
