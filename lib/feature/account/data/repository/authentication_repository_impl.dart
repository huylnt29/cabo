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
  Future<int> insertNewCustomer(String customerId) async {
    return authenticationLocalDataSource.insertNewCustomer(customerId);
  }

  @override
  Future<int> insertNewAccount(
    String firebaseIdToken,
    String phoneNumber,
    String fullName,
  ) async {
    return authenticationLocalDataSource.insertNewAccount(
      firebaseIdToken,
      phoneNumber,
      fullName,
    );
  }
}
