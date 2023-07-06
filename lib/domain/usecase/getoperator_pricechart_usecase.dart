import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class GetOperatorPriceChartUseCase
    extends BaseUseCaseGet<GetOperatorPriceChart> {
  final Repository _repository;
  GetOperatorPriceChartUseCase(this._repository);

  @override
  Future<Either<Failure, GetOperatorPriceChart>> execute() async {
    return await _repository.getOperatorPriceChart();
  }
}
