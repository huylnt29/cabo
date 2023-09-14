import 'package:cabo_customer/feature/account/domain/repository/authentication_repository.dart';

import 'package:flutter/material.dart';

class AuthenticationUseCase {
  AuthenticationUseCase(this.authenticationRepository);
  final AuthenticationRepository authenticationRepository;

  Future<bool> checkPhone(String phoneNumber) async {
    try {
      final response = await authenticationRepository.checkPhone(phoneNumber);
      return response;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  Future<int> putAccount(
    String customerId,
    String phoneNumber,
    String fullName,
  ) async {
    try {
      final response = await authenticationRepository.putAccount(
        customerId,
        phoneNumber,
        fullName,
      );
      return response;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  Future<String> signUpWithCaboServer(
    String phoneNumber,
    String fullName,
  ) async {
    try {
      final response = await authenticationRepository.signUpWithCaboServer(
        phoneNumber,
        fullName,
      );
      return response;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  Future<dynamic> registerFcmNotification(String fcmToken) async {
    try {
      final response = await authenticationRepository.registerFcmNotification(
        fcmToken,
      );
      return response;
    } catch (error) {
      throw ErrorDescription(error.toString());
    }
  }
}
