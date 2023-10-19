import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class GetBillingProfileMetadataUseCase
    implements BaseUseCaseGet<GetBillingProfileMeta> {
  final Repository _repository;
  GetBillingProfileMetadataUseCase(this._repository);
  @override
  Future<Either<Failure, GetBillingProfileMeta>> execute() async {
    return await _repository.getBillingMetadata();
  }
}
