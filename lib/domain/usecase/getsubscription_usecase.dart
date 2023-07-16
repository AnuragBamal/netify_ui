import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class GetSubscriptionUsecase
    implements BaseUseCase<GetScreenRequest, GetSubscriptionListBlock> {
  final Repository _repository;
  GetSubscriptionUsecase(this._repository);

  @override
  Future<Either<Failure, GetSubscriptionListBlock>> execute(
      GetScreenRequest input) async {
    return await _repository.getSubscriptionList(input);
  }
}
