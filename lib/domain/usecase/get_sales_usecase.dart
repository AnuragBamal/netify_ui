import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class GetSalesUsecase implements BaseUseCase<GetSalesRequest, GetSalesdata> {
  final Repository _repository;
  GetSalesUsecase(this._repository);

  @override
  Future<Either<Failure, GetSalesdata>> execute(GetSalesRequest input) async {
    return await _repository.getSalesData(input);
  }
}
