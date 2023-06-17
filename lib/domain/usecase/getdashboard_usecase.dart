import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class GetDashboardUseCase
    implements BaseUseCase<GetDashboardRequest, GetDashboardItemList> {
  final Repository _repository;
  GetDashboardUseCase(this._repository);
  @override
  Future<Either<Failure, GetDashboardItemList>> execute(
      GetDashboardRequest input) async {
    return await _repository.getDashboardData(input);
  }
}
