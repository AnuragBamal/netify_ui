import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class GetPlanProfileUseCase implements BaseUseCaseGet<GetPlanProfileMeta> {
  final Repository _repository;
  GetPlanProfileUseCase(this._repository);
  @override
  Future<Either<Failure, GetPlanProfileMeta>> execute() async {
    return await _repository.getPlanProfile();
  }
}
