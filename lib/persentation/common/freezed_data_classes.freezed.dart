// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'freezed_data_classes.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$LoginObject {
  String get username => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $LoginObjectCopyWith<LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginObjectCopyWith<$Res> {
  factory $LoginObjectCopyWith(
          LoginObject value, $Res Function(LoginObject) then) =
      _$LoginObjectCopyWithImpl<$Res, LoginObject>;
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class _$LoginObjectCopyWithImpl<$Res, $Val extends LoginObject>
    implements $LoginObjectCopyWith<$Res> {
  _$LoginObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_value.copyWith(
      username: null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_LoginObjectCopyWith<$Res>
    implements $LoginObjectCopyWith<$Res> {
  factory _$$_LoginObjectCopyWith(
          _$_LoginObject value, $Res Function(_$_LoginObject) then) =
      __$$_LoginObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String username, String password});
}

/// @nodoc
class __$$_LoginObjectCopyWithImpl<$Res>
    extends _$LoginObjectCopyWithImpl<$Res, _$_LoginObject>
    implements _$$_LoginObjectCopyWith<$Res> {
  __$$_LoginObjectCopyWithImpl(
      _$_LoginObject _value, $Res Function(_$_LoginObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? username = null,
    Object? password = null,
  }) {
    return _then(_$_LoginObject(
      null == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_LoginObject implements _LoginObject {
  _$_LoginObject(this.username, this.password);

  @override
  final String username;
  @override
  final String password;

  @override
  String toString() {
    return 'LoginObject(username: $username, password: $password)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_LoginObject &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, username, password);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_LoginObjectCopyWith<_$_LoginObject> get copyWith =>
      __$$_LoginObjectCopyWithImpl<_$_LoginObject>(this, _$identity);
}

abstract class _LoginObject implements LoginObject {
  factory _LoginObject(final String username, final String password) =
      _$_LoginObject;

  @override
  String get username;
  @override
  String get password;
  @override
  @JsonKey(ignore: true)
  _$$_LoginObjectCopyWith<_$_LoginObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$VerifyOtpObject {
  String get otp => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $VerifyOtpObjectCopyWith<VerifyOtpObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $VerifyOtpObjectCopyWith<$Res> {
  factory $VerifyOtpObjectCopyWith(
          VerifyOtpObject value, $Res Function(VerifyOtpObject) then) =
      _$VerifyOtpObjectCopyWithImpl<$Res, VerifyOtpObject>;
  @useResult
  $Res call({String otp});
}

/// @nodoc
class _$VerifyOtpObjectCopyWithImpl<$Res, $Val extends VerifyOtpObject>
    implements $VerifyOtpObjectCopyWith<$Res> {
  _$VerifyOtpObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = null,
  }) {
    return _then(_value.copyWith(
      otp: null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_VerifyOtpObjectCopyWith<$Res>
    implements $VerifyOtpObjectCopyWith<$Res> {
  factory _$$_VerifyOtpObjectCopyWith(
          _$_VerifyOtpObject value, $Res Function(_$_VerifyOtpObject) then) =
      __$$_VerifyOtpObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String otp});
}

/// @nodoc
class __$$_VerifyOtpObjectCopyWithImpl<$Res>
    extends _$VerifyOtpObjectCopyWithImpl<$Res, _$_VerifyOtpObject>
    implements _$$_VerifyOtpObjectCopyWith<$Res> {
  __$$_VerifyOtpObjectCopyWithImpl(
      _$_VerifyOtpObject _value, $Res Function(_$_VerifyOtpObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = null,
  }) {
    return _then(_$_VerifyOtpObject(
      null == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_VerifyOtpObject implements _VerifyOtpObject {
  _$_VerifyOtpObject(this.otp);

  @override
  final String otp;

  @override
  String toString() {
    return 'VerifyOtpObject(otp: $otp)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_VerifyOtpObject &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, otp);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_VerifyOtpObjectCopyWith<_$_VerifyOtpObject> get copyWith =>
      __$$_VerifyOtpObjectCopyWithImpl<_$_VerifyOtpObject>(this, _$identity);
}

abstract class _VerifyOtpObject implements VerifyOtpObject {
  factory _VerifyOtpObject(final String otp) = _$_VerifyOtpObject;

  @override
  String get otp;
  @override
  @JsonKey(ignore: true)
  _$$_VerifyOtpObjectCopyWith<_$_VerifyOtpObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$RegisterObject {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get aadharNumber => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get mobileNumber => throw _privateConstructorUsedError;
  String get garudaDomain => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get tenancyType => throw _privateConstructorUsedError;
  String get countryCode => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;
  String get companyName => throw _privateConstructorUsedError;
  String get brandName => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $RegisterObjectCopyWith<RegisterObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $RegisterObjectCopyWith<$Res> {
  factory $RegisterObjectCopyWith(
          RegisterObject value, $Res Function(RegisterObject) then) =
      _$RegisterObjectCopyWithImpl<$Res, RegisterObject>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String aadharNumber,
      String email,
      String country,
      String city,
      String address,
      String mobileNumber,
      String garudaDomain,
      String userName,
      String password,
      String tenancyType,
      String countryCode,
      String confirmPassword,
      String companyName,
      String brandName});
}

/// @nodoc
class _$RegisterObjectCopyWithImpl<$Res, $Val extends RegisterObject>
    implements $RegisterObjectCopyWith<$Res> {
  _$RegisterObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? aadharNumber = null,
    Object? email = null,
    Object? country = null,
    Object? city = null,
    Object? address = null,
    Object? mobileNumber = null,
    Object? garudaDomain = null,
    Object? userName = null,
    Object? password = null,
    Object? tenancyType = null,
    Object? countryCode = null,
    Object? confirmPassword = null,
    Object? companyName = null,
    Object? brandName = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      aadharNumber: null == aadharNumber
          ? _value.aadharNumber
          : aadharNumber // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      garudaDomain: null == garudaDomain
          ? _value.garudaDomain
          : garudaDomain // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      tenancyType: null == tenancyType
          ? _value.tenancyType
          : tenancyType // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      brandName: null == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_RegisterObjectCopyWith<$Res>
    implements $RegisterObjectCopyWith<$Res> {
  factory _$$_RegisterObjectCopyWith(
          _$_RegisterObject value, $Res Function(_$_RegisterObject) then) =
      __$$_RegisterObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String aadharNumber,
      String email,
      String country,
      String city,
      String address,
      String mobileNumber,
      String garudaDomain,
      String userName,
      String password,
      String tenancyType,
      String countryCode,
      String confirmPassword,
      String companyName,
      String brandName});
}

/// @nodoc
class __$$_RegisterObjectCopyWithImpl<$Res>
    extends _$RegisterObjectCopyWithImpl<$Res, _$_RegisterObject>
    implements _$$_RegisterObjectCopyWith<$Res> {
  __$$_RegisterObjectCopyWithImpl(
      _$_RegisterObject _value, $Res Function(_$_RegisterObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? aadharNumber = null,
    Object? email = null,
    Object? country = null,
    Object? city = null,
    Object? address = null,
    Object? mobileNumber = null,
    Object? garudaDomain = null,
    Object? userName = null,
    Object? password = null,
    Object? tenancyType = null,
    Object? countryCode = null,
    Object? confirmPassword = null,
    Object? companyName = null,
    Object? brandName = null,
  }) {
    return _then(_$_RegisterObject(
      null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      null == aadharNumber
          ? _value.aadharNumber
          : aadharNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == garudaDomain
          ? _value.garudaDomain
          : garudaDomain // ignore: cast_nullable_to_non_nullable
              as String,
      null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == tenancyType
          ? _value.tenancyType
          : tenancyType // ignore: cast_nullable_to_non_nullable
              as String,
      null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      null == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_RegisterObject implements _RegisterObject {
  _$_RegisterObject(
      this.firstName,
      this.lastName,
      this.aadharNumber,
      this.email,
      this.country,
      this.city,
      this.address,
      this.mobileNumber,
      this.garudaDomain,
      this.userName,
      this.password,
      this.tenancyType,
      this.countryCode,
      this.confirmPassword,
      this.companyName,
      this.brandName);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String aadharNumber;
  @override
  final String email;
  @override
  final String country;
  @override
  final String city;
  @override
  final String address;
  @override
  final String mobileNumber;
  @override
  final String garudaDomain;
  @override
  final String userName;
  @override
  final String password;
  @override
  final String tenancyType;
  @override
  final String countryCode;
  @override
  final String confirmPassword;
  @override
  final String companyName;
  @override
  final String brandName;

  @override
  String toString() {
    return 'RegisterObject(firstName: $firstName, lastName: $lastName, aadharNumber: $aadharNumber, email: $email, country: $country, city: $city, address: $address, mobileNumber: $mobileNumber, garudaDomain: $garudaDomain, userName: $userName, password: $password, tenancyType: $tenancyType, countryCode: $countryCode, confirmPassword: $confirmPassword, companyName: $companyName, brandName: $brandName)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_RegisterObject &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.aadharNumber, aadharNumber) ||
                other.aadharNumber == aadharNumber) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.garudaDomain, garudaDomain) ||
                other.garudaDomain == garudaDomain) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.tenancyType, tenancyType) ||
                other.tenancyType == tenancyType) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      aadharNumber,
      email,
      country,
      city,
      address,
      mobileNumber,
      garudaDomain,
      userName,
      password,
      tenancyType,
      countryCode,
      confirmPassword,
      companyName,
      brandName);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_RegisterObjectCopyWith<_$_RegisterObject> get copyWith =>
      __$$_RegisterObjectCopyWithImpl<_$_RegisterObject>(this, _$identity);
}

abstract class _RegisterObject implements RegisterObject {
  factory _RegisterObject(
      final String firstName,
      final String lastName,
      final String aadharNumber,
      final String email,
      final String country,
      final String city,
      final String address,
      final String mobileNumber,
      final String garudaDomain,
      final String userName,
      final String password,
      final String tenancyType,
      final String countryCode,
      final String confirmPassword,
      final String companyName,
      final String brandName) = _$_RegisterObject;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get aadharNumber;
  @override
  String get email;
  @override
  String get country;
  @override
  String get city;
  @override
  String get address;
  @override
  String get mobileNumber;
  @override
  String get garudaDomain;
  @override
  String get userName;
  @override
  String get password;
  @override
  String get tenancyType;
  @override
  String get countryCode;
  @override
  String get confirmPassword;
  @override
  String get companyName;
  @override
  String get brandName;
  @override
  @JsonKey(ignore: true)
  _$$_RegisterObjectCopyWith<_$_RegisterObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$ForgotPasswordObject {
  String get userName => throw _privateConstructorUsedError;
  String? get otp => throw _privateConstructorUsedError;
  String? get newPaasCode => throw _privateConstructorUsedError;
  String get confirmPassword => throw _privateConstructorUsedError;
  bool get isOtpSent => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $ForgotPasswordObjectCopyWith<ForgotPasswordObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ForgotPasswordObjectCopyWith<$Res> {
  factory $ForgotPasswordObjectCopyWith(ForgotPasswordObject value,
          $Res Function(ForgotPasswordObject) then) =
      _$ForgotPasswordObjectCopyWithImpl<$Res, ForgotPasswordObject>;
  @useResult
  $Res call(
      {String userName,
      String? otp,
      String? newPaasCode,
      String confirmPassword,
      bool isOtpSent});
}

/// @nodoc
class _$ForgotPasswordObjectCopyWithImpl<$Res,
        $Val extends ForgotPasswordObject>
    implements $ForgotPasswordObjectCopyWith<$Res> {
  _$ForgotPasswordObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? otp = freezed,
    Object? newPaasCode = freezed,
    Object? confirmPassword = null,
    Object? isOtpSent = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      otp: freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      newPaasCode: freezed == newPaasCode
          ? _value.newPaasCode
          : newPaasCode // ignore: cast_nullable_to_non_nullable
              as String?,
      confirmPassword: null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      isOtpSent: null == isOtpSent
          ? _value.isOtpSent
          : isOtpSent // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_ForgotPasswordObjectCopyWith<$Res>
    implements $ForgotPasswordObjectCopyWith<$Res> {
  factory _$$_ForgotPasswordObjectCopyWith(_$_ForgotPasswordObject value,
          $Res Function(_$_ForgotPasswordObject) then) =
      __$$_ForgotPasswordObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userName,
      String? otp,
      String? newPaasCode,
      String confirmPassword,
      bool isOtpSent});
}

/// @nodoc
class __$$_ForgotPasswordObjectCopyWithImpl<$Res>
    extends _$ForgotPasswordObjectCopyWithImpl<$Res, _$_ForgotPasswordObject>
    implements _$$_ForgotPasswordObjectCopyWith<$Res> {
  __$$_ForgotPasswordObjectCopyWithImpl(_$_ForgotPasswordObject _value,
      $Res Function(_$_ForgotPasswordObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? otp = freezed,
    Object? newPaasCode = freezed,
    Object? confirmPassword = null,
    Object? isOtpSent = null,
  }) {
    return _then(_$_ForgotPasswordObject(
      null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      freezed == otp
          ? _value.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String?,
      freezed == newPaasCode
          ? _value.newPaasCode
          : newPaasCode // ignore: cast_nullable_to_non_nullable
              as String?,
      null == confirmPassword
          ? _value.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      null == isOtpSent
          ? _value.isOtpSent
          : isOtpSent // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_ForgotPasswordObject implements _ForgotPasswordObject {
  _$_ForgotPasswordObject(this.userName, this.otp, this.newPaasCode,
      this.confirmPassword, this.isOtpSent);

  @override
  final String userName;
  @override
  final String? otp;
  @override
  final String? newPaasCode;
  @override
  final String confirmPassword;
  @override
  final bool isOtpSent;

  @override
  String toString() {
    return 'ForgotPasswordObject(userName: $userName, otp: $otp, newPaasCode: $newPaasCode, confirmPassword: $confirmPassword, isOtpSent: $isOtpSent)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_ForgotPasswordObject &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.newPaasCode, newPaasCode) ||
                other.newPaasCode == newPaasCode) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.isOtpSent, isOtpSent) ||
                other.isOtpSent == isOtpSent));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, userName, otp, newPaasCode, confirmPassword, isOtpSent);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_ForgotPasswordObjectCopyWith<_$_ForgotPasswordObject> get copyWith =>
      __$$_ForgotPasswordObjectCopyWithImpl<_$_ForgotPasswordObject>(
          this, _$identity);
}

abstract class _ForgotPasswordObject implements ForgotPasswordObject {
  factory _ForgotPasswordObject(
      final String userName,
      final String? otp,
      final String? newPaasCode,
      final String confirmPassword,
      final bool isOtpSent) = _$_ForgotPasswordObject;

  @override
  String get userName;
  @override
  String? get otp;
  @override
  String? get newPaasCode;
  @override
  String get confirmPassword;
  @override
  bool get isOtpSent;
  @override
  @JsonKey(ignore: true)
  _$$_ForgotPasswordObjectCopyWith<_$_ForgotPasswordObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateNewUserObject {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName =>
      throw _privateConstructorUsedError; //String aadharNumber,
  String get email => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get countryCode => throw _privateConstructorUsedError;
  String get mobileNumber => throw _privateConstructorUsedError;
  String get gstNumber => throw _privateConstructorUsedError;
  String get companyName => throw _privateConstructorUsedError;
  String get brandName => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get pincode => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get owner => throw _privateConstructorUsedError;
  String get userType => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateNewUserObjectCopyWith<CreateNewUserObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateNewUserObjectCopyWith<$Res> {
  factory $CreateNewUserObjectCopyWith(
          CreateNewUserObject value, $Res Function(CreateNewUserObject) then) =
      _$CreateNewUserObjectCopyWithImpl<$Res, CreateNewUserObject>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String email,
      String userName,
      String password,
      String countryCode,
      String mobileNumber,
      String gstNumber,
      String companyName,
      String brandName,
      String country,
      String address,
      String pincode,
      String city,
      String state,
      String owner,
      String userType});
}

/// @nodoc
class _$CreateNewUserObjectCopyWithImpl<$Res, $Val extends CreateNewUserObject>
    implements $CreateNewUserObjectCopyWith<$Res> {
  _$CreateNewUserObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? userName = null,
    Object? password = null,
    Object? countryCode = null,
    Object? mobileNumber = null,
    Object? gstNumber = null,
    Object? companyName = null,
    Object? brandName = null,
    Object? country = null,
    Object? address = null,
    Object? pincode = null,
    Object? city = null,
    Object? state = null,
    Object? owner = null,
    Object? userType = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      gstNumber: null == gstNumber
          ? _value.gstNumber
          : gstNumber // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      brandName: null == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      owner: null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      userType: null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateNewUserObjectCopyWith<$Res>
    implements $CreateNewUserObjectCopyWith<$Res> {
  factory _$$_CreateNewUserObjectCopyWith(_$_CreateNewUserObject value,
          $Res Function(_$_CreateNewUserObject) then) =
      __$$_CreateNewUserObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String email,
      String userName,
      String password,
      String countryCode,
      String mobileNumber,
      String gstNumber,
      String companyName,
      String brandName,
      String country,
      String address,
      String pincode,
      String city,
      String state,
      String owner,
      String userType});
}

/// @nodoc
class __$$_CreateNewUserObjectCopyWithImpl<$Res>
    extends _$CreateNewUserObjectCopyWithImpl<$Res, _$_CreateNewUserObject>
    implements _$$_CreateNewUserObjectCopyWith<$Res> {
  __$$_CreateNewUserObjectCopyWithImpl(_$_CreateNewUserObject _value,
      $Res Function(_$_CreateNewUserObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? userName = null,
    Object? password = null,
    Object? countryCode = null,
    Object? mobileNumber = null,
    Object? gstNumber = null,
    Object? companyName = null,
    Object? brandName = null,
    Object? country = null,
    Object? address = null,
    Object? pincode = null,
    Object? city = null,
    Object? state = null,
    Object? owner = null,
    Object? userType = null,
  }) {
    return _then(_$_CreateNewUserObject(
      null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == gstNumber
          ? _value.gstNumber
          : gstNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      null == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
      null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String,
      null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      null == owner
          ? _value.owner
          : owner // ignore: cast_nullable_to_non_nullable
              as String,
      null == userType
          ? _value.userType
          : userType // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CreateNewUserObject implements _CreateNewUserObject {
  _$_CreateNewUserObject(
      this.firstName,
      this.lastName,
      this.email,
      this.userName,
      this.password,
      this.countryCode,
      this.mobileNumber,
      this.gstNumber,
      this.companyName,
      this.brandName,
      this.country,
      this.address,
      this.pincode,
      this.city,
      this.state,
      this.owner,
      this.userType);

  @override
  final String firstName;
  @override
  final String lastName;
//String aadharNumber,
  @override
  final String email;
  @override
  final String userName;
  @override
  final String password;
  @override
  final String countryCode;
  @override
  final String mobileNumber;
  @override
  final String gstNumber;
  @override
  final String companyName;
  @override
  final String brandName;
  @override
  final String country;
  @override
  final String address;
  @override
  final String pincode;
  @override
  final String city;
  @override
  final String state;
  @override
  final String owner;
  @override
  final String userType;

  @override
  String toString() {
    return 'CreateNewUserObject(firstName: $firstName, lastName: $lastName, email: $email, userName: $userName, password: $password, countryCode: $countryCode, mobileNumber: $mobileNumber, gstNumber: $gstNumber, companyName: $companyName, brandName: $brandName, country: $country, address: $address, pincode: $pincode, city: $city, state: $state, owner: $owner, userType: $userType)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateNewUserObject &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.gstNumber, gstNumber) ||
                other.gstNumber == gstNumber) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.owner, owner) || other.owner == owner) &&
            (identical(other.userType, userType) ||
                other.userType == userType));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      email,
      userName,
      password,
      countryCode,
      mobileNumber,
      gstNumber,
      companyName,
      brandName,
      country,
      address,
      pincode,
      city,
      state,
      owner,
      userType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateNewUserObjectCopyWith<_$_CreateNewUserObject> get copyWith =>
      __$$_CreateNewUserObjectCopyWithImpl<_$_CreateNewUserObject>(
          this, _$identity);
}

abstract class _CreateNewUserObject implements CreateNewUserObject {
  factory _CreateNewUserObject(
      final String firstName,
      final String lastName,
      final String email,
      final String userName,
      final String password,
      final String countryCode,
      final String mobileNumber,
      final String gstNumber,
      final String companyName,
      final String brandName,
      final String country,
      final String address,
      final String pincode,
      final String city,
      final String state,
      final String owner,
      final String userType) = _$_CreateNewUserObject;

  @override
  String get firstName;
  @override
  String get lastName;
  @override //String aadharNumber,
  String get email;
  @override
  String get userName;
  @override
  String get password;
  @override
  String get countryCode;
  @override
  String get mobileNumber;
  @override
  String get gstNumber;
  @override
  String get companyName;
  @override
  String get brandName;
  @override
  String get country;
  @override
  String get address;
  @override
  String get pincode;
  @override
  String get city;
  @override
  String get state;
  @override
  String get owner;
  @override
  String get userType;
  @override
  @JsonKey(ignore: true)
  _$$_CreateNewUserObjectCopyWith<_$_CreateNewUserObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreatePlan {
  String get planName => throw _privateConstructorUsedError;
  String get planDescription => throw _privateConstructorUsedError;
  String get planType => throw _privateConstructorUsedError;
  double get planBasicCost => throw _privateConstructorUsedError;
  double get planOfferedCost => throw _privateConstructorUsedError;
  double get planEnteredCost => throw _privateConstructorUsedError;
  double get taxAmount => throw _privateConstructorUsedError;
  int get planValidity => throw _privateConstructorUsedError;
  String get planValidityUnit => throw _privateConstructorUsedError;
  int get downloadSpeed => throw _privateConstructorUsedError;
  String get downloadSpeedUnit => throw _privateConstructorUsedError;
  int get uploadSpeed => throw _privateConstructorUsedError;
  String get uploadSpeedUnit => throw _privateConstructorUsedError;
  int get dataLimit => throw _privateConstructorUsedError;
  String get dataLimitUnit => throw _privateConstructorUsedError;
  int get downloadSpeedFUP => throw _privateConstructorUsedError;
  int get uploadSpeedFUP => throw _privateConstructorUsedError;
  String get downloadSpeedFUPUnit => throw _privateConstructorUsedError;
  String get uploadSpeedFUPUnit => throw _privateConstructorUsedError;
  int get dataLimitFUP => throw _privateConstructorUsedError;
  String get dataLimitFUPUnit => throw _privateConstructorUsedError;
  int get maxSessionTimeInsec => throw _privateConstructorUsedError;
  int get maxDataTransferInSession => throw _privateConstructorUsedError;
  int get maxSimultaneousUser => throw _privateConstructorUsedError;
  int get gracePeriodInDays => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreatePlanCopyWith<CreatePlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreatePlanCopyWith<$Res> {
  factory $CreatePlanCopyWith(
          CreatePlan value, $Res Function(CreatePlan) then) =
      _$CreatePlanCopyWithImpl<$Res, CreatePlan>;
  @useResult
  $Res call(
      {String planName,
      String planDescription,
      String planType,
      double planBasicCost,
      double planOfferedCost,
      double planEnteredCost,
      double taxAmount,
      int planValidity,
      String planValidityUnit,
      int downloadSpeed,
      String downloadSpeedUnit,
      int uploadSpeed,
      String uploadSpeedUnit,
      int dataLimit,
      String dataLimitUnit,
      int downloadSpeedFUP,
      int uploadSpeedFUP,
      String downloadSpeedFUPUnit,
      String uploadSpeedFUPUnit,
      int dataLimitFUP,
      String dataLimitFUPUnit,
      int maxSessionTimeInsec,
      int maxDataTransferInSession,
      int maxSimultaneousUser,
      int gracePeriodInDays});
}

/// @nodoc
class _$CreatePlanCopyWithImpl<$Res, $Val extends CreatePlan>
    implements $CreatePlanCopyWith<$Res> {
  _$CreatePlanCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planName = null,
    Object? planDescription = null,
    Object? planType = null,
    Object? planBasicCost = null,
    Object? planOfferedCost = null,
    Object? planEnteredCost = null,
    Object? taxAmount = null,
    Object? planValidity = null,
    Object? planValidityUnit = null,
    Object? downloadSpeed = null,
    Object? downloadSpeedUnit = null,
    Object? uploadSpeed = null,
    Object? uploadSpeedUnit = null,
    Object? dataLimit = null,
    Object? dataLimitUnit = null,
    Object? downloadSpeedFUP = null,
    Object? uploadSpeedFUP = null,
    Object? downloadSpeedFUPUnit = null,
    Object? uploadSpeedFUPUnit = null,
    Object? dataLimitFUP = null,
    Object? dataLimitFUPUnit = null,
    Object? maxSessionTimeInsec = null,
    Object? maxDataTransferInSession = null,
    Object? maxSimultaneousUser = null,
    Object? gracePeriodInDays = null,
  }) {
    return _then(_value.copyWith(
      planName: null == planName
          ? _value.planName
          : planName // ignore: cast_nullable_to_non_nullable
              as String,
      planDescription: null == planDescription
          ? _value.planDescription
          : planDescription // ignore: cast_nullable_to_non_nullable
              as String,
      planType: null == planType
          ? _value.planType
          : planType // ignore: cast_nullable_to_non_nullable
              as String,
      planBasicCost: null == planBasicCost
          ? _value.planBasicCost
          : planBasicCost // ignore: cast_nullable_to_non_nullable
              as double,
      planOfferedCost: null == planOfferedCost
          ? _value.planOfferedCost
          : planOfferedCost // ignore: cast_nullable_to_non_nullable
              as double,
      planEnteredCost: null == planEnteredCost
          ? _value.planEnteredCost
          : planEnteredCost // ignore: cast_nullable_to_non_nullable
              as double,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      planValidity: null == planValidity
          ? _value.planValidity
          : planValidity // ignore: cast_nullable_to_non_nullable
              as int,
      planValidityUnit: null == planValidityUnit
          ? _value.planValidityUnit
          : planValidityUnit // ignore: cast_nullable_to_non_nullable
              as String,
      downloadSpeed: null == downloadSpeed
          ? _value.downloadSpeed
          : downloadSpeed // ignore: cast_nullable_to_non_nullable
              as int,
      downloadSpeedUnit: null == downloadSpeedUnit
          ? _value.downloadSpeedUnit
          : downloadSpeedUnit // ignore: cast_nullable_to_non_nullable
              as String,
      uploadSpeed: null == uploadSpeed
          ? _value.uploadSpeed
          : uploadSpeed // ignore: cast_nullable_to_non_nullable
              as int,
      uploadSpeedUnit: null == uploadSpeedUnit
          ? _value.uploadSpeedUnit
          : uploadSpeedUnit // ignore: cast_nullable_to_non_nullable
              as String,
      dataLimit: null == dataLimit
          ? _value.dataLimit
          : dataLimit // ignore: cast_nullable_to_non_nullable
              as int,
      dataLimitUnit: null == dataLimitUnit
          ? _value.dataLimitUnit
          : dataLimitUnit // ignore: cast_nullable_to_non_nullable
              as String,
      downloadSpeedFUP: null == downloadSpeedFUP
          ? _value.downloadSpeedFUP
          : downloadSpeedFUP // ignore: cast_nullable_to_non_nullable
              as int,
      uploadSpeedFUP: null == uploadSpeedFUP
          ? _value.uploadSpeedFUP
          : uploadSpeedFUP // ignore: cast_nullable_to_non_nullable
              as int,
      downloadSpeedFUPUnit: null == downloadSpeedFUPUnit
          ? _value.downloadSpeedFUPUnit
          : downloadSpeedFUPUnit // ignore: cast_nullable_to_non_nullable
              as String,
      uploadSpeedFUPUnit: null == uploadSpeedFUPUnit
          ? _value.uploadSpeedFUPUnit
          : uploadSpeedFUPUnit // ignore: cast_nullable_to_non_nullable
              as String,
      dataLimitFUP: null == dataLimitFUP
          ? _value.dataLimitFUP
          : dataLimitFUP // ignore: cast_nullable_to_non_nullable
              as int,
      dataLimitFUPUnit: null == dataLimitFUPUnit
          ? _value.dataLimitFUPUnit
          : dataLimitFUPUnit // ignore: cast_nullable_to_non_nullable
              as String,
      maxSessionTimeInsec: null == maxSessionTimeInsec
          ? _value.maxSessionTimeInsec
          : maxSessionTimeInsec // ignore: cast_nullable_to_non_nullable
              as int,
      maxDataTransferInSession: null == maxDataTransferInSession
          ? _value.maxDataTransferInSession
          : maxDataTransferInSession // ignore: cast_nullable_to_non_nullable
              as int,
      maxSimultaneousUser: null == maxSimultaneousUser
          ? _value.maxSimultaneousUser
          : maxSimultaneousUser // ignore: cast_nullable_to_non_nullable
              as int,
      gracePeriodInDays: null == gracePeriodInDays
          ? _value.gracePeriodInDays
          : gracePeriodInDays // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreatePlanCopyWith<$Res>
    implements $CreatePlanCopyWith<$Res> {
  factory _$$_CreatePlanCopyWith(
          _$_CreatePlan value, $Res Function(_$_CreatePlan) then) =
      __$$_CreatePlanCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String planName,
      String planDescription,
      String planType,
      double planBasicCost,
      double planOfferedCost,
      double planEnteredCost,
      double taxAmount,
      int planValidity,
      String planValidityUnit,
      int downloadSpeed,
      String downloadSpeedUnit,
      int uploadSpeed,
      String uploadSpeedUnit,
      int dataLimit,
      String dataLimitUnit,
      int downloadSpeedFUP,
      int uploadSpeedFUP,
      String downloadSpeedFUPUnit,
      String uploadSpeedFUPUnit,
      int dataLimitFUP,
      String dataLimitFUPUnit,
      int maxSessionTimeInsec,
      int maxDataTransferInSession,
      int maxSimultaneousUser,
      int gracePeriodInDays});
}

/// @nodoc
class __$$_CreatePlanCopyWithImpl<$Res>
    extends _$CreatePlanCopyWithImpl<$Res, _$_CreatePlan>
    implements _$$_CreatePlanCopyWith<$Res> {
  __$$_CreatePlanCopyWithImpl(
      _$_CreatePlan _value, $Res Function(_$_CreatePlan) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planName = null,
    Object? planDescription = null,
    Object? planType = null,
    Object? planBasicCost = null,
    Object? planOfferedCost = null,
    Object? planEnteredCost = null,
    Object? taxAmount = null,
    Object? planValidity = null,
    Object? planValidityUnit = null,
    Object? downloadSpeed = null,
    Object? downloadSpeedUnit = null,
    Object? uploadSpeed = null,
    Object? uploadSpeedUnit = null,
    Object? dataLimit = null,
    Object? dataLimitUnit = null,
    Object? downloadSpeedFUP = null,
    Object? uploadSpeedFUP = null,
    Object? downloadSpeedFUPUnit = null,
    Object? uploadSpeedFUPUnit = null,
    Object? dataLimitFUP = null,
    Object? dataLimitFUPUnit = null,
    Object? maxSessionTimeInsec = null,
    Object? maxDataTransferInSession = null,
    Object? maxSimultaneousUser = null,
    Object? gracePeriodInDays = null,
  }) {
    return _then(_$_CreatePlan(
      null == planName
          ? _value.planName
          : planName // ignore: cast_nullable_to_non_nullable
              as String,
      null == planDescription
          ? _value.planDescription
          : planDescription // ignore: cast_nullable_to_non_nullable
              as String,
      null == planType
          ? _value.planType
          : planType // ignore: cast_nullable_to_non_nullable
              as String,
      null == planBasicCost
          ? _value.planBasicCost
          : planBasicCost // ignore: cast_nullable_to_non_nullable
              as double,
      null == planOfferedCost
          ? _value.planOfferedCost
          : planOfferedCost // ignore: cast_nullable_to_non_nullable
              as double,
      null == planEnteredCost
          ? _value.planEnteredCost
          : planEnteredCost // ignore: cast_nullable_to_non_nullable
              as double,
      null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
      null == planValidity
          ? _value.planValidity
          : planValidity // ignore: cast_nullable_to_non_nullable
              as int,
      null == planValidityUnit
          ? _value.planValidityUnit
          : planValidityUnit // ignore: cast_nullable_to_non_nullable
              as String,
      null == downloadSpeed
          ? _value.downloadSpeed
          : downloadSpeed // ignore: cast_nullable_to_non_nullable
              as int,
      null == downloadSpeedUnit
          ? _value.downloadSpeedUnit
          : downloadSpeedUnit // ignore: cast_nullable_to_non_nullable
              as String,
      null == uploadSpeed
          ? _value.uploadSpeed
          : uploadSpeed // ignore: cast_nullable_to_non_nullable
              as int,
      null == uploadSpeedUnit
          ? _value.uploadSpeedUnit
          : uploadSpeedUnit // ignore: cast_nullable_to_non_nullable
              as String,
      null == dataLimit
          ? _value.dataLimit
          : dataLimit // ignore: cast_nullable_to_non_nullable
              as int,
      null == dataLimitUnit
          ? _value.dataLimitUnit
          : dataLimitUnit // ignore: cast_nullable_to_non_nullable
              as String,
      null == downloadSpeedFUP
          ? _value.downloadSpeedFUP
          : downloadSpeedFUP // ignore: cast_nullable_to_non_nullable
              as int,
      null == uploadSpeedFUP
          ? _value.uploadSpeedFUP
          : uploadSpeedFUP // ignore: cast_nullable_to_non_nullable
              as int,
      null == downloadSpeedFUPUnit
          ? _value.downloadSpeedFUPUnit
          : downloadSpeedFUPUnit // ignore: cast_nullable_to_non_nullable
              as String,
      null == uploadSpeedFUPUnit
          ? _value.uploadSpeedFUPUnit
          : uploadSpeedFUPUnit // ignore: cast_nullable_to_non_nullable
              as String,
      null == dataLimitFUP
          ? _value.dataLimitFUP
          : dataLimitFUP // ignore: cast_nullable_to_non_nullable
              as int,
      null == dataLimitFUPUnit
          ? _value.dataLimitFUPUnit
          : dataLimitFUPUnit // ignore: cast_nullable_to_non_nullable
              as String,
      null == maxSessionTimeInsec
          ? _value.maxSessionTimeInsec
          : maxSessionTimeInsec // ignore: cast_nullable_to_non_nullable
              as int,
      null == maxDataTransferInSession
          ? _value.maxDataTransferInSession
          : maxDataTransferInSession // ignore: cast_nullable_to_non_nullable
              as int,
      null == maxSimultaneousUser
          ? _value.maxSimultaneousUser
          : maxSimultaneousUser // ignore: cast_nullable_to_non_nullable
              as int,
      null == gracePeriodInDays
          ? _value.gracePeriodInDays
          : gracePeriodInDays // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CreatePlan implements _CreatePlan {
  _$_CreatePlan(
      this.planName,
      this.planDescription,
      this.planType,
      this.planBasicCost,
      this.planOfferedCost,
      this.planEnteredCost,
      this.taxAmount,
      this.planValidity,
      this.planValidityUnit,
      this.downloadSpeed,
      this.downloadSpeedUnit,
      this.uploadSpeed,
      this.uploadSpeedUnit,
      this.dataLimit,
      this.dataLimitUnit,
      this.downloadSpeedFUP,
      this.uploadSpeedFUP,
      this.downloadSpeedFUPUnit,
      this.uploadSpeedFUPUnit,
      this.dataLimitFUP,
      this.dataLimitFUPUnit,
      this.maxSessionTimeInsec,
      this.maxDataTransferInSession,
      this.maxSimultaneousUser,
      this.gracePeriodInDays);

  @override
  final String planName;
  @override
  final String planDescription;
  @override
  final String planType;
  @override
  final double planBasicCost;
  @override
  final double planOfferedCost;
  @override
  final double planEnteredCost;
  @override
  final double taxAmount;
  @override
  final int planValidity;
  @override
  final String planValidityUnit;
  @override
  final int downloadSpeed;
  @override
  final String downloadSpeedUnit;
  @override
  final int uploadSpeed;
  @override
  final String uploadSpeedUnit;
  @override
  final int dataLimit;
  @override
  final String dataLimitUnit;
  @override
  final int downloadSpeedFUP;
  @override
  final int uploadSpeedFUP;
  @override
  final String downloadSpeedFUPUnit;
  @override
  final String uploadSpeedFUPUnit;
  @override
  final int dataLimitFUP;
  @override
  final String dataLimitFUPUnit;
  @override
  final int maxSessionTimeInsec;
  @override
  final int maxDataTransferInSession;
  @override
  final int maxSimultaneousUser;
  @override
  final int gracePeriodInDays;

  @override
  String toString() {
    return 'CreatePlan(planName: $planName, planDescription: $planDescription, planType: $planType, planBasicCost: $planBasicCost, planOfferedCost: $planOfferedCost, planEnteredCost: $planEnteredCost, taxAmount: $taxAmount, planValidity: $planValidity, planValidityUnit: $planValidityUnit, downloadSpeed: $downloadSpeed, downloadSpeedUnit: $downloadSpeedUnit, uploadSpeed: $uploadSpeed, uploadSpeedUnit: $uploadSpeedUnit, dataLimit: $dataLimit, dataLimitUnit: $dataLimitUnit, downloadSpeedFUP: $downloadSpeedFUP, uploadSpeedFUP: $uploadSpeedFUP, downloadSpeedFUPUnit: $downloadSpeedFUPUnit, uploadSpeedFUPUnit: $uploadSpeedFUPUnit, dataLimitFUP: $dataLimitFUP, dataLimitFUPUnit: $dataLimitFUPUnit, maxSessionTimeInsec: $maxSessionTimeInsec, maxDataTransferInSession: $maxDataTransferInSession, maxSimultaneousUser: $maxSimultaneousUser, gracePeriodInDays: $gracePeriodInDays)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreatePlan &&
            (identical(other.planName, planName) ||
                other.planName == planName) &&
            (identical(other.planDescription, planDescription) ||
                other.planDescription == planDescription) &&
            (identical(other.planType, planType) ||
                other.planType == planType) &&
            (identical(other.planBasicCost, planBasicCost) ||
                other.planBasicCost == planBasicCost) &&
            (identical(other.planOfferedCost, planOfferedCost) ||
                other.planOfferedCost == planOfferedCost) &&
            (identical(other.planEnteredCost, planEnteredCost) ||
                other.planEnteredCost == planEnteredCost) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount) &&
            (identical(other.planValidity, planValidity) ||
                other.planValidity == planValidity) &&
            (identical(other.planValidityUnit, planValidityUnit) ||
                other.planValidityUnit == planValidityUnit) &&
            (identical(other.downloadSpeed, downloadSpeed) ||
                other.downloadSpeed == downloadSpeed) &&
            (identical(other.downloadSpeedUnit, downloadSpeedUnit) ||
                other.downloadSpeedUnit == downloadSpeedUnit) &&
            (identical(other.uploadSpeed, uploadSpeed) ||
                other.uploadSpeed == uploadSpeed) &&
            (identical(other.uploadSpeedUnit, uploadSpeedUnit) ||
                other.uploadSpeedUnit == uploadSpeedUnit) &&
            (identical(other.dataLimit, dataLimit) ||
                other.dataLimit == dataLimit) &&
            (identical(other.dataLimitUnit, dataLimitUnit) ||
                other.dataLimitUnit == dataLimitUnit) &&
            (identical(other.downloadSpeedFUP, downloadSpeedFUP) ||
                other.downloadSpeedFUP == downloadSpeedFUP) &&
            (identical(other.uploadSpeedFUP, uploadSpeedFUP) ||
                other.uploadSpeedFUP == uploadSpeedFUP) &&
            (identical(other.downloadSpeedFUPUnit, downloadSpeedFUPUnit) ||
                other.downloadSpeedFUPUnit == downloadSpeedFUPUnit) &&
            (identical(other.uploadSpeedFUPUnit, uploadSpeedFUPUnit) ||
                other.uploadSpeedFUPUnit == uploadSpeedFUPUnit) &&
            (identical(other.dataLimitFUP, dataLimitFUP) ||
                other.dataLimitFUP == dataLimitFUP) &&
            (identical(other.dataLimitFUPUnit, dataLimitFUPUnit) ||
                other.dataLimitFUPUnit == dataLimitFUPUnit) &&
            (identical(other.maxSessionTimeInsec, maxSessionTimeInsec) ||
                other.maxSessionTimeInsec == maxSessionTimeInsec) &&
            (identical(
                    other.maxDataTransferInSession, maxDataTransferInSession) ||
                other.maxDataTransferInSession == maxDataTransferInSession) &&
            (identical(other.maxSimultaneousUser, maxSimultaneousUser) ||
                other.maxSimultaneousUser == maxSimultaneousUser) &&
            (identical(other.gracePeriodInDays, gracePeriodInDays) ||
                other.gracePeriodInDays == gracePeriodInDays));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        planName,
        planDescription,
        planType,
        planBasicCost,
        planOfferedCost,
        planEnteredCost,
        taxAmount,
        planValidity,
        planValidityUnit,
        downloadSpeed,
        downloadSpeedUnit,
        uploadSpeed,
        uploadSpeedUnit,
        dataLimit,
        dataLimitUnit,
        downloadSpeedFUP,
        uploadSpeedFUP,
        downloadSpeedFUPUnit,
        uploadSpeedFUPUnit,
        dataLimitFUP,
        dataLimitFUPUnit,
        maxSessionTimeInsec,
        maxDataTransferInSession,
        maxSimultaneousUser,
        gracePeriodInDays
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreatePlanCopyWith<_$_CreatePlan> get copyWith =>
      __$$_CreatePlanCopyWithImpl<_$_CreatePlan>(this, _$identity);
}

abstract class _CreatePlan implements CreatePlan {
  factory _CreatePlan(
      final String planName,
      final String planDescription,
      final String planType,
      final double planBasicCost,
      final double planOfferedCost,
      final double planEnteredCost,
      final double taxAmount,
      final int planValidity,
      final String planValidityUnit,
      final int downloadSpeed,
      final String downloadSpeedUnit,
      final int uploadSpeed,
      final String uploadSpeedUnit,
      final int dataLimit,
      final String dataLimitUnit,
      final int downloadSpeedFUP,
      final int uploadSpeedFUP,
      final String downloadSpeedFUPUnit,
      final String uploadSpeedFUPUnit,
      final int dataLimitFUP,
      final String dataLimitFUPUnit,
      final int maxSessionTimeInsec,
      final int maxDataTransferInSession,
      final int maxSimultaneousUser,
      final int gracePeriodInDays) = _$_CreatePlan;

  @override
  String get planName;
  @override
  String get planDescription;
  @override
  String get planType;
  @override
  double get planBasicCost;
  @override
  double get planOfferedCost;
  @override
  double get planEnteredCost;
  @override
  double get taxAmount;
  @override
  int get planValidity;
  @override
  String get planValidityUnit;
  @override
  int get downloadSpeed;
  @override
  String get downloadSpeedUnit;
  @override
  int get uploadSpeed;
  @override
  String get uploadSpeedUnit;
  @override
  int get dataLimit;
  @override
  String get dataLimitUnit;
  @override
  int get downloadSpeedFUP;
  @override
  int get uploadSpeedFUP;
  @override
  String get downloadSpeedFUPUnit;
  @override
  String get uploadSpeedFUPUnit;
  @override
  int get dataLimitFUP;
  @override
  String get dataLimitFUPUnit;
  @override
  int get maxSessionTimeInsec;
  @override
  int get maxDataTransferInSession;
  @override
  int get maxSimultaneousUser;
  @override
  int get gracePeriodInDays;
  @override
  @JsonKey(ignore: true)
  _$$_CreatePlanCopyWith<_$_CreatePlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateResellerPriceChart {
  String get planName => throw _privateConstructorUsedError;
  String get resellerUserName => throw _privateConstructorUsedError;
  double get planBasicCost => throw _privateConstructorUsedError;
  double get planOfferedCost => throw _privateConstructorUsedError;
  double get planEnteredCost => throw _privateConstructorUsedError;
  double get taxAmount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateResellerPriceChartCopyWith<CreateResellerPriceChart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateResellerPriceChartCopyWith<$Res> {
  factory $CreateResellerPriceChartCopyWith(CreateResellerPriceChart value,
          $Res Function(CreateResellerPriceChart) then) =
      _$CreateResellerPriceChartCopyWithImpl<$Res, CreateResellerPriceChart>;
  @useResult
  $Res call(
      {String planName,
      String resellerUserName,
      double planBasicCost,
      double planOfferedCost,
      double planEnteredCost,
      double taxAmount});
}

/// @nodoc
class _$CreateResellerPriceChartCopyWithImpl<$Res,
        $Val extends CreateResellerPriceChart>
    implements $CreateResellerPriceChartCopyWith<$Res> {
  _$CreateResellerPriceChartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planName = null,
    Object? resellerUserName = null,
    Object? planBasicCost = null,
    Object? planOfferedCost = null,
    Object? planEnteredCost = null,
    Object? taxAmount = null,
  }) {
    return _then(_value.copyWith(
      planName: null == planName
          ? _value.planName
          : planName // ignore: cast_nullable_to_non_nullable
              as String,
      resellerUserName: null == resellerUserName
          ? _value.resellerUserName
          : resellerUserName // ignore: cast_nullable_to_non_nullable
              as String,
      planBasicCost: null == planBasicCost
          ? _value.planBasicCost
          : planBasicCost // ignore: cast_nullable_to_non_nullable
              as double,
      planOfferedCost: null == planOfferedCost
          ? _value.planOfferedCost
          : planOfferedCost // ignore: cast_nullable_to_non_nullable
              as double,
      planEnteredCost: null == planEnteredCost
          ? _value.planEnteredCost
          : planEnteredCost // ignore: cast_nullable_to_non_nullable
              as double,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateResellerPriceChartCopyWith<$Res>
    implements $CreateResellerPriceChartCopyWith<$Res> {
  factory _$$_CreateResellerPriceChartCopyWith(
          _$_CreateResellerPriceChart value,
          $Res Function(_$_CreateResellerPriceChart) then) =
      __$$_CreateResellerPriceChartCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String planName,
      String resellerUserName,
      double planBasicCost,
      double planOfferedCost,
      double planEnteredCost,
      double taxAmount});
}

/// @nodoc
class __$$_CreateResellerPriceChartCopyWithImpl<$Res>
    extends _$CreateResellerPriceChartCopyWithImpl<$Res,
        _$_CreateResellerPriceChart>
    implements _$$_CreateResellerPriceChartCopyWith<$Res> {
  __$$_CreateResellerPriceChartCopyWithImpl(_$_CreateResellerPriceChart _value,
      $Res Function(_$_CreateResellerPriceChart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planName = null,
    Object? resellerUserName = null,
    Object? planBasicCost = null,
    Object? planOfferedCost = null,
    Object? planEnteredCost = null,
    Object? taxAmount = null,
  }) {
    return _then(_$_CreateResellerPriceChart(
      null == planName
          ? _value.planName
          : planName // ignore: cast_nullable_to_non_nullable
              as String,
      null == resellerUserName
          ? _value.resellerUserName
          : resellerUserName // ignore: cast_nullable_to_non_nullable
              as String,
      null == planBasicCost
          ? _value.planBasicCost
          : planBasicCost // ignore: cast_nullable_to_non_nullable
              as double,
      null == planOfferedCost
          ? _value.planOfferedCost
          : planOfferedCost // ignore: cast_nullable_to_non_nullable
              as double,
      null == planEnteredCost
          ? _value.planEnteredCost
          : planEnteredCost // ignore: cast_nullable_to_non_nullable
              as double,
      null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_CreateResellerPriceChart implements _CreateResellerPriceChart {
  _$_CreateResellerPriceChart(
      this.planName,
      this.resellerUserName,
      this.planBasicCost,
      this.planOfferedCost,
      this.planEnteredCost,
      this.taxAmount);

  @override
  final String planName;
  @override
  final String resellerUserName;
  @override
  final double planBasicCost;
  @override
  final double planOfferedCost;
  @override
  final double planEnteredCost;
  @override
  final double taxAmount;

  @override
  String toString() {
    return 'CreateResellerPriceChart(planName: $planName, resellerUserName: $resellerUserName, planBasicCost: $planBasicCost, planOfferedCost: $planOfferedCost, planEnteredCost: $planEnteredCost, taxAmount: $taxAmount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateResellerPriceChart &&
            (identical(other.planName, planName) ||
                other.planName == planName) &&
            (identical(other.resellerUserName, resellerUserName) ||
                other.resellerUserName == resellerUserName) &&
            (identical(other.planBasicCost, planBasicCost) ||
                other.planBasicCost == planBasicCost) &&
            (identical(other.planOfferedCost, planOfferedCost) ||
                other.planOfferedCost == planOfferedCost) &&
            (identical(other.planEnteredCost, planEnteredCost) ||
                other.planEnteredCost == planEnteredCost) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount));
  }

  @override
  int get hashCode => Object.hash(runtimeType, planName, resellerUserName,
      planBasicCost, planOfferedCost, planEnteredCost, taxAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateResellerPriceChartCopyWith<_$_CreateResellerPriceChart>
      get copyWith => __$$_CreateResellerPriceChartCopyWithImpl<
          _$_CreateResellerPriceChart>(this, _$identity);
}

abstract class _CreateResellerPriceChart implements CreateResellerPriceChart {
  factory _CreateResellerPriceChart(
      final String planName,
      final String resellerUserName,
      final double planBasicCost,
      final double planOfferedCost,
      final double planEnteredCost,
      final double taxAmount) = _$_CreateResellerPriceChart;

  @override
  String get planName;
  @override
  String get resellerUserName;
  @override
  double get planBasicCost;
  @override
  double get planOfferedCost;
  @override
  double get planEnteredCost;
  @override
  double get taxAmount;
  @override
  @JsonKey(ignore: true)
  _$$_CreateResellerPriceChartCopyWith<_$_CreateResellerPriceChart>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateOperatorPriceChart {
  String get planName => throw _privateConstructorUsedError;
  String get operatorUserName => throw _privateConstructorUsedError;
  String get resellerUserName => throw _privateConstructorUsedError;
  double get planBasicCost => throw _privateConstructorUsedError;
  double get planOfferedCost => throw _privateConstructorUsedError;
  double get planEnteredCost => throw _privateConstructorUsedError;
  double get taxAmount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateOperatorPriceChartCopyWith<CreateOperatorPriceChart> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateOperatorPriceChartCopyWith<$Res> {
  factory $CreateOperatorPriceChartCopyWith(CreateOperatorPriceChart value,
          $Res Function(CreateOperatorPriceChart) then) =
      _$CreateOperatorPriceChartCopyWithImpl<$Res, CreateOperatorPriceChart>;
  @useResult
  $Res call(
      {String planName,
      String operatorUserName,
      String resellerUserName,
      double planBasicCost,
      double planOfferedCost,
      double planEnteredCost,
      double taxAmount});
}

/// @nodoc
class _$CreateOperatorPriceChartCopyWithImpl<$Res,
        $Val extends CreateOperatorPriceChart>
    implements $CreateOperatorPriceChartCopyWith<$Res> {
  _$CreateOperatorPriceChartCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planName = null,
    Object? operatorUserName = null,
    Object? resellerUserName = null,
    Object? planBasicCost = null,
    Object? planOfferedCost = null,
    Object? planEnteredCost = null,
    Object? taxAmount = null,
  }) {
    return _then(_value.copyWith(
      planName: null == planName
          ? _value.planName
          : planName // ignore: cast_nullable_to_non_nullable
              as String,
      operatorUserName: null == operatorUserName
          ? _value.operatorUserName
          : operatorUserName // ignore: cast_nullable_to_non_nullable
              as String,
      resellerUserName: null == resellerUserName
          ? _value.resellerUserName
          : resellerUserName // ignore: cast_nullable_to_non_nullable
              as String,
      planBasicCost: null == planBasicCost
          ? _value.planBasicCost
          : planBasicCost // ignore: cast_nullable_to_non_nullable
              as double,
      planOfferedCost: null == planOfferedCost
          ? _value.planOfferedCost
          : planOfferedCost // ignore: cast_nullable_to_non_nullable
              as double,
      planEnteredCost: null == planEnteredCost
          ? _value.planEnteredCost
          : planEnteredCost // ignore: cast_nullable_to_non_nullable
              as double,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateOperatorPriceChartCopyWith<$Res>
    implements $CreateOperatorPriceChartCopyWith<$Res> {
  factory _$$_CreateOperatorPriceChartCopyWith(
          _$_CreateOperatorPriceChart value,
          $Res Function(_$_CreateOperatorPriceChart) then) =
      __$$_CreateOperatorPriceChartCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String planName,
      String operatorUserName,
      String resellerUserName,
      double planBasicCost,
      double planOfferedCost,
      double planEnteredCost,
      double taxAmount});
}

/// @nodoc
class __$$_CreateOperatorPriceChartCopyWithImpl<$Res>
    extends _$CreateOperatorPriceChartCopyWithImpl<$Res,
        _$_CreateOperatorPriceChart>
    implements _$$_CreateOperatorPriceChartCopyWith<$Res> {
  __$$_CreateOperatorPriceChartCopyWithImpl(_$_CreateOperatorPriceChart _value,
      $Res Function(_$_CreateOperatorPriceChart) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? planName = null,
    Object? operatorUserName = null,
    Object? resellerUserName = null,
    Object? planBasicCost = null,
    Object? planOfferedCost = null,
    Object? planEnteredCost = null,
    Object? taxAmount = null,
  }) {
    return _then(_$_CreateOperatorPriceChart(
      null == planName
          ? _value.planName
          : planName // ignore: cast_nullable_to_non_nullable
              as String,
      null == operatorUserName
          ? _value.operatorUserName
          : operatorUserName // ignore: cast_nullable_to_non_nullable
              as String,
      null == resellerUserName
          ? _value.resellerUserName
          : resellerUserName // ignore: cast_nullable_to_non_nullable
              as String,
      null == planBasicCost
          ? _value.planBasicCost
          : planBasicCost // ignore: cast_nullable_to_non_nullable
              as double,
      null == planOfferedCost
          ? _value.planOfferedCost
          : planOfferedCost // ignore: cast_nullable_to_non_nullable
              as double,
      null == planEnteredCost
          ? _value.planEnteredCost
          : planEnteredCost // ignore: cast_nullable_to_non_nullable
              as double,
      null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_CreateOperatorPriceChart implements _CreateOperatorPriceChart {
  _$_CreateOperatorPriceChart(
      this.planName,
      this.operatorUserName,
      this.resellerUserName,
      this.planBasicCost,
      this.planOfferedCost,
      this.planEnteredCost,
      this.taxAmount);

  @override
  final String planName;
  @override
  final String operatorUserName;
  @override
  final String resellerUserName;
  @override
  final double planBasicCost;
  @override
  final double planOfferedCost;
  @override
  final double planEnteredCost;
  @override
  final double taxAmount;

  @override
  String toString() {
    return 'CreateOperatorPriceChart(planName: $planName, operatorUserName: $operatorUserName, resellerUserName: $resellerUserName, planBasicCost: $planBasicCost, planOfferedCost: $planOfferedCost, planEnteredCost: $planEnteredCost, taxAmount: $taxAmount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateOperatorPriceChart &&
            (identical(other.planName, planName) ||
                other.planName == planName) &&
            (identical(other.operatorUserName, operatorUserName) ||
                other.operatorUserName == operatorUserName) &&
            (identical(other.resellerUserName, resellerUserName) ||
                other.resellerUserName == resellerUserName) &&
            (identical(other.planBasicCost, planBasicCost) ||
                other.planBasicCost == planBasicCost) &&
            (identical(other.planOfferedCost, planOfferedCost) ||
                other.planOfferedCost == planOfferedCost) &&
            (identical(other.planEnteredCost, planEnteredCost) ||
                other.planEnteredCost == planEnteredCost) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      planName,
      operatorUserName,
      resellerUserName,
      planBasicCost,
      planOfferedCost,
      planEnteredCost,
      taxAmount);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateOperatorPriceChartCopyWith<_$_CreateOperatorPriceChart>
      get copyWith => __$$_CreateOperatorPriceChartCopyWithImpl<
          _$_CreateOperatorPriceChart>(this, _$identity);
}

abstract class _CreateOperatorPriceChart implements CreateOperatorPriceChart {
  factory _CreateOperatorPriceChart(
      final String planName,
      final String operatorUserName,
      final String resellerUserName,
      final double planBasicCost,
      final double planOfferedCost,
      final double planEnteredCost,
      final double taxAmount) = _$_CreateOperatorPriceChart;

  @override
  String get planName;
  @override
  String get operatorUserName;
  @override
  String get resellerUserName;
  @override
  double get planBasicCost;
  @override
  double get planOfferedCost;
  @override
  double get planEnteredCost;
  @override
  double get taxAmount;
  @override
  @JsonKey(ignore: true)
  _$$_CreateOperatorPriceChartCopyWith<_$_CreateOperatorPriceChart>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateNewSubscriber {
  String get firstName => throw _privateConstructorUsedError;
  String get lastName => throw _privateConstructorUsedError;
  String get email => throw _privateConstructorUsedError;
  String get userName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get countryCode => throw _privateConstructorUsedError;
  String get mobileNumber => throw _privateConstructorUsedError;
  String get gstNumber => throw _privateConstructorUsedError;
  String get companyName => throw _privateConstructorUsedError;
  String get brandName => throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get pincode => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  String get billingCountry => throw _privateConstructorUsedError;
  String get billingAddress => throw _privateConstructorUsedError;
  String get billingPincode => throw _privateConstructorUsedError;
  String get billingCity => throw _privateConstructorUsedError;
  String get billingState => throw _privateConstructorUsedError;
  String get resellerUserName => throw _privateConstructorUsedError;
  String get operatorUserName => throw _privateConstructorUsedError;
  bool get isSameAsPermanentAddress => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateNewSubscriberCopyWith<CreateNewSubscriber> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateNewSubscriberCopyWith<$Res> {
  factory $CreateNewSubscriberCopyWith(
          CreateNewSubscriber value, $Res Function(CreateNewSubscriber) then) =
      _$CreateNewSubscriberCopyWithImpl<$Res, CreateNewSubscriber>;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String email,
      String userName,
      String password,
      String countryCode,
      String mobileNumber,
      String gstNumber,
      String companyName,
      String brandName,
      String country,
      String address,
      String pincode,
      String city,
      String state,
      String billingCountry,
      String billingAddress,
      String billingPincode,
      String billingCity,
      String billingState,
      String resellerUserName,
      String operatorUserName,
      bool isSameAsPermanentAddress});
}

/// @nodoc
class _$CreateNewSubscriberCopyWithImpl<$Res, $Val extends CreateNewSubscriber>
    implements $CreateNewSubscriberCopyWith<$Res> {
  _$CreateNewSubscriberCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? userName = null,
    Object? password = null,
    Object? countryCode = null,
    Object? mobileNumber = null,
    Object? gstNumber = null,
    Object? companyName = null,
    Object? brandName = null,
    Object? country = null,
    Object? address = null,
    Object? pincode = null,
    Object? city = null,
    Object? state = null,
    Object? billingCountry = null,
    Object? billingAddress = null,
    Object? billingPincode = null,
    Object? billingCity = null,
    Object? billingState = null,
    Object? resellerUserName = null,
    Object? operatorUserName = null,
    Object? isSameAsPermanentAddress = null,
  }) {
    return _then(_value.copyWith(
      firstName: null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      gstNumber: null == gstNumber
          ? _value.gstNumber
          : gstNumber // ignore: cast_nullable_to_non_nullable
              as String,
      companyName: null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      brandName: null == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      billingCountry: null == billingCountry
          ? _value.billingCountry
          : billingCountry // ignore: cast_nullable_to_non_nullable
              as String,
      billingAddress: null == billingAddress
          ? _value.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as String,
      billingPincode: null == billingPincode
          ? _value.billingPincode
          : billingPincode // ignore: cast_nullable_to_non_nullable
              as String,
      billingCity: null == billingCity
          ? _value.billingCity
          : billingCity // ignore: cast_nullable_to_non_nullable
              as String,
      billingState: null == billingState
          ? _value.billingState
          : billingState // ignore: cast_nullable_to_non_nullable
              as String,
      resellerUserName: null == resellerUserName
          ? _value.resellerUserName
          : resellerUserName // ignore: cast_nullable_to_non_nullable
              as String,
      operatorUserName: null == operatorUserName
          ? _value.operatorUserName
          : operatorUserName // ignore: cast_nullable_to_non_nullable
              as String,
      isSameAsPermanentAddress: null == isSameAsPermanentAddress
          ? _value.isSameAsPermanentAddress
          : isSameAsPermanentAddress // ignore: cast_nullable_to_non_nullable
              as bool,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateNewSubscriberCopyWith<$Res>
    implements $CreateNewSubscriberCopyWith<$Res> {
  factory _$$_CreateNewSubscriberCopyWith(_$_CreateNewSubscriber value,
          $Res Function(_$_CreateNewSubscriber) then) =
      __$$_CreateNewSubscriberCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String email,
      String userName,
      String password,
      String countryCode,
      String mobileNumber,
      String gstNumber,
      String companyName,
      String brandName,
      String country,
      String address,
      String pincode,
      String city,
      String state,
      String billingCountry,
      String billingAddress,
      String billingPincode,
      String billingCity,
      String billingState,
      String resellerUserName,
      String operatorUserName,
      bool isSameAsPermanentAddress});
}

/// @nodoc
class __$$_CreateNewSubscriberCopyWithImpl<$Res>
    extends _$CreateNewSubscriberCopyWithImpl<$Res, _$_CreateNewSubscriber>
    implements _$$_CreateNewSubscriberCopyWith<$Res> {
  __$$_CreateNewSubscriberCopyWithImpl(_$_CreateNewSubscriber _value,
      $Res Function(_$_CreateNewSubscriber) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? userName = null,
    Object? password = null,
    Object? countryCode = null,
    Object? mobileNumber = null,
    Object? gstNumber = null,
    Object? companyName = null,
    Object? brandName = null,
    Object? country = null,
    Object? address = null,
    Object? pincode = null,
    Object? city = null,
    Object? state = null,
    Object? billingCountry = null,
    Object? billingAddress = null,
    Object? billingPincode = null,
    Object? billingCity = null,
    Object? billingState = null,
    Object? resellerUserName = null,
    Object? operatorUserName = null,
    Object? isSameAsPermanentAddress = null,
  }) {
    return _then(_$_CreateNewSubscriber(
      null == firstName
          ? _value.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      null == lastName
          ? _value.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      null == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == countryCode
          ? _value.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      null == mobileNumber
          ? _value.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == gstNumber
          ? _value.gstNumber
          : gstNumber // ignore: cast_nullable_to_non_nullable
              as String,
      null == companyName
          ? _value.companyName
          : companyName // ignore: cast_nullable_to_non_nullable
              as String,
      null == brandName
          ? _value.brandName
          : brandName // ignore: cast_nullable_to_non_nullable
              as String,
      null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String,
      null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      null == billingCountry
          ? _value.billingCountry
          : billingCountry // ignore: cast_nullable_to_non_nullable
              as String,
      null == billingAddress
          ? _value.billingAddress
          : billingAddress // ignore: cast_nullable_to_non_nullable
              as String,
      null == billingPincode
          ? _value.billingPincode
          : billingPincode // ignore: cast_nullable_to_non_nullable
              as String,
      null == billingCity
          ? _value.billingCity
          : billingCity // ignore: cast_nullable_to_non_nullable
              as String,
      null == billingState
          ? _value.billingState
          : billingState // ignore: cast_nullable_to_non_nullable
              as String,
      null == resellerUserName
          ? _value.resellerUserName
          : resellerUserName // ignore: cast_nullable_to_non_nullable
              as String,
      null == operatorUserName
          ? _value.operatorUserName
          : operatorUserName // ignore: cast_nullable_to_non_nullable
              as String,
      null == isSameAsPermanentAddress
          ? _value.isSameAsPermanentAddress
          : isSameAsPermanentAddress // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _$_CreateNewSubscriber implements _CreateNewSubscriber {
  _$_CreateNewSubscriber(
      this.firstName,
      this.lastName,
      this.email,
      this.userName,
      this.password,
      this.countryCode,
      this.mobileNumber,
      this.gstNumber,
      this.companyName,
      this.brandName,
      this.country,
      this.address,
      this.pincode,
      this.city,
      this.state,
      this.billingCountry,
      this.billingAddress,
      this.billingPincode,
      this.billingCity,
      this.billingState,
      this.resellerUserName,
      this.operatorUserName,
      this.isSameAsPermanentAddress);

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String userName;
  @override
  final String password;
  @override
  final String countryCode;
  @override
  final String mobileNumber;
  @override
  final String gstNumber;
  @override
  final String companyName;
  @override
  final String brandName;
  @override
  final String country;
  @override
  final String address;
  @override
  final String pincode;
  @override
  final String city;
  @override
  final String state;
  @override
  final String billingCountry;
  @override
  final String billingAddress;
  @override
  final String billingPincode;
  @override
  final String billingCity;
  @override
  final String billingState;
  @override
  final String resellerUserName;
  @override
  final String operatorUserName;
  @override
  final bool isSameAsPermanentAddress;

  @override
  String toString() {
    return 'CreateNewSubscriber(firstName: $firstName, lastName: $lastName, email: $email, userName: $userName, password: $password, countryCode: $countryCode, mobileNumber: $mobileNumber, gstNumber: $gstNumber, companyName: $companyName, brandName: $brandName, country: $country, address: $address, pincode: $pincode, city: $city, state: $state, billingCountry: $billingCountry, billingAddress: $billingAddress, billingPincode: $billingPincode, billingCity: $billingCity, billingState: $billingState, resellerUserName: $resellerUserName, operatorUserName: $operatorUserName, isSameAsPermanentAddress: $isSameAsPermanentAddress)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateNewSubscriber &&
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.gstNumber, gstNumber) ||
                other.gstNumber == gstNumber) &&
            (identical(other.companyName, companyName) ||
                other.companyName == companyName) &&
            (identical(other.brandName, brandName) ||
                other.brandName == brandName) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.billingCountry, billingCountry) ||
                other.billingCountry == billingCountry) &&
            (identical(other.billingAddress, billingAddress) ||
                other.billingAddress == billingAddress) &&
            (identical(other.billingPincode, billingPincode) ||
                other.billingPincode == billingPincode) &&
            (identical(other.billingCity, billingCity) ||
                other.billingCity == billingCity) &&
            (identical(other.billingState, billingState) ||
                other.billingState == billingState) &&
            (identical(other.resellerUserName, resellerUserName) ||
                other.resellerUserName == resellerUserName) &&
            (identical(other.operatorUserName, operatorUserName) ||
                other.operatorUserName == operatorUserName) &&
            (identical(
                    other.isSameAsPermanentAddress, isSameAsPermanentAddress) ||
                other.isSameAsPermanentAddress == isSameAsPermanentAddress));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        firstName,
        lastName,
        email,
        userName,
        password,
        countryCode,
        mobileNumber,
        gstNumber,
        companyName,
        brandName,
        country,
        address,
        pincode,
        city,
        state,
        billingCountry,
        billingAddress,
        billingPincode,
        billingCity,
        billingState,
        resellerUserName,
        operatorUserName,
        isSameAsPermanentAddress
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateNewSubscriberCopyWith<_$_CreateNewSubscriber> get copyWith =>
      __$$_CreateNewSubscriberCopyWithImpl<_$_CreateNewSubscriber>(
          this, _$identity);
}

abstract class _CreateNewSubscriber implements CreateNewSubscriber {
  factory _CreateNewSubscriber(
      final String firstName,
      final String lastName,
      final String email,
      final String userName,
      final String password,
      final String countryCode,
      final String mobileNumber,
      final String gstNumber,
      final String companyName,
      final String brandName,
      final String country,
      final String address,
      final String pincode,
      final String city,
      final String state,
      final String billingCountry,
      final String billingAddress,
      final String billingPincode,
      final String billingCity,
      final String billingState,
      final String resellerUserName,
      final String operatorUserName,
      final bool isSameAsPermanentAddress) = _$_CreateNewSubscriber;

  @override
  String get firstName;
  @override
  String get lastName;
  @override
  String get email;
  @override
  String get userName;
  @override
  String get password;
  @override
  String get countryCode;
  @override
  String get mobileNumber;
  @override
  String get gstNumber;
  @override
  String get companyName;
  @override
  String get brandName;
  @override
  String get country;
  @override
  String get address;
  @override
  String get pincode;
  @override
  String get city;
  @override
  String get state;
  @override
  String get billingCountry;
  @override
  String get billingAddress;
  @override
  String get billingPincode;
  @override
  String get billingCity;
  @override
  String get billingState;
  @override
  String get resellerUserName;
  @override
  String get operatorUserName;
  @override
  bool get isSameAsPermanentAddress;
  @override
  @JsonKey(ignore: true)
  _$$_CreateNewSubscriberCopyWith<_$_CreateNewSubscriber> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateNewSubscription {
  String get userName => throw _privateConstructorUsedError;
  String get password => throw _privateConstructorUsedError;
  String get resellerUserName => throw _privateConstructorUsedError;
  String get operatorUserName => throw _privateConstructorUsedError;
  String get subscriberId => throw _privateConstructorUsedError;
  String get planName => throw _privateConstructorUsedError;
  String get networkType => throw _privateConstructorUsedError;
  String get ipType => throw _privateConstructorUsedError;
  String get assignedIp => throw _privateConstructorUsedError;
  bool get isInstallationAddressSameAsBilling =>
      throw _privateConstructorUsedError;
  bool get isInstallationAddressSameAsPermanent =>
      throw _privateConstructorUsedError;
  String get country => throw _privateConstructorUsedError;
  String get address => throw _privateConstructorUsedError;
  String get pincode => throw _privateConstructorUsedError;
  String get city => throw _privateConstructorUsedError;
  String get state => throw _privateConstructorUsedError;
  double get planBasicCost => throw _privateConstructorUsedError;
  double get planOfferedCost => throw _privateConstructorUsedError;
  double get planEnteredCost => throw _privateConstructorUsedError;
  double get taxAmount => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateNewSubscriptionCopyWith<CreateNewSubscription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateNewSubscriptionCopyWith<$Res> {
  factory $CreateNewSubscriptionCopyWith(CreateNewSubscription value,
          $Res Function(CreateNewSubscription) then) =
      _$CreateNewSubscriptionCopyWithImpl<$Res, CreateNewSubscription>;
  @useResult
  $Res call(
      {String userName,
      String password,
      String resellerUserName,
      String operatorUserName,
      String subscriberId,
      String planName,
      String networkType,
      String ipType,
      String assignedIp,
      bool isInstallationAddressSameAsBilling,
      bool isInstallationAddressSameAsPermanent,
      String country,
      String address,
      String pincode,
      String city,
      String state,
      double planBasicCost,
      double planOfferedCost,
      double planEnteredCost,
      double taxAmount});
}

/// @nodoc
class _$CreateNewSubscriptionCopyWithImpl<$Res,
        $Val extends CreateNewSubscription>
    implements $CreateNewSubscriptionCopyWith<$Res> {
  _$CreateNewSubscriptionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? password = null,
    Object? resellerUserName = null,
    Object? operatorUserName = null,
    Object? subscriberId = null,
    Object? planName = null,
    Object? networkType = null,
    Object? ipType = null,
    Object? assignedIp = null,
    Object? isInstallationAddressSameAsBilling = null,
    Object? isInstallationAddressSameAsPermanent = null,
    Object? country = null,
    Object? address = null,
    Object? pincode = null,
    Object? city = null,
    Object? state = null,
    Object? planBasicCost = null,
    Object? planOfferedCost = null,
    Object? planEnteredCost = null,
    Object? taxAmount = null,
  }) {
    return _then(_value.copyWith(
      userName: null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      resellerUserName: null == resellerUserName
          ? _value.resellerUserName
          : resellerUserName // ignore: cast_nullable_to_non_nullable
              as String,
      operatorUserName: null == operatorUserName
          ? _value.operatorUserName
          : operatorUserName // ignore: cast_nullable_to_non_nullable
              as String,
      subscriberId: null == subscriberId
          ? _value.subscriberId
          : subscriberId // ignore: cast_nullable_to_non_nullable
              as String,
      planName: null == planName
          ? _value.planName
          : planName // ignore: cast_nullable_to_non_nullable
              as String,
      networkType: null == networkType
          ? _value.networkType
          : networkType // ignore: cast_nullable_to_non_nullable
              as String,
      ipType: null == ipType
          ? _value.ipType
          : ipType // ignore: cast_nullable_to_non_nullable
              as String,
      assignedIp: null == assignedIp
          ? _value.assignedIp
          : assignedIp // ignore: cast_nullable_to_non_nullable
              as String,
      isInstallationAddressSameAsBilling: null ==
              isInstallationAddressSameAsBilling
          ? _value.isInstallationAddressSameAsBilling
          : isInstallationAddressSameAsBilling // ignore: cast_nullable_to_non_nullable
              as bool,
      isInstallationAddressSameAsPermanent: null ==
              isInstallationAddressSameAsPermanent
          ? _value.isInstallationAddressSameAsPermanent
          : isInstallationAddressSameAsPermanent // ignore: cast_nullable_to_non_nullable
              as bool,
      country: null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      address: null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      pincode: null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String,
      city: null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      state: null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      planBasicCost: null == planBasicCost
          ? _value.planBasicCost
          : planBasicCost // ignore: cast_nullable_to_non_nullable
              as double,
      planOfferedCost: null == planOfferedCost
          ? _value.planOfferedCost
          : planOfferedCost // ignore: cast_nullable_to_non_nullable
              as double,
      planEnteredCost: null == planEnteredCost
          ? _value.planEnteredCost
          : planEnteredCost // ignore: cast_nullable_to_non_nullable
              as double,
      taxAmount: null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateNewSubscriptionCopyWith<$Res>
    implements $CreateNewSubscriptionCopyWith<$Res> {
  factory _$$_CreateNewSubscriptionCopyWith(_$_CreateNewSubscription value,
          $Res Function(_$_CreateNewSubscription) then) =
      __$$_CreateNewSubscriptionCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String userName,
      String password,
      String resellerUserName,
      String operatorUserName,
      String subscriberId,
      String planName,
      String networkType,
      String ipType,
      String assignedIp,
      bool isInstallationAddressSameAsBilling,
      bool isInstallationAddressSameAsPermanent,
      String country,
      String address,
      String pincode,
      String city,
      String state,
      double planBasicCost,
      double planOfferedCost,
      double planEnteredCost,
      double taxAmount});
}

/// @nodoc
class __$$_CreateNewSubscriptionCopyWithImpl<$Res>
    extends _$CreateNewSubscriptionCopyWithImpl<$Res, _$_CreateNewSubscription>
    implements _$$_CreateNewSubscriptionCopyWith<$Res> {
  __$$_CreateNewSubscriptionCopyWithImpl(_$_CreateNewSubscription _value,
      $Res Function(_$_CreateNewSubscription) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? userName = null,
    Object? password = null,
    Object? resellerUserName = null,
    Object? operatorUserName = null,
    Object? subscriberId = null,
    Object? planName = null,
    Object? networkType = null,
    Object? ipType = null,
    Object? assignedIp = null,
    Object? isInstallationAddressSameAsBilling = null,
    Object? isInstallationAddressSameAsPermanent = null,
    Object? country = null,
    Object? address = null,
    Object? pincode = null,
    Object? city = null,
    Object? state = null,
    Object? planBasicCost = null,
    Object? planOfferedCost = null,
    Object? planEnteredCost = null,
    Object? taxAmount = null,
  }) {
    return _then(_$_CreateNewSubscription(
      null == userName
          ? _value.userName
          : userName // ignore: cast_nullable_to_non_nullable
              as String,
      null == password
          ? _value.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      null == resellerUserName
          ? _value.resellerUserName
          : resellerUserName // ignore: cast_nullable_to_non_nullable
              as String,
      null == operatorUserName
          ? _value.operatorUserName
          : operatorUserName // ignore: cast_nullable_to_non_nullable
              as String,
      null == subscriberId
          ? _value.subscriberId
          : subscriberId // ignore: cast_nullable_to_non_nullable
              as String,
      null == planName
          ? _value.planName
          : planName // ignore: cast_nullable_to_non_nullable
              as String,
      null == networkType
          ? _value.networkType
          : networkType // ignore: cast_nullable_to_non_nullable
              as String,
      null == ipType
          ? _value.ipType
          : ipType // ignore: cast_nullable_to_non_nullable
              as String,
      null == assignedIp
          ? _value.assignedIp
          : assignedIp // ignore: cast_nullable_to_non_nullable
              as String,
      null == isInstallationAddressSameAsBilling
          ? _value.isInstallationAddressSameAsBilling
          : isInstallationAddressSameAsBilling // ignore: cast_nullable_to_non_nullable
              as bool,
      null == isInstallationAddressSameAsPermanent
          ? _value.isInstallationAddressSameAsPermanent
          : isInstallationAddressSameAsPermanent // ignore: cast_nullable_to_non_nullable
              as bool,
      null == country
          ? _value.country
          : country // ignore: cast_nullable_to_non_nullable
              as String,
      null == address
          ? _value.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      null == pincode
          ? _value.pincode
          : pincode // ignore: cast_nullable_to_non_nullable
              as String,
      null == city
          ? _value.city
          : city // ignore: cast_nullable_to_non_nullable
              as String,
      null == state
          ? _value.state
          : state // ignore: cast_nullable_to_non_nullable
              as String,
      null == planBasicCost
          ? _value.planBasicCost
          : planBasicCost // ignore: cast_nullable_to_non_nullable
              as double,
      null == planOfferedCost
          ? _value.planOfferedCost
          : planOfferedCost // ignore: cast_nullable_to_non_nullable
              as double,
      null == planEnteredCost
          ? _value.planEnteredCost
          : planEnteredCost // ignore: cast_nullable_to_non_nullable
              as double,
      null == taxAmount
          ? _value.taxAmount
          : taxAmount // ignore: cast_nullable_to_non_nullable
              as double,
    ));
  }
}

/// @nodoc

class _$_CreateNewSubscription implements _CreateNewSubscription {
  _$_CreateNewSubscription(
      this.userName,
      this.password,
      this.resellerUserName,
      this.operatorUserName,
      this.subscriberId,
      this.planName,
      this.networkType,
      this.ipType,
      this.assignedIp,
      this.isInstallationAddressSameAsBilling,
      this.isInstallationAddressSameAsPermanent,
      this.country,
      this.address,
      this.pincode,
      this.city,
      this.state,
      this.planBasicCost,
      this.planOfferedCost,
      this.planEnteredCost,
      this.taxAmount);

  @override
  final String userName;
  @override
  final String password;
  @override
  final String resellerUserName;
  @override
  final String operatorUserName;
  @override
  final String subscriberId;
  @override
  final String planName;
  @override
  final String networkType;
  @override
  final String ipType;
  @override
  final String assignedIp;
  @override
  final bool isInstallationAddressSameAsBilling;
  @override
  final bool isInstallationAddressSameAsPermanent;
  @override
  final String country;
  @override
  final String address;
  @override
  final String pincode;
  @override
  final String city;
  @override
  final String state;
  @override
  final double planBasicCost;
  @override
  final double planOfferedCost;
  @override
  final double planEnteredCost;
  @override
  final double taxAmount;

  @override
  String toString() {
    return 'CreateNewSubscription(userName: $userName, password: $password, resellerUserName: $resellerUserName, operatorUserName: $operatorUserName, subscriberId: $subscriberId, planName: $planName, networkType: $networkType, ipType: $ipType, assignedIp: $assignedIp, isInstallationAddressSameAsBilling: $isInstallationAddressSameAsBilling, isInstallationAddressSameAsPermanent: $isInstallationAddressSameAsPermanent, country: $country, address: $address, pincode: $pincode, city: $city, state: $state, planBasicCost: $planBasicCost, planOfferedCost: $planOfferedCost, planEnteredCost: $planEnteredCost, taxAmount: $taxAmount)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateNewSubscription &&
            (identical(other.userName, userName) ||
                other.userName == userName) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.resellerUserName, resellerUserName) ||
                other.resellerUserName == resellerUserName) &&
            (identical(other.operatorUserName, operatorUserName) ||
                other.operatorUserName == operatorUserName) &&
            (identical(other.subscriberId, subscriberId) ||
                other.subscriberId == subscriberId) &&
            (identical(other.planName, planName) ||
                other.planName == planName) &&
            (identical(other.networkType, networkType) ||
                other.networkType == networkType) &&
            (identical(other.ipType, ipType) || other.ipType == ipType) &&
            (identical(other.assignedIp, assignedIp) ||
                other.assignedIp == assignedIp) &&
            (identical(other.isInstallationAddressSameAsBilling,
                    isInstallationAddressSameAsBilling) ||
                other.isInstallationAddressSameAsBilling ==
                    isInstallationAddressSameAsBilling) &&
            (identical(other.isInstallationAddressSameAsPermanent,
                    isInstallationAddressSameAsPermanent) ||
                other.isInstallationAddressSameAsPermanent ==
                    isInstallationAddressSameAsPermanent) &&
            (identical(other.country, country) || other.country == country) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.pincode, pincode) || other.pincode == pincode) &&
            (identical(other.city, city) || other.city == city) &&
            (identical(other.state, state) || other.state == state) &&
            (identical(other.planBasicCost, planBasicCost) ||
                other.planBasicCost == planBasicCost) &&
            (identical(other.planOfferedCost, planOfferedCost) ||
                other.planOfferedCost == planOfferedCost) &&
            (identical(other.planEnteredCost, planEnteredCost) ||
                other.planEnteredCost == planEnteredCost) &&
            (identical(other.taxAmount, taxAmount) ||
                other.taxAmount == taxAmount));
  }

  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        userName,
        password,
        resellerUserName,
        operatorUserName,
        subscriberId,
        planName,
        networkType,
        ipType,
        assignedIp,
        isInstallationAddressSameAsBilling,
        isInstallationAddressSameAsPermanent,
        country,
        address,
        pincode,
        city,
        state,
        planBasicCost,
        planOfferedCost,
        planEnteredCost,
        taxAmount
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateNewSubscriptionCopyWith<_$_CreateNewSubscription> get copyWith =>
      __$$_CreateNewSubscriptionCopyWithImpl<_$_CreateNewSubscription>(
          this, _$identity);
}

abstract class _CreateNewSubscription implements CreateNewSubscription {
  factory _CreateNewSubscription(
      final String userName,
      final String password,
      final String resellerUserName,
      final String operatorUserName,
      final String subscriberId,
      final String planName,
      final String networkType,
      final String ipType,
      final String assignedIp,
      final bool isInstallationAddressSameAsBilling,
      final bool isInstallationAddressSameAsPermanent,
      final String country,
      final String address,
      final String pincode,
      final String city,
      final String state,
      final double planBasicCost,
      final double planOfferedCost,
      final double planEnteredCost,
      final double taxAmount) = _$_CreateNewSubscription;

  @override
  String get userName;
  @override
  String get password;
  @override
  String get resellerUserName;
  @override
  String get operatorUserName;
  @override
  String get subscriberId;
  @override
  String get planName;
  @override
  String get networkType;
  @override
  String get ipType;
  @override
  String get assignedIp;
  @override
  bool get isInstallationAddressSameAsBilling;
  @override
  bool get isInstallationAddressSameAsPermanent;
  @override
  String get country;
  @override
  String get address;
  @override
  String get pincode;
  @override
  String get city;
  @override
  String get state;
  @override
  double get planBasicCost;
  @override
  double get planOfferedCost;
  @override
  double get planEnteredCost;
  @override
  double get taxAmount;
  @override
  @JsonKey(ignore: true)
  _$$_CreateNewSubscriptionCopyWith<_$_CreateNewSubscription> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateNewNas {
  String get nasName => throw _privateConstructorUsedError;
  String get shortName => throw _privateConstructorUsedError;
  String get nasType => throw _privateConstructorUsedError;
  int get ports => throw _privateConstructorUsedError;
  String get nasSecret => throw _privateConstructorUsedError;
  String get nasDescription => throw _privateConstructorUsedError;
  String get server => throw _privateConstructorUsedError;
  String get community => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $CreateNewNasCopyWith<CreateNewNas> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CreateNewNasCopyWith<$Res> {
  factory $CreateNewNasCopyWith(
          CreateNewNas value, $Res Function(CreateNewNas) then) =
      _$CreateNewNasCopyWithImpl<$Res, CreateNewNas>;
  @useResult
  $Res call(
      {String nasName,
      String shortName,
      String nasType,
      int ports,
      String nasSecret,
      String nasDescription,
      String server,
      String community});
}

/// @nodoc
class _$CreateNewNasCopyWithImpl<$Res, $Val extends CreateNewNas>
    implements $CreateNewNasCopyWith<$Res> {
  _$CreateNewNasCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nasName = null,
    Object? shortName = null,
    Object? nasType = null,
    Object? ports = null,
    Object? nasSecret = null,
    Object? nasDescription = null,
    Object? server = null,
    Object? community = null,
  }) {
    return _then(_value.copyWith(
      nasName: null == nasName
          ? _value.nasName
          : nasName // ignore: cast_nullable_to_non_nullable
              as String,
      shortName: null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      nasType: null == nasType
          ? _value.nasType
          : nasType // ignore: cast_nullable_to_non_nullable
              as String,
      ports: null == ports
          ? _value.ports
          : ports // ignore: cast_nullable_to_non_nullable
              as int,
      nasSecret: null == nasSecret
          ? _value.nasSecret
          : nasSecret // ignore: cast_nullable_to_non_nullable
              as String,
      nasDescription: null == nasDescription
          ? _value.nasDescription
          : nasDescription // ignore: cast_nullable_to_non_nullable
              as String,
      server: null == server
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as String,
      community: null == community
          ? _value.community
          : community // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_CreateNewNasCopyWith<$Res>
    implements $CreateNewNasCopyWith<$Res> {
  factory _$$_CreateNewNasCopyWith(
          _$_CreateNewNas value, $Res Function(_$_CreateNewNas) then) =
      __$$_CreateNewNasCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String nasName,
      String shortName,
      String nasType,
      int ports,
      String nasSecret,
      String nasDescription,
      String server,
      String community});
}

/// @nodoc
class __$$_CreateNewNasCopyWithImpl<$Res>
    extends _$CreateNewNasCopyWithImpl<$Res, _$_CreateNewNas>
    implements _$$_CreateNewNasCopyWith<$Res> {
  __$$_CreateNewNasCopyWithImpl(
      _$_CreateNewNas _value, $Res Function(_$_CreateNewNas) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? nasName = null,
    Object? shortName = null,
    Object? nasType = null,
    Object? ports = null,
    Object? nasSecret = null,
    Object? nasDescription = null,
    Object? server = null,
    Object? community = null,
  }) {
    return _then(_$_CreateNewNas(
      null == nasName
          ? _value.nasName
          : nasName // ignore: cast_nullable_to_non_nullable
              as String,
      null == shortName
          ? _value.shortName
          : shortName // ignore: cast_nullable_to_non_nullable
              as String,
      null == nasType
          ? _value.nasType
          : nasType // ignore: cast_nullable_to_non_nullable
              as String,
      null == ports
          ? _value.ports
          : ports // ignore: cast_nullable_to_non_nullable
              as int,
      null == nasSecret
          ? _value.nasSecret
          : nasSecret // ignore: cast_nullable_to_non_nullable
              as String,
      null == nasDescription
          ? _value.nasDescription
          : nasDescription // ignore: cast_nullable_to_non_nullable
              as String,
      null == server
          ? _value.server
          : server // ignore: cast_nullable_to_non_nullable
              as String,
      null == community
          ? _value.community
          : community // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_CreateNewNas implements _CreateNewNas {
  _$_CreateNewNas(this.nasName, this.shortName, this.nasType, this.ports,
      this.nasSecret, this.nasDescription, this.server, this.community);

  @override
  final String nasName;
  @override
  final String shortName;
  @override
  final String nasType;
  @override
  final int ports;
  @override
  final String nasSecret;
  @override
  final String nasDescription;
  @override
  final String server;
  @override
  final String community;

  @override
  String toString() {
    return 'CreateNewNas(nasName: $nasName, shortName: $shortName, nasType: $nasType, ports: $ports, nasSecret: $nasSecret, nasDescription: $nasDescription, server: $server, community: $community)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreateNewNas &&
            (identical(other.nasName, nasName) || other.nasName == nasName) &&
            (identical(other.shortName, shortName) ||
                other.shortName == shortName) &&
            (identical(other.nasType, nasType) || other.nasType == nasType) &&
            (identical(other.ports, ports) || other.ports == ports) &&
            (identical(other.nasSecret, nasSecret) ||
                other.nasSecret == nasSecret) &&
            (identical(other.nasDescription, nasDescription) ||
                other.nasDescription == nasDescription) &&
            (identical(other.server, server) || other.server == server) &&
            (identical(other.community, community) ||
                other.community == community));
  }

  @override
  int get hashCode => Object.hash(runtimeType, nasName, shortName, nasType,
      ports, nasSecret, nasDescription, server, community);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreateNewNasCopyWith<_$_CreateNewNas> get copyWith =>
      __$$_CreateNewNasCopyWithImpl<_$_CreateNewNas>(this, _$identity);
}

abstract class _CreateNewNas implements CreateNewNas {
  factory _CreateNewNas(
      final String nasName,
      final String shortName,
      final String nasType,
      final int ports,
      final String nasSecret,
      final String nasDescription,
      final String server,
      final String community) = _$_CreateNewNas;

  @override
  String get nasName;
  @override
  String get shortName;
  @override
  String get nasType;
  @override
  int get ports;
  @override
  String get nasSecret;
  @override
  String get nasDescription;
  @override
  String get server;
  @override
  String get community;
  @override
  @JsonKey(ignore: true)
  _$$_CreateNewNasCopyWith<_$_CreateNewNas> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$W2wTransferObject {
  double get amount => throw _privateConstructorUsedError;
  String get receiverUserName => throw _privateConstructorUsedError;
  String get receiverUserId => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $W2wTransferObjectCopyWith<W2wTransferObject> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $W2wTransferObjectCopyWith<$Res> {
  factory $W2wTransferObjectCopyWith(
          W2wTransferObject value, $Res Function(W2wTransferObject) then) =
      _$W2wTransferObjectCopyWithImpl<$Res, W2wTransferObject>;
  @useResult
  $Res call({double amount, String receiverUserName, String receiverUserId});
}

/// @nodoc
class _$W2wTransferObjectCopyWithImpl<$Res, $Val extends W2wTransferObject>
    implements $W2wTransferObjectCopyWith<$Res> {
  _$W2wTransferObjectCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? receiverUserName = null,
    Object? receiverUserId = null,
  }) {
    return _then(_value.copyWith(
      amount: null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      receiverUserName: null == receiverUserName
          ? _value.receiverUserName
          : receiverUserName // ignore: cast_nullable_to_non_nullable
              as String,
      receiverUserId: null == receiverUserId
          ? _value.receiverUserId
          : receiverUserId // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_W2wTransferObjectCopyWith<$Res>
    implements $W2wTransferObjectCopyWith<$Res> {
  factory _$$_W2wTransferObjectCopyWith(_$_W2wTransferObject value,
          $Res Function(_$_W2wTransferObject) then) =
      __$$_W2wTransferObjectCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({double amount, String receiverUserName, String receiverUserId});
}

/// @nodoc
class __$$_W2wTransferObjectCopyWithImpl<$Res>
    extends _$W2wTransferObjectCopyWithImpl<$Res, _$_W2wTransferObject>
    implements _$$_W2wTransferObjectCopyWith<$Res> {
  __$$_W2wTransferObjectCopyWithImpl(
      _$_W2wTransferObject _value, $Res Function(_$_W2wTransferObject) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? amount = null,
    Object? receiverUserName = null,
    Object? receiverUserId = null,
  }) {
    return _then(_$_W2wTransferObject(
      null == amount
          ? _value.amount
          : amount // ignore: cast_nullable_to_non_nullable
              as double,
      null == receiverUserName
          ? _value.receiverUserName
          : receiverUserName // ignore: cast_nullable_to_non_nullable
              as String,
      null == receiverUserId
          ? _value.receiverUserId
          : receiverUserId // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _$_W2wTransferObject implements _W2wTransferObject {
  _$_W2wTransferObject(this.amount, this.receiverUserName, this.receiverUserId);

  @override
  final double amount;
  @override
  final String receiverUserName;
  @override
  final String receiverUserId;

  @override
  String toString() {
    return 'W2wTransferObject(amount: $amount, receiverUserName: $receiverUserName, receiverUserId: $receiverUserId)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_W2wTransferObject &&
            (identical(other.amount, amount) || other.amount == amount) &&
            (identical(other.receiverUserName, receiverUserName) ||
                other.receiverUserName == receiverUserName) &&
            (identical(other.receiverUserId, receiverUserId) ||
                other.receiverUserId == receiverUserId));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, amount, receiverUserName, receiverUserId);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_W2wTransferObjectCopyWith<_$_W2wTransferObject> get copyWith =>
      __$$_W2wTransferObjectCopyWithImpl<_$_W2wTransferObject>(
          this, _$identity);
}

abstract class _W2wTransferObject implements W2wTransferObject {
  factory _W2wTransferObject(final double amount, final String receiverUserName,
      final String receiverUserId) = _$_W2wTransferObject;

  @override
  double get amount;
  @override
  String get receiverUserName;
  @override
  String get receiverUserId;
  @override
  @JsonKey(ignore: true)
  _$$_W2wTransferObjectCopyWith<_$_W2wTransferObject> get copyWith =>
      throw _privateConstructorUsedError;
}
