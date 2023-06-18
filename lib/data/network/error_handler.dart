import 'package:dio/dio.dart';
import 'package:netify/app/di.dart';
import 'package:netify/data/network/failure.dart';
import 'package:netify/persentation/main/authentication_service.dart';

enum DataSource {
  success,
  noContent,
  badRequest,
  forbidden,
  unauthorized,
  notFound,
  internalServerError,
  connectionTimeout,
  cancel,
  receiveTimeout,
  sendTimeout,
  cacheError,
  noInternetConnection,
  unknown,
  badCertificate,
}

class ErrorHandler implements Exception {
  late Failure failure;
  final AuthenticationService _authenticationService =
      instance<AuthenticationService>();

  ErrorHandler.handle(dynamic error) {
    if (error is DioError) {
      //error from dio error
      failure = _handleError(error);
    } else {
      failure = DataSource.unknown.getFailure();
    }
  }

  Failure _handleError(DioError error) {
    switch (error.type) {
      case DioErrorType.connectionTimeout:
        return DataSource.connectionTimeout.getFailure();
      case DioErrorType.sendTimeout:
        return DataSource.sendTimeout.getFailure();
      case DioErrorType.receiveTimeout:
        return DataSource.receiveTimeout.getFailure();
      case DioErrorType.badResponse:
        if (error.response?.statusCode == 401) {
          _authenticationService.signOutUser();
          return DataSource.unauthorized.getFailure();
        } else if (error.response?.statusCode == 403) {
          return DataSource.forbidden.getFailure();
        } else if (error.response?.statusCode == 404) {
          return DataSource.notFound.getFailure();
        } else if (error.response?.statusCode == 500) {
          return DataSource.internalServerError.getFailure();
        } else if (error.response?.statusCode == 204) {
          return DataSource.noContent.getFailure();
        } else {
          return DataSource.unknown.getFailure();
        }

      case DioErrorType.cancel:
        return DataSource.cancel.getFailure();
      case DioErrorType.unknown:
        return DataSource.unknown.getFailure();
      case DioErrorType.badCertificate:
        return DataSource.badCertificate.getFailure();
      default:
        return DataSource.unknown.getFailure();
    }
  }
}

extension DataSourceExtension on DataSource {
  Failure getFailure() {
    switch (this) {
      case DataSource.success:
        return Failure(
            code: ResponseCode.success.toString(),
            message: ResponseMessage.success);
      case DataSource.noContent:
        return Failure(
            code: ResponseCode.noContent.toString(),
            message: ResponseMessage.noContent);
      case DataSource.badRequest:
        return Failure(
            code: ResponseCode.badRequest.toString(),
            message: ResponseMessage.badRequest);
      case DataSource.forbidden:
        return Failure(
            code: ResponseCode.forbidden.toString(),
            message: ResponseMessage.forbidden);
      case DataSource.unauthorized:
        return Failure(
            code: ResponseCode.unauthorized.toString(),
            message: ResponseMessage.unauthorized);
      case DataSource.notFound:
        return Failure(
            code: ResponseCode.notFound.toString(),
            message: ResponseMessage.notFound);
      case DataSource.internalServerError:
        return Failure(
            code: ResponseCode.internalServerError.toString(),
            message: ResponseMessage.internalServerError);
      case DataSource.connectionTimeout:
        return Failure(
            code: ResponseCode.connectionTimeout.toString(),
            message: ResponseMessage.connectionTimeout);
      case DataSource.cancel:
        return Failure(
            code: ResponseCode.cancel.toString(),
            message: ResponseMessage.cancel);
      case DataSource.receiveTimeout:
        return Failure(
            code: ResponseCode.receiveTimeout.toString(),
            message: ResponseMessage.receiveTimeout);
      case DataSource.sendTimeout:
        return Failure(
            code: ResponseCode.sendTimeout.toString(),
            message: ResponseMessage.sendTimeout);
      case DataSource.cacheError:
        return Failure(
            code: ResponseCode.cacheError.toString(),
            message: ResponseMessage.cacheError);
      case DataSource.noInternetConnection:
        return Failure(
            code: ResponseCode.noInternetConnection.toString(),
            message: ResponseMessage.noInternetConnection);
      case DataSource.unknown:
        return Failure(
            code: ResponseCode.unknown.toString(),
            message: ResponseMessage.unknown);
      case DataSource.badCertificate:
        return Failure(
            code: ResponseCode.badCertificate.toString(),
            message: ResponseMessage.badCertificate);

      default:
        return Failure(
            code: ResponseCode.unknown.toString(),
            message: ResponseMessage.unknown);
    }
  }
}

class ResponseCode {
  static const int success = 200; // success with data
  static const int noContent = 204; // success with no content
  static const int badRequest = 400; // bad request
  static const int forbidden = 403; // failure, api rejected the request
  static const int unauthorized =
      401; // user is not authorized to make this request
  static const int notFound = 404; // failure, api not found
  static const int internalServerError = 500; // failure, internal server error
  static const int badCertificate = 526; // failure, bad certificate

  // local status code
  static const int unknown = -1; // no internet connection
  static const int connectionTimeout = -2;
  static const int cancel = -3;
  static const int receiveTimeout = -4;
  static const int sendTimeout = -5;
  static const int cacheError = -6;
  static const int noInternetConnection = -7;
  static const String defaultCode = "DC-XXX";
}

class ResponseMessage {
  static const String success = "success";
  static const String noContent = "no content";
  static const String badRequest = "bad request, try again later";
  static const String forbidden = "forbidden request, try again later";
  static const String unauthorized = "user is unauthorized,try again later";
  static const String notFound = "url not found";
  static const String internalServerError = "internal server error";
  static const String badCertificate = "bad certificate";
  static const String unknown = "something happened wrong, try again later";
  static const String connectionTimeout = "connection timeout, try again later";
  static const String cancel = "Request Cancelled";
  static const String receiveTimeout = "Receive Timeout";
  static const String sendTimeout = "Send Timeout";
  static const String cacheError = "Cache Error";
  static const String noInternetConnection = "No Internet Connection";
  static const String defaultMessage = "Default Message";
}

class ApiInternalStatus {
  static const String success = "success";
  static const String failure = "error";
}
