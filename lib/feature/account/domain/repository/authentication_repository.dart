abstract class AuthenticationRepository {
  Future<bool> checkPhone(String phoneNumber);
  Future<String> getCustomerId();
  Future<void> authenticateWithPhone(String phoneNumber);
  Future<bool> verifyOtp(String otp);
}
