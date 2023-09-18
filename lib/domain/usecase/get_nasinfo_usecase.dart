import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class GetNasInfoUseCase implements BaseUseCaseGet<GetNasList> {
  final Repository _repository;
  GetNasInfoUseCase(this._repository);
  @override
  Future<Either<Failure, GetNasList>> execute() async {
    return await _repository.getNasInfo();
  }
}
