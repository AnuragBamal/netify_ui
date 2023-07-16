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
  $Res call({String planName, String planDescription});
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
  $Res call({String planName, String planDescription});
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
    ));
  }
}

/// @nodoc

class _$_CreatePlan implements _CreatePlan {
  _$_CreatePlan(this.planName, this.planDescription);

  @override
  final String planName;
  @override
  final String planDescription;

  @override
  String toString() {
    return 'CreatePlan(planName: $planName, planDescription: $planDescription)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_CreatePlan &&
            (identical(other.planName, planName) ||
                other.planName == planName) &&
            (identical(other.planDescription, planDescription) ||
                other.planDescription == planDescription));
  }

  @override
  int get hashCode => Object.hash(runtimeType, planName, planDescription);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_CreatePlanCopyWith<_$_CreatePlan> get copyWith =>
      __$$_CreatePlanCopyWithImpl<_$_CreatePlan>(this, _$identity);
}

abstract class _CreatePlan implements CreatePlan {
  factory _CreatePlan(final String planName, final String planDescription) =
      _$_CreatePlan;

  @override
  String get planName;
  @override
  String get planDescription;
  @override
  @JsonKey(ignore: true)
  _$$_CreatePlanCopyWith<_$_CreatePlan> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$CreateResellerPriceChart {
  String get planName => throw _privateConstructorUsedError;
  String get resellerUserName => throw _privateConstructorUsedError;
  int get price => throw _privateConstructorUsedError;

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
  $Res call({String planName, String resellerUserName, int price});
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
    Object? price = null,
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
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
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
  $Res call({String planName, String resellerUserName, int price});
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
    Object? price = null,
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
      null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CreateResellerPriceChart implements _CreateResellerPriceChart {
  _$_CreateResellerPriceChart(this.planName, this.resellerUserName, this.price);

  @override
  final String planName;
  @override
  final String resellerUserName;
  @override
  final int price;

  @override
  String toString() {
    return 'CreateResellerPriceChart(planName: $planName, resellerUserName: $resellerUserName, price: $price)';
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
            (identical(other.price, price) || other.price == price));
  }

  @override
  int get hashCode =>
      Object.hash(runtimeType, planName, resellerUserName, price);

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
      final int price) = _$_CreateResellerPriceChart;

  @override
  String get planName;
  @override
  String get resellerUserName;
  @override
  int get price;
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
  int get price => throw _privateConstructorUsedError;

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
      int price});
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
    Object? price = null,
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
      price: null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
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
      int price});
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
    Object? price = null,
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
      null == price
          ? _value.price
          : price // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class _$_CreateOperatorPriceChart implements _CreateOperatorPriceChart {
  _$_CreateOperatorPriceChart(
      this.planName, this.operatorUserName, this.resellerUserName, this.price);

  @override
  final String planName;
  @override
  final String operatorUserName;
  @override
  final String resellerUserName;
  @override
  final int price;

  @override
  String toString() {
    return 'CreateOperatorPriceChart(planName: $planName, operatorUserName: $operatorUserName, resellerUserName: $resellerUserName, price: $price)';
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
            (identical(other.price, price) || other.price == price));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, planName, operatorUserName, resellerUserName, price);

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
      final int price) = _$_CreateOperatorPriceChart;

  @override
  String get planName;
  @override
  String get operatorUserName;
  @override
  String get resellerUserName;
  @override
  int get price;
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
      String state});
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
      String state});
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
      this.state);

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
  String toString() {
    return 'CreateNewSubscription(userName: $userName, password: $password, resellerUserName: $resellerUserName, operatorUserName: $operatorUserName, subscriberId: $subscriberId, planName: $planName, networkType: $networkType, ipType: $ipType, assignedIp: $assignedIp, isInstallationAddressSameAsBilling: $isInstallationAddressSameAsBilling, isInstallationAddressSameAsPermanent: $isInstallationAddressSameAsPermanent, country: $country, address: $address, pincode: $pincode, city: $city, state: $state)';
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
            (identical(other.state, state) || other.state == state));
  }

  @override
  int get hashCode => Object.hash(
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
      state);

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
      final String state) = _$_CreateNewSubscription;

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
  @JsonKey(ignore: true)
  _$$_CreateNewSubscriptionCopyWith<_$_CreateNewSubscription> get copyWith =>
      throw _privateConstructorUsedError;
}
