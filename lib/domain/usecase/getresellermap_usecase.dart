import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';

import 'base_usecase.dart';

class GetResellerMapUseCase extends BaseUseCaseGet<GetResellerMap> {
  final Repository _repository;
  GetResellerMapUseCase(this._repository);

  @override
  Future<Either<Failure, GetResellerMap>> execute() async {
    return await _repository.getResellerMap();
  }
}
