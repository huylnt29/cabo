import 'dart:convert';

import 'package:cabo_customer/core/network/remote/cabo_server/cabo_client.dart';

class AuthenticationRemoteDataSource {
  AuthenticationRemoteDataSource(this._caboClient);
  final CaboClient _caboClient;

  Future<bool> checkPhone(String phoneNumber) async {
    final response = await _caboClient.checkPhone({'phoneNumber': phoneNumber});
    return response['isExisted'];
  }

  Future<String> signUpWithCaboServer(
      String phoneNumber, String fullName) async {
    final response = await _caboClient.signUpWithCaboServer({
      'phoneNumber': phoneNumber,
      'fullName': fullName,
    });
    final decodedResponse = json.decode(response);
    return decodedResponse['customerId'];
  }
}
