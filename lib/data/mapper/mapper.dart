// to convert the response into a non nullable object (model)

import 'package:netify/app/extensions.dart';
import 'package:netify/data/responses/responses.dart';
import 'package:netify/domain/model/model.dart';

const String defaultEmptyString = "";

extension LoginDataResponseExtension on LoginDataResponse? {
  LoginData toDomain() {
    return LoginData(
        token: this?.token?.nonNull ?? defaultEmptyString,
        isVerified: this?.isVerified?.nonNull ?? false,
        firstName: this?.firstName?.nonNull ?? defaultEmptyString,
        lastName: this?.lastName?.nonNull ?? defaultEmptyString,
        userName: this?.userName?.nonNull ?? defaultEmptyString);
  }
}

extension LoginResponseExtension on LoginResponse? {
  Login toDomain() {
    return Login(
        status: this?.status?.nonNull ?? defaultEmptyString,
        message: this?.message?.nonNull ?? defaultEmptyString,
        errorCode: this?.errorCode?.nonNull ?? defaultEmptyString,
        data: this?.data?.map((e) => e.toDomain()).toList() ?? []);
  }
}

extension SuccessMessageResponseExtension on SuccessMessageResponse? {
  SuccessMessage toDomain() {
    return SuccessMessage(
        message: this?.message?.nonNull ?? defaultEmptyString);
  }
}

extension GeneralSuccessResponseExtension on GeneralSuccessResponse? {
  GeneralSuccess toDomain() {
    return GeneralSuccess(
        status: this?.status?.nonNull ?? defaultEmptyString,
        message: this?.message?.nonNull ?? defaultEmptyString,
        errorCode: this?.errorCode?.nonNull ?? defaultEmptyString,
        data: this?.data?.map((e) => e.toDomain()).toList() ?? []);
  }
}
