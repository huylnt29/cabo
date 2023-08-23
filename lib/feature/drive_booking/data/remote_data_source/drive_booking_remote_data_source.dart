part of '../../domain/repository/drive_booking_repository.dart';

class DriveBookingRemoteDataSource {
  final ApiClient apiClient;
  DriveBookingRemoteDataSource(this.apiClient);

  Future<List<Address>> getAddressList(String keyword) async {
    final response = await apiClient.getAddressList(keyword);
    return response;
  }

  Future<TripEstimation> getTripEstimation(
      Location fromLocation, Location toLocation) async {
    final response = await apiClient.postLocations({
      'fromLocation': fromLocation.toJson(),
      'toLocation': toLocation.toJson()
    });
    return response;
  }
}
