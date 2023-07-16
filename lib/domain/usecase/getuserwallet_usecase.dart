import 'package:dartz/dartz.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:netify/domain/usecase/base_usecase.dart';

class GetUserWalletUseCase extends BaseUseCaseGet<GetUserWallet> {
  final Repository _repository;
  GetUserWalletUseCase(this._repository);

  @override
  Future<Either<Failure, GetUserWallet>> execute() async {
    return await _repository.getUserWallet();
  }
}
