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
      String confirmPassword});
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
      String confirmPassword});
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
      this.confirmPassword);

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
  String toString() {
    return 'RegisterObject(firstName: $firstName, lastName: $lastName, aadharNumber: $aadharNumber, email: $email, country: $country, city: $city, address: $address, mobileNumber: $mobileNumber, garudaDomain: $garudaDomain, userName: $userName, password: $password, tenancyType: $tenancyType, countryCode: $countryCode, confirmPassword: $confirmPassword)';
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
                other.confirmPassword == confirmPassword));
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
      confirmPassword);

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
      final String confirmPassword) = _$_RegisterObject;

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
