import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'cabo_client.g.dart';

@RestApi()
abstract class CaboClient {
  factory CaboClient(
    Dio dio, {
    String baseUrl,
  }) = _CaboClient;

  @POST('/auth/register')
  // After logging in successfully with Firebase, ask server for an ID in Firebase database
  Future<dynamic> signUpWithCaboServer(
    @Body() Map<String, dynamic> body,
  );

  @POST('/check-phone-existence')
  Future<dynamic> checkPhone(
    @Body() Map<String, dynamic> body,
  );
}
