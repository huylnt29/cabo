import '../../data/local_data_source/authentication_local_data_source.dart';
import '../../data/remote_data_source/authentication_remote_data_source.dart';

abstract class AuthenticationRepository {
  AuthenticationRepository(
    this.authenticationLocalDataSource,
    this.authenticationRemoteDataSource,
  );
  final AuthenticationRemoteDataSource authenticationRemoteDataSource;
  final AuthenticationLocalDataSource authenticationLocalDataSource;

  Future<bool> checkPhone(String phoneNumber);

  Future<int> putAccount(
    String customerId,
    String phoneNumber,
    String fullName,
  );
  Future<String> signUpWithCaboServer(
    String phoneNumber,
    String fullName,
  );
  Future<dynamic> registerFcmNotification(String fcmToken);
}
