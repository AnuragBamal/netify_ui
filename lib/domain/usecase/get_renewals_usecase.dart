import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class GetRenewalsUsecase
    extends BaseUseCase<GetRenewalsRequest, GetUpcomingRenewals> {
  final Repository _repository;
  GetRenewalsUsecase(this._repository);

  @override
  Future<Either<Failure, GetUpcomingRenewals>> execute(
      GetRenewalsRequest input) async {
    return await _repository.getRenewals(input);
  }
}
