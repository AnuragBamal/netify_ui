import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class GetSettingsProfileMetadataUseCase
    implements BaseUseCaseGet<GetSettingsProfileMeta> {
  final Repository _repository;
  GetSettingsProfileMetadataUseCase(this._repository);
  @override
  Future<Either<Failure, GetSettingsProfileMeta>> execute() async {
    return await _repository.getSettingsMetadata();
  }
}
