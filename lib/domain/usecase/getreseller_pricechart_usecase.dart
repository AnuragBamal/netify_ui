import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class GetResellerPriceChartUseCase
    extends BaseUseCaseGet<GetResellerPriceChart> {
  final Repository _repository;
  GetResellerPriceChartUseCase(this._repository);
  @override
  Future<Either<Failure, GetResellerPriceChart>> execute() async {
    return await _repository.getResellerPriceChart();
  }
}
