import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:netify/app/app_prefs.dart';
import 'package:netify/app/constant.dart';
import 'package:netify/data/data_source/remote_data_source.dart';
import 'package:netify/data/mapper/mapper.dart';
import 'package:netify/data/network/dio_factory.dart';
import 'package:netify/data/network/error_handler.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/data/network/network_info.dart';
import 'package:netify/data/request/request.dart';
import 'package:netify/domain/model/model.dart';
import 'package:netify/domain/repository/repository.dart';
import 'package:path_provider/path_provider.dart';
// import 'package:permission_handler/permission_handler.dart';

class RepositoryImplementer extends Repository {
  final RemoteDataSource _remoteDataSource;
  final NetworkInfo _networkInfo;
  final AppPreferences _appPreferences;

  RepositoryImplementer(
      this._remoteDataSource, this._networkInfo, this._appPreferences);

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

  @override
  Future<Either<Failure, GeneralSuccess>> createSubscriber(
      CreateSubscriberRequest createSubscriberRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteDataSource.createSubscriber(createSubscriberRequest);
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
            code: response.errorCode ?? "X-410",
            message: response.message ?? "API Error",
          ));
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

  @override
  Future<Either<Failure, GeneralSuccess>> createSubscription(
      CreateSubscriptionRequest createSubscriptionRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource
            .createSubscription(createSubscriptionRequest);
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
            code: response.errorCode ?? "X-410",
            message: response.message ?? "API Error",
          ));
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

  @override
  Future<Either<Failure, GetSubscriberListBlock>> getSubscriberList(
      GetScreenRequest getScreenRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteDataSource.getSubscriberList(getScreenRequest);
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
            code: response.errorCode ?? "X-410",
            message: response.message ?? "API Error",
          ));
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

  @override
  Future<Either<Failure, GetSubscriptionListBlock>> getSubscriptionList(
      GetScreenRequest getScreenRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteDataSource.getSubscriptionList(getScreenRequest);
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
            code: response.errorCode ?? "X-410",
            message: response.message ?? "API Error",
          ));
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

  @override
  Future<Either<Failure, GetUserWallet>> getUserWallet() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getUserWallet();
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
            code: response.errorCode ?? "X-410",
            message: response.message ?? "API Error",
          ));
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

  @override
  Future<Either<Failure, GeneralSuccess>> w2wTransfer(
      W2WTransferRequest w2WTransferRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteDataSource.w2wTransfer(w2WTransferRequest);
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
            code: response.errorCode ?? "X-410",
            message: response.message ?? "API Error",
          ));
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

  @override
  Future<Either<Failure, GetSubscriptionMeta>> getSubscriptionMetadata() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getSubscriptionMetadata();
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
  Future<Either<Failure, GetPaymentProfileMeta>> getPaymentsMetadata() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getPaymentsMetadata();
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
            code: response.errorCode ?? "X-410",
            message: response.message ?? "API Error",
          ));
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

  @override
  Future<Either<Failure, GetSettingsProfileMeta>> getSettingsMetadata() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getSettingsMetadata();
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
            code: response.errorCode ?? "X-410",
            message: response.message ?? "API Error",
          ));
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

  @override
  Future<Either<Failure, GeneralSuccess>> createNasEntry(
      NasEntryRequest newNasEntryRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteDataSource.createNasEntry(newNasEntryRequest);
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
            code: response.errorCode ?? "X-410",
            message: response.message ?? "API Error",
          ));
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

  @override
  Future<Either<Failure, GeneralSuccess>> createServiceSubscription(
      ServiceSubscriptionRequest newSubscriptionRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource
            .createServiceSubscription(newSubscriptionRequest);
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
            code: response.errorCode ?? "X-410",
            message: response.message ?? "API Error",
          ));
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

  @override
  Future<Either<Failure, GetNasList>> getNasInfo() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getNasInfo();
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
            code: response.errorCode ?? "X-410",
            message: response.message ?? "API Error",
          ));
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

  @override
  Future<Either<Failure, GetServicesInfo>> getServiceInfo() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getServiceInfo();
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
            code: response.errorCode ?? "X-410",
            message: response.message ?? "API Error",
          ));
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

  @override
  Future<Either<Failure, GetBillingProfileMeta>> getBillingMetadata() async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getBillingMetadata();
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
            code: response.errorCode ?? "X-410",
            message: response.message ?? "API Error",
          ));
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

  @override
  Future<Either<Failure, GeneralSuccess>> createBills(
      GenerateBillRequest generateBillRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteDataSource.createBill(generateBillRequest);
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
            code: response.errorCode ?? "X-410",
            message: response.message ?? "API Error",
          ));
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

  @override
  Future<Either<Failure, GetBills>> getBills(
      GetBillRequest getBillRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response = await _remoteDataSource.getBills(getBillRequest);
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
            code: response.errorCode ?? "X-410",
            message: response.message ?? "API Error",
          ));
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

  @override
  Future<Either<Failure, GetUpcomingRenewals>> getRenewals(
      GetRenewalsRequest getRenewalsRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteDataSource.getRenewals(getRenewalsRequest);
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
            code: response.errorCode ?? "X-410",
            message: response.message ?? "API Error",
          ));
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

  @override
  Future<Either<Failure, GeneralSuccess>> getPanelActionDone(
      PanelActionRequest panelActionRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final response =
            await _remoteDataSource.getPanelActionDone(panelActionRequest);
        if (response.status == ApiInternalStatus.success) {
          return Right(response.toDomain());
        } else {
          return Left(Failure(
            code: response.errorCode ?? "X-410",
            message: response.message ?? "API Error",
          ));
        }
      } on Exception catch (error) {
        return Left(ErrorHandler.handle(error).failure);
      }
    } else {
      return Left(Failure(
        code: ResponseCode.noInternetConnection.toString(),
        message: ResponseMessage.noInternetConnection,
      ));
    }
  }

  Future<String?> _findLocalPath() async {
    if (Platform.isAndroid) {
      return "/sdcard/download/";
    } else {
      var directory = await getApplicationDocumentsDirectory();
      return '${directory.path}${Platform.pathSeparator}Download';
    }
  }

  @override
  Future<Either<Failure, SuccessMessage>> getPanelActionDownloadDone(
      PanelActionRequest panelActionRequest) async {
    if (await _networkInfo.isConnected) {
      try {
        final Dio dio = Dio();
        //Directory documentDirectory;
        String downloadDirectoryPath;
        String fileName = 'downloaded_file';
        String filePath = '';
        // final response = await _remoteDataSource
        //     .getPanelActionDownloadDone(panelActionRequest);
        final response = await dio.get<List<int>>(
          '${Constant.baseUrl}/api/v1/tenancy/actions/download', // Replace with your file download endpoint

          queryParameters: panelActionRequest.toJson(),
          options: Options(headers: {
            contentType: "content-type",
            accept: "application/json",
            authorization: await _appPreferences.getJwtToken() ?? "",
          }, responseType: ResponseType.bytes), // Specify responseType as bytes
        );
        if (response.statusCode ==
            ApiInternalStatus.successDownloadFileStatusCode) {
          List<String>? contentDisposition =
              response.headers['content-disposition'];

          fileName = contentDisposition != null
              ? contentDisposition[0].split('filename=')[1].trim()
              : 'downloaded_file';
          try {
            // await Directory('storage/emulated/0/Netify').create(recursive: true);
            //dir = (await getDownloadsDirectory())?.path;
            //documentDirectory = (await getDownloadsDirectory());
            //downloadDirectoryPath = ${documentDirectory.path}${Platform.pathSeparator}Download';
            downloadDirectoryPath = await _findLocalPath() ?? "";
            final saveDirectory = Directory(downloadDirectoryPath);
            bool isThere = await saveDirectory.exists();
            if (!isThere) {
              await saveDirectory.create(recursive: true);
            }
            filePath = '$downloadDirectoryPath/$fileName';
          } catch (e) {
            return Left(Failure(
              code: "X-Permission Error.",
              message: "Need Storage Permission.",
            ));
          }

          if (downloadDirectoryPath.isNotEmpty) {
            await File(filePath).writeAsBytes(response.data!);
            return Right(SuccessMessage(
                message: "Downloaded Successfully at $filePath"));
          } else {
            Right(
                SuccessMessage(message: "Failed to access storage directory."));
          }

          return Right(
              SuccessMessage(message: "Downloaded Successfully at $filePath"));

          // Default filename if header not provided
          //return Right(response.data!);
        } else {
          return Left(Failure(
            code: "X-Download API Error",
            message: "Download API Error",
          ));
        }
      } on Exception catch (error) {
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
