part of 'authentication_bloc.dart';

sealed class AuthenticationEvent {}

class PhoneExistenceCheckEvent extends AuthenticationEvent {
  PhoneExistenceCheckEvent(this.phoneNumber);
  String phoneNumber;
}

class PhoneSentToFirebaseEvent extends AuthenticationEvent {
  PhoneSentToFirebaseEvent(this.phoneNumber, this.fullName);
  String phoneNumber;
  String fullName;
}

class OtpVerificationEvent extends AuthenticationEvent {
  OtpVerificationEvent(this.otpCode);
  String otpCode;
}
