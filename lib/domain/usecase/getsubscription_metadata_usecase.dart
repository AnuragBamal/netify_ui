import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class GetSubscriptionMetaUsecase
    implements BaseUseCaseGet<GetSubscriptionMeta> {
  final Repository _repository;
  GetSubscriptionMetaUsecase(this._repository);
  @override
  Future<Either<Failure, GetSubscriptionMeta>> execute() async {
    return await _repository.getSubscriptionMetadata();
  }
}
