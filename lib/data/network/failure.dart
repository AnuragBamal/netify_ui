import 'package:netify/data/network/error_handler.dart';

class Failure {
  String code;
  String message;

  Failure({required this.code, required this.message});
}

class DefaultFailure extends Failure {
  DefaultFailure()
      : super(
            code: ResponseCode.defaultCode,
            message: ResponseMessage.defaultMessage);
}
