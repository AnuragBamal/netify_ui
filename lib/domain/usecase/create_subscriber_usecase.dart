import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class CreateSubscriberUseCase
    implements BaseUseCase<CreateSubscriberRequest, GeneralSuccess> {
  final Repository _repository;
  CreateSubscriberUseCase(this._repository);

  @override
  Future<Either<Failure, GeneralSuccess>> execute(
      CreateSubscriberRequest input) async {
    return await _repository.createSubscriber(input);
  }
}
