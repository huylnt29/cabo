import 'package:cabo_customer/feature/account/domain/repository/authentication_repository.dart';
import 'package:flutter/material.dart';

class AuthenticationUseCase {
  AuthenticationUseCase({required this.authenticationRepository});
  AuthenticationRepository authenticationRepository;

  Future<bool> checkPhone(String phoneNumber) async {
    try {
      final response = await authenticationRepository.checkPhone(phoneNumber);
      return response;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  Future<int> putCustomer(String customerId) async {
    try {
      final response = await authenticationRepository.putCustomer(customerId);
      return response;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  Future<int> putAccount(
    String firebaseIdToken,
    String phoneNumber,
    String fullName,
  ) async {
    try {
      final response = await authenticationRepository.putAccount(
        firebaseIdToken,
        phoneNumber,
        fullName,
      );
      return response;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  Future<String> signUpWithCaboServer(
      String phoneNumber, String fullName) async {
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
}
