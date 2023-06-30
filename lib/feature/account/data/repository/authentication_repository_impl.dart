import 'package:cabo_customer/feature/account/data/remote_data_source/authentication_remote_data_source.dart';
import 'package:cabo_customer/feature/account/domain/repository/authentication_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthenticationRepository)
class AuthenticationRepositoryImpl extends AuthenticationRepository {
  AuthenticationRepositoryImpl({
    required this.authenticationRemoteDataSource,
  });

  late AuthenticationRemoteDataSource authenticationRemoteDataSource;

  @override
  Future<bool> checkPhone(String phoneNumber) async {
    return authenticationRemoteDataSource.checkPhone(phoneNumber);
  }

  @override
  Future<String> getCustomerId() async {
    return authenticationRemoteDataSource.getCustomerId();
  }

  @override
  Future<void> authenticateWithPhone(String phoneNumber) async {
    return authenticationRemoteDataSource.authenticateWithPhone(phoneNumber);
  }

  @override
  Future<bool> verifyOtp(String otp) async {
    return authenticationRemoteDataSource.verifyOtp(otp);
  }
}
