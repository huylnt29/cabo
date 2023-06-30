import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'cabo_client.g.dart';

@RestApi()
abstract class CaboClient {
  factory CaboClient(
    Dio dio, {
    String baseUrl,
  }) = _CaboClient;

  @POST('/get-id')
  // After logging in successfully with Firebase, ask server for an ID in Cloud firestore
  Future<String> getId(
    @Body() String firebaseIdToken,
  );

  @POST('/check-phone-existence')
  // Check phone before Firebase process
  Future<dynamic> checkPhone(
    @Body() Map<String, dynamic> body,
  );
}
