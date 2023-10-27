import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class GetPanelActionDownloadDoneUsecase
    extends BaseUseCase<PanelActionRequest, SuccessMessage> {
  final Repository _repository;
  GetPanelActionDownloadDoneUsecase(this._repository);

  @override
  Future<Either<Failure, SuccessMessage>> execute(
      PanelActionRequest input) async {
    return await _repository.getPanelActionDownloadDone(input);
  }
}
