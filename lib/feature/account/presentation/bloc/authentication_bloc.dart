// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:cabo_customer/core/extensions/load_state.dart';
import 'package:cabo_customer/core/widgets/toast_widget.dart';
import 'package:cabo_customer/feature/account/data/model/account_model.dart';
import 'package:cabo_customer/feature/account/domain/use_case/authentication_use_case.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(AuthenticationUseCase authenticationUseCase)
      : super(const AuthenticationState(
          loadState: LoadState.initial,
          phoneExisted: false,
          otpCorrect: false,
          otpSentToDevice: false,
          customerIdReceived: false,
        )) {
    _authenticationUseCase = authenticationUseCase;
    listenToEvents();
  }
  late AuthenticationUseCase _authenticationUseCase;

  void listenToEvents() {
    on<PhoneExistenceCheckEvent>((event, emit) async {
      await _checkPhoneExistence(event, emit);
    });
    on<OtpVerificationEvent>((event, emit) async {
      await _verifyOtp(event, emit);
    });
    on<PhoneSentToFirebaseEvent>((event, emit) async {
      await _authenticateWithPhone(event, emit);
    });
  }

  Future<void> _checkPhoneExistence(
      PhoneExistenceCheckEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(loadState: LoadState.loading));
    final response = await _authenticationUseCase.checkPhone(event.phoneNumber);
    if (!response) {
      ToastWidget.show('Phone number has not been registered yet.');
    }
    emit(state.copyWith(loadState: LoadState.loaded, phoneExisted: response));
  }

  Future<void> _authenticateWithPhone(
      PhoneSentToFirebaseEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(loadState: LoadState.loading));
    final response =
        await _authenticationUseCase.authenticateWithPhone(event.phoneNumber);
    emit(state.copyWith(
      loadState: LoadState.loaded,
      otpSentToDevice: true,
    ));
  }

  Future<void> _verifyOtp(
      OtpVerificationEvent event, Emitter<AuthenticationState> emit) async {}
}
