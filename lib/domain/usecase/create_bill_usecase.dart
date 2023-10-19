import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class CreateBillsUseCase
    extends BaseUseCase<GenerateBillRequest, GeneralSuccess> {
  final Repository _repository;
  CreateBillsUseCase(this._repository);

  @override
  Future<Either<Failure, GeneralSuccess>> execute(
      GenerateBillRequest input) async {
    return await _repository.createBills(input);
  }
}
