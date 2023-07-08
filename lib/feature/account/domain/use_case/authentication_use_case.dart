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

  Future<int> insertNewCustomer(String customerId) async {
    try {
      final response =
          await authenticationRepository.insertNewCustomer(customerId);
      return response;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  Future<int> insertNewAccount(
    String firebaseIdToken,
    String phoneNumber,
    String fullName,
  ) async {
    try {
      final response = await authenticationRepository.insertNewAccount(
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
