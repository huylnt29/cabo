import 'package:cabo_customer/feature/account/domain/repository/authentication_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthenticationRepository)
class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationRepositoryImpl(
    super.authenticationRemoteDataSource,
    super.authenticationLocalDataSource,
  );

  @override
  Future<bool> checkPhone(String phoneNumber) async {
    return authenticationRemoteDataSource.checkPhone(phoneNumber);
  }

  @override
  Future<int> putAccount(
    String customerId,
    String phoneNumber,
    String fullName,
  ) async {
    return authenticationLocalDataSource.putAccount(
      customerId,
      phoneNumber,
      fullName,
    );
  }

  @override
  Future<String> signUpWithCaboServer(
    String phoneNumber,
    String fullName,
  ) async {
    return authenticationRemoteDataSource.signUpWithCaboServer(
      phoneNumber,
      fullName,
    );
  }

  @override
  Future<dynamic> registerFcmNotification(String fcmToken) async {
    return authenticationRemoteDataSource.registerFcmNotification(
      fcmToken,
    );
  }
}
