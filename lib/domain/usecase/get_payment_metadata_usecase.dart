import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class GetPaymentMetadataUseCase
    implements BaseUseCaseGet<GetPaymentProfileMeta> {
  final Repository _repository;
  GetPaymentMetadataUseCase(this._repository);
  @override
  Future<Either<Failure, GetPaymentProfileMeta>> execute() async {
    return await _repository.getPaymentsMetadata();
  }
}
