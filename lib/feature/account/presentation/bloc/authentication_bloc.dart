// ignore_for_file: unused_local_variable, implementation_imports

import 'dart:io';

import 'package:cabo_customer/core/network/local/shared_preferences/shared_preferences_request_model.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:bloc/bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:cabo_customer/feature/account/domain/use_case/authentication_use_case.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/src/services/platform_channel.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:huylnt_flutter_component/reusable_core/enums/load_state.dart';
import 'package:huylnt_flutter_component/reusable_core/extensions/logger.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/toast_widget.dart';

import '../../../../core/network/local/shared_preferences/shared_preferences.dart';

part 'authentication_event.dart';
part 'authentication_state.dart';
part 'authentication_bloc.freezed.dart';

class AuthenticationBloc
    extends Bloc<AuthenticationEvent, AuthenticationState> {
  AuthenticationBloc(this._authenticationUseCase)
      : super(
          const AuthenticationState(loadState: LoadState.initial),
        ) {
    listenToEvents();
  }

  final AuthenticationUseCase _authenticationUseCase;
  final firebaseAuth = FirebaseAuth.instance;
  final firebaseMessaging = FirebaseMessaging.instance;

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
    final user = firebaseAuth.currentUser;

    if (user != null) {
      Logger.v('Current Firebase user: $user');
      final refreshedIdToken = await user.getIdToken(true);

      Logger.v('Refreshed ID token: $refreshedIdToken');

      await SharedPreferencesHelper.instance.setString(
        sharedPreferencesRequest: SharedPreferencesRequest<String>(
          key: 'firebaseIdToken',
          value: refreshedIdToken,
        ),
      );

      await invokeFcmListener();

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
    // if (event.phoneNumber.length != 10) {
    //   ToastWidget.show('Phone number must include 10 digits.');
    // } else if (event.fullName.length < 3) {
    //   ToastWidget.show('Your name should be more detailed');
    // } else {
    //   fullName = event.fullName;
    //   phoneNumber = event.phoneNumber;
    //   await _authenticateWithPhone(event, emit);
    //   emit(state.copyWith(canNavigateToOtpScreen: true));
    // }

    fullName = event.fullName;
    phoneNumber = event.phoneNumber;
    await _authenticateWithPhone(event, emit);
    emit(state.copyWith(canNavigateToOtpScreen: true));
  }

  Future<void> _authenticateWithPhone(
    PhoneSentToFirebaseEvent event,
    Emitter<AuthenticationState> emit,
  ) async {
    emit(state.copyWith(loadState: LoadState.loading));

    await firebaseAuth.verifyPhoneNumber(
      phoneNumber: event.phoneNumber,
      verificationCompleted: (credential) async {
        await firebaseAuth.signInWithCredential(credential);
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
      final user =
          (await firebaseAuth.signInWithCredential(phoneCredential)).user;

      /// Sign up successfully
      if (user != null) {
        final idToken = await user.getIdToken();
        Logger.v('ID token $idToken');

        await SharedPreferencesHelper.instance.setString(
          sharedPreferencesRequest: SharedPreferencesRequest<String>(
            key: 'firebaseIdToken',
            value: idToken,
          ),
        );

        final customerId = await getCustomerId();
        Logger.v('Customer ID: $customerId');
        await putAccountIntoIsar(customerId);

        emit(state.copyWith(
          loadState: LoadState.loaded,
          otpCorrect: true,
        ));

        await invokeFcmListener();
      }
    } on FirebaseAuthException catch (e) {
      Logger.e(e.message);
    }
  }

  Future<void> putAccountIntoIsar(String customerId) async {
    await _authenticationUseCase.putAccount(
      customerId,
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

  Future<void> invokeFcmListener() async {
    await requestNotificationPermission();
    await setUpFcmToken();
  }

  Future<void> requestPermission() async {
    final settings = await firebaseMessaging.requestPermission();
    if (settings.authorizationStatus == AuthorizationStatus.notDetermined) {
      Future.delayed(Duration.zero, () async {
        Logger.e('Authorization status is not determined.');
      });
    }
  }

  Future<void> requestNotificationPermission() async {
    if (Platform.isAndroid) {
      final androidInfo = await DeviceInfoPlugin().androidInfo;
      if (androidInfo.version.sdkInt >= 33) {
        const MethodChannel('com.example.cabo_customer')
            .invokeMethod('getNotificationPermission');
      } else {
        requestPermission();
      }
    } else {
      requestPermission();
    }
  }

  Future<void> setUpFcmToken() async {
    final token = await firebaseMessaging.getToken();

    Logger.v('FCM token: $token');

    await _authenticationUseCase.registerFcmNotification(token!);

    await updateFcmToken(token);

    firebaseMessaging.onTokenRefresh.listen(updateFcmToken);
  }

  Future<void> updateFcmToken(
    String newFcmToken,
  ) async {
    await SharedPreferencesHelper.instance.setString(
      sharedPreferencesRequest: SharedPreferencesRequest<String>(
        key: 'fcmToken',
        value: newFcmToken,
      ),
    );
  }
}
