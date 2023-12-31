import 'package:cabo_customer/feature/drive_booking/data/model/booking_response.dart';
import 'package:cabo_customer/feature/drive_booking/data/model/trip_estimation.dart';
import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import '../../../../feature/home/data/model/customer_summary_model.dart';
import '../../../../feature/trip_history/data/model/trip_model.dart';
import '../../../model/address.dart';

part 'api_client.g.dart';

@RestApi()
abstract class ApiClient {
  factory ApiClient(
    Dio dio, {
    String baseUrl,
  }) = _ApiClient;

  /// After logging in successfully with Firebase, ask server for customer document ID in Firebase database
  @POST('/customer/auth/register')
  Future<dynamic> signUpWithCaboServer(
    @Body() Map<String, dynamic> body,
  );

  @POST('/customer/check-phone-existence')
  Future<dynamic> checkPhone(
    @Body() Map<String, dynamic> body,
  );

  @GET('/customer/notification/subscribe/{fcmToken}')
  Future<HttpResponse> postFcmToken(@Path() String fcmToken);

  @GET('/customer/{customerId}/overview')
  Future<CustomerSummary> getCustomerOverview(
    @Path() String customerId,
  );

  @POST('/bing-map/drive-booking/estimate-cost')
  Future<TripEstimation> postLocations(
    @Body() Map<String, dynamic> body,
  );

  @POST('/customer/drive-booking/confirm/{customerId}')
  Future<BookingResponse?> proceedBooking(
    @Path() String customerId,
    @Body() Map<String, dynamic> body,
  );

  @GET('/bing-map/get-list-places')
  Future<List<Address>> getAddressList(
    @Query('searchLocation') String locationHint,
  );

  @GET('/trip/customer/{customerId}')
  Future<List<Trip>> getTrips(
    @Path() String customerId,
  );
}
