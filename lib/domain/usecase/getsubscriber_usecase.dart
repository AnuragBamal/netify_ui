import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class GetSubscriberUsecase
    implements BaseUseCase<GetScreenRequest, GetSubscriberListBlock> {
  final Repository _repository;
  GetSubscriberUsecase(this._repository);

  @override
  Future<Either<Failure, GetSubscriberListBlock>> execute(
      GetScreenRequest input) async {
    return await _repository.getSubscriberList(input);
  }
}
