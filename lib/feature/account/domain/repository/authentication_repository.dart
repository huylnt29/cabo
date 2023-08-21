import '../../data/local_data_source/authentication_local_data_source.dart';
import '../../data/remote_data_source/authentication_remote_data_source.dart';

abstract class AuthenticationRepository {
  AuthenticationRepository(
    this.authenticationLocalDataSource,
    this.authenticationRemoteDataSource,
  );
  late AuthenticationRemoteDataSource authenticationRemoteDataSource;
  late AuthenticationLocalDataSource authenticationLocalDataSource;

  Future<bool> checkPhone(String phoneNumber);
  Future<int> putCustomer(String customerId);
  Future<int> putAccount(
    String firebaseIdToken,
    String phoneNumber,
    String fullName,
  );
  Future<String> signUpWithCaboServer(String phoneNumber, String fullName);
  Future<dynamic> registerFcmNotification(String fcmToken);
}
