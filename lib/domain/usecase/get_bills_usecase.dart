import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class GetBillsUsecase extends BaseUseCase<GetBillRequest, GetBills> {
  final Repository _repository;
  GetBillsUsecase(this._repository);

  @override
  Future<Either<Failure, GetBills>> execute(GetBillRequest input) async {
    return await _repository.getBills(input);
  }
}
