import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class GetTransactionsUsecase
    implements BaseUseCase<GetTransactionsRequest, GetTransactionsData> {
  final Repository _repository;
  GetTransactionsUsecase(this._repository);

  @override
  Future<Either<Failure, GetTransactionsData>> execute(
      GetTransactionsRequest input) async {
    return await _repository.getTransactionsData(input);
  }
}
