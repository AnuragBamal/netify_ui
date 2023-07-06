import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class CreateResellerPriceChartUsecase
    extends BaseUseCase<CreateResellerPriceChartRequest, GeneralSuccess> {
  final Repository _repository;
  CreateResellerPriceChartUsecase(this._repository);

  @override
  Future<Either<Failure, GeneralSuccess>> execute(
      CreateResellerPriceChartRequest input) async {
    return await _repository.createResellerPriceChart(input);
  }
}
