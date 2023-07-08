// ignore_for_file: unused_local_variable

import 'package:bloc/bloc.dart';
import 'package:cabo_customer/core/extensions/load_state.dart';
import 'package:cabo_customer/core/extensions/logger.dart';
import 'package:cabo_customer/core/router/route_config.dart';
import 'package:cabo_customer/core/router/route_paths.dart';
import 'package:cabo_customer/core/widgets/toast_widget.dart';
import 'package:cabo_customer/feature/account/domain/use_case/authentication_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(AuthenticationUseCase authenticationUseCase)
      : super(
          const AuthenticationState(loadState: LoadState.initial),
        ) {
    _authenticationUseCase = authenticationUseCase;
    listenToEvents();
  }
  late AuthenticationUseCase _authenticationUseCase;
  final auth = FirebaseAuth.instance;

  late String phoneNumber;
  late String fullName;
  late String firebaseVerificationId;

  void listenToEvents() {
    on<PhoneExistenceCheckEvent>((event, emit) async {
      await _checkPhoneExistence(event, emit);
    });

    on<PhoneSentToFirebaseEvent>((event, emit) async {
      await _submitSignUpForm(event, emit);
    });

    on<OtpVerificationEvent>((event, emit) async {
      await _verifyOtp(event, emit);
    });

    on<AutoLogInEvent>((event, emit) async {
      await _logInAutomatically(event, emit);
    });
  }

  Future<void> _logInAutomatically(
    AutoLogInEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(loadState: LoadState.loading));
    final user = FirebaseAuth.instance.currentUser;
    if (user != null) {
      Logger.v('Current Firebase user: $user');

      emit(state.copyWith(
        loadState: LoadState.loaded,
        canLoginAutomatically: true,
      ));
    } else {
      emit(state.copyWith(
        loadState: LoadState.loaded,
        canLoginAutomatically: false,
      ));
    }
  }

  Future<void> _checkPhoneExistence(
      PhoneExistenceCheckEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(loadState: LoadState.loading));
    final response = await _authenticationUseCase.checkPhone(event.phoneNumber);
    if (!response) {
      ToastWidget.show('Phone number has not been registered yet.');
    }
    // emit(state.copyWith(loadState: LoadState.loaded, phoneExisted: response));
    // if (state.phoneExisted!) {}
  }

  Future<void> _submitSignUpForm(
    PhoneSentToFirebaseEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    if (event.phoneNumber.length != 10) {
      ToastWidget.show('Phone number must include 10 digits.');
    } else if (event.fullName.length < 3) {
      ToastWidget.show('Your name should be more detailed');
    } else {
      fullName = event.fullName;
      phoneNumber = event.phoneNumber;
      await _authenticateWithPhone(event, emit);
      emit(state.copyWith(canNavigateToOtpScreen: true));
    }
  }

  Future<void> _authenticateWithPhone(
      PhoneSentToFirebaseEvent event, Emitter<AuthenticationState> emit) async {
    emit(state.copyWith(loadState: LoadState.loading));

    await auth.verifyPhoneNumber(
      phoneNumber: '+1${event.phoneNumber}',
      verificationCompleted: (credential) async {
        await auth.signInWithCredential(credential);
      },
      verificationFailed: (error) {
        if (error.code == 'invalid-phone-number') {
          ToastWidget.show('The given number is not valid');
        } else {
          ToastWidget.show(error.toString());
          Logger.e(error);
        }
      },
      codeSent: (verificationId, forceResendToken) async {
        firebaseVerificationId = verificationId;
        Logger.v('Code sent.');
        Logger.v('Verification ID: $verificationId');
        firebaseVerificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        firebaseVerificationId = verificationId;
      },
    );
  }

  Future<void> _verifyOtp(
    OtpVerificationEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(loadState: LoadState.loading));
    try {
      Logger.d('User OTP: ${event.otpCode}');
      Logger.d('OTP screen verification id: $firebaseVerificationId');
      final phoneCredential = PhoneAuthProvider.credential(
        verificationId: firebaseVerificationId,
        smsCode: event.otpCode,
      );
      final user = (await auth.signInWithCredential(phoneCredential)).user;
      if (user != null) {
        final idToken = await user.getIdToken();
        Logger.v('ID token $idToken');

        await putAccountIntoIsar(idToken);
        final customerId = await getCustomerId();
        Logger.v('Customer ID: $customerId');
        await putCustomerIntoIsar(customerId);

        emit(state.copyWith(
          loadState: LoadState.loaded,
          otpCorrect: true,
        ));
      }
    } on FirebaseAuthException catch (e) {
      Logger.e(e.message);
    }
  }

  Future<void> putAccountIntoIsar(String idToken) async {
    await _authenticationUseCase.insertNewAccount(
      idToken,
      phoneNumber,
      fullName,
    );
  }

  Future<String> getCustomerId() async {
    return await _authenticationUseCase.signUpWithCaboServer(
      phoneNumber,
      fullName,
    );
  }

  Future<void> putCustomerIntoIsar(String customerId) async {
    await _authenticationUseCase.insertNewCustomer(customerId);
  }
}
