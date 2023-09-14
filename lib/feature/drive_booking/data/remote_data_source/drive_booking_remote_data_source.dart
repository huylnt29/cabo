part of '../../domain/repository/drive_booking_repository.dart';

class DriveBookingRemoteDataSource {
  final ApiClient apiClient;
  DriveBookingRemoteDataSource(this.apiClient);

  Future<List<Address>> getAddressList(String keyword) async {
    final response = await apiClient.getAddressList(keyword);
    return response;
  }

  Future<TripEstimation> getTripEstimation(
    Location fromLocation,
    Location toLocation,
    String vehicleType,
  ) async {
    final response = await apiClient.postLocations({
      'fromLocation': fromLocation.toJson(),
      'toLocation': toLocation.toJson(),
      'vehicleType': vehicleType
    });
    return response;
  }

  Future<dynamic> proceedBooking(
    Account account,
    Location fromLocation,
    Location toLocation,
    TripEstimation tripEstimation,
    String vehicleType,
    int paymentMethod,
  ) async {
    try {
      final response = await apiClient.proceedBooking(
        account.id!,
        {
          'customerOrderLocation': fromLocation.toJson(),
          'toLocation': toLocation.toJson(),
          'customerPhoneNumber': account.phoneNumber,
          'distance': tripEstimation.distance,
          'cost': tripEstimation.cost,
          'carType': vehicleType,
          'paymentType': paymentMethod
        },
      );
      return response!;
    } on DioException catch (error) {
      Logger.e(error);
      return null;
    }
  }
}
