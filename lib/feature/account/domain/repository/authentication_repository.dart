abstract class AuthenticationRepository {
  Future<bool> checkPhone(String phoneNumber);
  Future<int> insertNewCustomer(String customerId);
  Future<int> insertNewAccount(
    String firebaseIdToken,
    String phoneNumber,
    String fullName,
  );
  Future<String> signUpWithCaboServer(String phoneNumber, String fullName);
}
