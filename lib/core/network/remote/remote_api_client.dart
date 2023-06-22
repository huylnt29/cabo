import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

part 'api_client.g.dart';

@RestApi()
abstract class RemoteApiClient {
  factory RemoteApiClient(
    Dio dio, {
    String baseUrl,
  }) = _RemoteApiClient;

  @POST('/check-phone')
  // Part of login process, check whether phone number (as username) existed in database or not
  Future<bool> checkPhone(
    @Body() Map<String, String> phoneCheckBody,
  );

  @POST('/check-otp')
  // Part of login process, check whether otp code matched the one in server
  Future<bool> checkOTP(
    @Body() Map<String, String> phoneCheckBody,
  );
}
