import 'package:cabo_customer/core/network/remote/cabo_server/cabo_client.dart';

class AuthenticationRemoteDataSource {
  AuthenticationRemoteDataSource(this._caboClient);
  final CaboClient _caboClient;

  Future<bool> checkPhone(String phoneNumber) async {
    final response = await _caboClient.checkPhone({'phoneNumber': phoneNumber});
    return response['isExisted'];
  }
}
