import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class GetUserListUsecase implements BaseUseCase<GetScreenRequest, GetUserList> {
  final Repository _repository;
  GetUserListUsecase(this._repository);
  @override
  Future<Either<Failure, GetUserList>> execute(GetScreenRequest input) async {
    return await _repository.getUserListData(input);
  }
}
