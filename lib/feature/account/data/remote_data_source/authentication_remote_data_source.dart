import 'package:cabo_customer/core/network/remote/cabo_server/api_client.dart';

class AuthenticationRemoteDataSource {
  AuthenticationRemoteDataSource(this._caboClient);
  final ApiClient _caboClient;

  Future<bool> checkPhone(String phoneNumber) async {
    final response = await _caboClient.checkPhone({'phoneNumber': phoneNumber});
    return response['isExisted'];
  }

  Future<String> signUpWithCaboServer(
    String phoneNumber,
    String fullName,
  ) async {
    // TODO: Re-open later
    // final response = await _caboClient.signUpWithCaboServer({
    //   'phoneNumber': phoneNumber,
    //   'fullName': fullName,
    // });
    // return response['customerId'];
    return 'Y4mfdJaVfsbESIbICfSh';
  }
}
