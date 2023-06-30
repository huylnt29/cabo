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

  Future<String> getCustomerId() async {
    try {
      final response = await authenticationRepository.getCustomerId();
      return response;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  Future<void> authenticateWithPhone(String phoneNumber) async {
    try {
      final response =
          await authenticationRepository.authenticateWithPhone(phoneNumber);
      return response;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }

  Future<bool> verifyOtp(String otp) async {
    try {
      final response = await authenticationRepository.verifyOtp(otp);
      return response;
    } catch (e) {
      throw ErrorDescription(e.toString());
    }
  }
}
