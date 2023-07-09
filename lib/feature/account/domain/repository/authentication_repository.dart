abstract class AuthenticationRepository {
  Future<bool> checkPhone(String phoneNumber);
  Future<int> putCustomer(String customerId);
  Future<int> putAccount(
    String firebaseIdToken,
    String phoneNumber,
    String fullName,
  );
  Future<String> signUpWithCaboServer(String phoneNumber, String fullName);
}
