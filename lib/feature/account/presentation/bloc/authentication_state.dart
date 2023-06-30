part of 'authentication_bloc.dart';

@freezed
class AuthenticationState with _$AuthenticationState {
  const factory AuthenticationState({
    bool? phoneExisted,
    bool? otpSentToDevice,
    bool? otpCorrect,
    bool? customerIdReceived,
    required LoadState loadState,
  }) = _AuthenticationState;
}
