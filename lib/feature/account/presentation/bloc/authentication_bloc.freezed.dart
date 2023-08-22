// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'authentication_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#custom-getters-and-methods');

/// @nodoc
mixin _$AuthenticationState {
  bool get canLoginAutomatically => throw _privateConstructorUsedError;
  bool get canNavigateToOtpScreen => throw _privateConstructorUsedError;
  bool get otpCorrect => throw _privateConstructorUsedError;
  LoadState get loadState => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $AuthenticationStateCopyWith<AuthenticationState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AuthenticationStateCopyWith<$Res> {
  factory $AuthenticationStateCopyWith(
          AuthenticationState value, $Res Function(AuthenticationState) then) =
      _$AuthenticationStateCopyWithImpl<$Res, AuthenticationState>;
  @useResult
  $Res call(
      {bool canLoginAutomatically,
      bool canNavigateToOtpScreen,
      bool otpCorrect,
      LoadState loadState});
}

/// @nodoc
class _$AuthenticationStateCopyWithImpl<$Res, $Val extends AuthenticationState>
    implements $AuthenticationStateCopyWith<$Res> {
  _$AuthenticationStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canLoginAutomatically = null,
    Object? canNavigateToOtpScreen = null,
    Object? otpCorrect = null,
    Object? loadState = null,
  }) {
    return _then(_value.copyWith(
      canLoginAutomatically: null == canLoginAutomatically
          ? _value.canLoginAutomatically
          : canLoginAutomatically // ignore: cast_nullable_to_non_nullable
              as bool,
      canNavigateToOtpScreen: null == canNavigateToOtpScreen
          ? _value.canNavigateToOtpScreen
          : canNavigateToOtpScreen // ignore: cast_nullable_to_non_nullable
              as bool,
      otpCorrect: null == otpCorrect
          ? _value.otpCorrect
          : otpCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      loadState: null == loadState
          ? _value.loadState
          : loadState // ignore: cast_nullable_to_non_nullable
              as LoadState,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$_AuthenticationStateCopyWith<$Res>
    implements $AuthenticationStateCopyWith<$Res> {
  factory _$$_AuthenticationStateCopyWith(_$_AuthenticationState value,
          $Res Function(_$_AuthenticationState) then) =
      __$$_AuthenticationStateCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {bool canLoginAutomatically,
      bool canNavigateToOtpScreen,
      bool otpCorrect,
      LoadState loadState});
}

/// @nodoc
class __$$_AuthenticationStateCopyWithImpl<$Res>
    extends _$AuthenticationStateCopyWithImpl<$Res, _$_AuthenticationState>
    implements _$$_AuthenticationStateCopyWith<$Res> {
  __$$_AuthenticationStateCopyWithImpl(_$_AuthenticationState _value,
      $Res Function(_$_AuthenticationState) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? canLoginAutomatically = null,
    Object? canNavigateToOtpScreen = null,
    Object? otpCorrect = null,
    Object? loadState = null,
  }) {
    return _then(_$_AuthenticationState(
      canLoginAutomatically: null == canLoginAutomatically
          ? _value.canLoginAutomatically
          : canLoginAutomatically // ignore: cast_nullable_to_non_nullable
              as bool,
      canNavigateToOtpScreen: null == canNavigateToOtpScreen
          ? _value.canNavigateToOtpScreen
          : canNavigateToOtpScreen // ignore: cast_nullable_to_non_nullable
              as bool,
      otpCorrect: null == otpCorrect
          ? _value.otpCorrect
          : otpCorrect // ignore: cast_nullable_to_non_nullable
              as bool,
      loadState: null == loadState
          ? _value.loadState
          : loadState // ignore: cast_nullable_to_non_nullable
              as LoadState,
    ));
  }
}

/// @nodoc

class _$_AuthenticationState implements _AuthenticationState {
  const _$_AuthenticationState(
      {this.canLoginAutomatically = false,
      this.canNavigateToOtpScreen = false,
      this.otpCorrect = false,
      required this.loadState});

  @override
  @JsonKey()
  final bool canLoginAutomatically;
  @override
  @JsonKey()
  final bool canNavigateToOtpScreen;
  @override
  @JsonKey()
  final bool otpCorrect;
  @override
  final LoadState loadState;

  @override
  String toString() {
    return 'AuthenticationState(canLoginAutomatically: $canLoginAutomatically, canNavigateToOtpScreen: $canNavigateToOtpScreen, otpCorrect: $otpCorrect, loadState: $loadState)';
  }

  @override
  bool operator ==(dynamic other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$_AuthenticationState &&
            (identical(other.canLoginAutomatically, canLoginAutomatically) ||
                other.canLoginAutomatically == canLoginAutomatically) &&
            (identical(other.canNavigateToOtpScreen, canNavigateToOtpScreen) ||
                other.canNavigateToOtpScreen == canNavigateToOtpScreen) &&
            (identical(other.otpCorrect, otpCorrect) ||
                other.otpCorrect == otpCorrect) &&
            (identical(other.loadState, loadState) ||
                other.loadState == loadState));
  }

  @override
  int get hashCode => Object.hash(runtimeType, canLoginAutomatically,
      canNavigateToOtpScreen, otpCorrect, loadState);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$_AuthenticationStateCopyWith<_$_AuthenticationState> get copyWith =>
      __$$_AuthenticationStateCopyWithImpl<_$_AuthenticationState>(
          this, _$identity);
}

abstract class _AuthenticationState implements AuthenticationState {
  const factory _AuthenticationState(
      {final bool canLoginAutomatically,
      final bool canNavigateToOtpScreen,
      final bool otpCorrect,
      required final LoadState loadState}) = _$_AuthenticationState;

  @override
  bool get canLoginAutomatically;
  @override
  bool get canNavigateToOtpScreen;
  @override
  bool get otpCorrect;
  @override
  LoadState get loadState;
  @override
  @JsonKey(ignore: true)
  _$$_AuthenticationStateCopyWith<_$_AuthenticationState> get copyWith =>
      throw _privateConstructorUsedError;
}
