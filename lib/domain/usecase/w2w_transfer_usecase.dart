import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class W2WTransferUsecase
    implements BaseUseCase<W2WTransferRequest, GeneralSuccess> {
  final Repository _repository;
  W2WTransferUsecase(this._repository);

  @override
  Future<Either<Failure, GeneralSuccess>> execute(
      W2WTransferRequest input) async {
    return await _repository.w2wTransfer(input);
  }
}
