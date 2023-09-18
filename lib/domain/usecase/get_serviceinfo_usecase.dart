import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class GetServiceInfoUseCase implements BaseUseCaseGet<GetServicesInfo> {
  final Repository _repository;
  GetServiceInfoUseCase(this._repository);
  @override
  Future<Either<Failure, GetServicesInfo>> execute() async {
    return await _repository.getServiceInfo();
  }
}
