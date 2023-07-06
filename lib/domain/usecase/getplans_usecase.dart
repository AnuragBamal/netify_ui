import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class GetPlansUsecase extends BaseUseCaseGet<GetPlans> {
  final Repository _repository;
  GetPlansUsecase(this._repository);

  @override
  Future<Either<Failure, GetPlans>> execute() async {
    return await _repository.getPlans();
  }
}
