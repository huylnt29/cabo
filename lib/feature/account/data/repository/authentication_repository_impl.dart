import 'package:cabo_customer/feature/account/data/local_data_source/authentication_local_data_source.dart';
import 'package:cabo_customer/feature/account/data/remote_data_source/authentication_remote_data_source.dart';
import 'package:cabo_customer/feature/account/domain/repository/authentication_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthenticationRepository)
class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationRepositoryImpl({
    required this.authenticationRemoteDataSource,
    required this.authenticationLocalDataSource,
  });

  late AuthenticationRemoteDataSource authenticationRemoteDataSource;
  late AuthenticationLocalDataSource authenticationLocalDataSource;

  @override
  Future<bool> checkPhone(String phoneNumber) async {
    return authenticationRemoteDataSource.checkPhone(phoneNumber);
  }

  @override
  Future<int> putCustomer(String customerId) async {
    return authenticationLocalDataSource.putCustomer(customerId);
  }

  @override
  Future<int> putAccount(
    String firebaseIdToken,
    String phoneNumber,
    String fullName,
  ) async {
    return authenticationLocalDataSource.putAccount(
      firebaseIdToken,
      phoneNumber,
      fullName,
    );
  }

  @override
  Future<String> signUpWithCaboServer(
      String phoneNumber, String fullName) async {
    return authenticationRemoteDataSource.signUpWithCaboServer(
      phoneNumber,
      fullName,
    );
  }
}
