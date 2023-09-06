part of '../../domain/repository/trip_history_repository.dart';

class TripHistoryRemoteDataSource {
  TripHistoryRemoteDataSource(this.apiClient);
  final ApiClient apiClient;

  Future<List<Trip>?> getTrips(String customerId) async {
    try {
      return await apiClient.getTrips(customerId);
    } catch (error) {
      Logger.e(error);
    }
    return null;
  }
}
