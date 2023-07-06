import 'package:dartz/dartz.dart';
import 'package:netify/data/data_source/remote_data_source.dart';
import 'package:netify/data/mapper/mapper.dart';
import 'package:netify/data/network/error_handler.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/data/network/network_info.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';

class RepositoryImplementer extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;

  RepositoryImplementer(this._remoteDataSource, this._networkInfo);

  @override
  Future<Either<Failure, Login>> login(LoginRequest loginRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.login(loginRequest);
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
              code: response.errorCode ?? "X-410",
              message: response.message ?? "API Error"));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(Failure(
          code: ResponseCode.noInternetConnection.toString(),
          message: ResponseMessage.noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, GeneralSuccess>> otpservice(
      VerifyOtpRequest verifyOtpRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.otpservice(verifyOtpRequest);
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
              code: response.errorCode ?? "X-410",
              message: response.message ?? "API Error"));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(Failure(
          code: ResponseCode.noInternetConnection.toString(),
          message: ResponseMessage.noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, GeneralSuccess>> otpserviceGet() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.otpserviceGet();
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
              code: response.errorCode ?? "X-410",
              message: response.message ?? "API Error"));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(Failure(
          code: ResponseCode.noInternetConnection.toString(),
          message: ResponseMessage.noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, GeneralSuccess>> checkdomainavailiability(
      CheckDomainAvailiabilityRequest checkDomainAvailiabilityRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource
            .checkdomainavailiability(checkDomainAvailiabilityRequest);
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
              code: response.errorCode ?? "X-410",
              message: response.message ?? "API Error"));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(Failure(
          code: ResponseCode.noInternetConnection.toString(),
          message: ResponseMessage.noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, GeneralSuccess>> forgotpassword(
      ForgotPasswordRequest forgotPasswordRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteDataSource.forgotpassword(forgotPasswordRequest);
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
              code: response.errorCode ?? "X-410",
              message: response.message ?? "API Error"));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(Failure(
          code: ResponseCode.noInternetConnection.toString(),
          message: ResponseMessage.noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, GeneralSuccess>> signup(
      SignUpRequest signUpRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.signup(signUpRequest);
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
              code: response.errorCode ?? "X-410",
              message: response.message ?? "API Error"));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(Failure(
          code: ResponseCode.noInternetConnection.toString(),
          message: ResponseMessage.noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, GetUser>> getUserData() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getUserData();
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
              code: response.errorCode ?? "X-410",
              message: response.message ?? "API Error"));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(Failure(
          code: ResponseCode.noInternetConnection.toString(),
          message: ResponseMessage.noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, GetDashboardItemList>> getDashboardData(
      GetDashboardRequest getDashboardRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteDataSource.getDashboardData(getDashboardRequest);
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
              code: response.errorCode ?? "X-410",
              message: response.message ?? "API Error"));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(Failure(
          code: ResponseCode.noInternetConnection.toString(),
          message: ResponseMessage.noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, GetUserList>> getUserListData(
      GetScreenRequest getScreenRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteDataSource.getUserListData(getScreenRequest);
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
              code: response.errorCode ?? "X-410",
              message: response.message ?? "API Error"));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(Failure(
          code: ResponseCode.noInternetConnection.toString(),
          message: ResponseMessage.noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, GeneralSuccess>> createuser(
      CreateUserRequest createUserRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.createuser(createUserRequest);
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
              code: response.errorCode ?? "X-410",
              message: response.message ?? "API Error"));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(Failure(
          code: ResponseCode.noInternetConnection.toString(),
          message: ResponseMessage.noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, GetResellerMap>> getResellerMap() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getResellerMap();
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
              code: response.errorCode ?? "X-410",
              message: response.message ?? "API Error"));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(Failure(
          code: ResponseCode.noInternetConnection.toString(),
          message: ResponseMessage.noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, GeneralSuccess>> createOperatorPriceChart(
      CreateOperatorPriceChartRequest createOperatorPriceChartRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource
            .createOperatorPriceChart(createOperatorPriceChartRequest);
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
              code: response.errorCode ?? "X-410",
              message: response.message ?? "API Error"));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(Failure(
          code: ResponseCode.noInternetConnection.toString(),
          message: ResponseMessage.noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, GeneralSuccess>> createPlan(
      CreatePlanRequest createPlanRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.createPlan(createPlanRequest);
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
              code: response.errorCode ?? "X-410",
              message: response.message ?? "API Error"));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(Failure(
          code: ResponseCode.noInternetConnection.toString(),
          message: ResponseMessage.noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, GeneralSuccess>> createResellerPriceChart(
      CreateResellerPriceChartRequest createResellerPriceChartRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource
            .createResellerPriceChart(createResellerPriceChartRequest);
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
              code: response.errorCode ?? "X-410",
              message: response.message ?? "API Error"));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(Failure(
          code: ResponseCode.noInternetConnection.toString(),
          message: ResponseMessage.noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, GetOperatorPriceChart>> getOperatorPriceChart() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getOperatorPriceChart();
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
              code: response.errorCode ?? "X-410",
              message: response.message ?? "API Error"));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(Failure(
          code: ResponseCode.noInternetConnection.toString(),
          message: ResponseMessage.noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, GetPlans>> getPlans() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getPlans();
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
              code: response.errorCode ?? "X-410",
              message: response.message ?? "API Error"));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(Failure(
          code: ResponseCode.noInternetConnection.toString(),
          message: ResponseMessage.noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, GetResellerPriceChart>> getResellerPriceChart() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getResellerPriceChart();
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
              code: response.errorCode ?? "X-410",
              message: response.message ?? "API Error"));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(Failure(
          code: ResponseCode.noInternetConnection.toString(),
          message: ResponseMessage.noInternetConnection));
    }
  }

  @override
  Future<Either<Failure, GetPlanProfileMeta>> getPlanProfile() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getPlanProfile();
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
              code: response.errorCode ?? "X-410",
              message: response.message ?? "API Error"));
        }
      } catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(Failure(
        code: ResponseCode.noInternetConnection.toString(),
        message: ResponseMessage.noInternetConnection,
      ));
    }
  }
}
