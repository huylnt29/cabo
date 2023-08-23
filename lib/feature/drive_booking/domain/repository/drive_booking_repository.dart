import 'package:cabo_customer/feature/drive_booking/data/model/trip_estimation.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/model/address.dart';
import '../../../../core/model/location.dart';
import '../../../../core/network/remote/cabo_server/api_client.dart';

part '../../data/remote_data_source/drive_booking_remote_data_source.dart';

abstract class DriveBookingRepository {
  final DriveBookingRemoteDataSource driveBookingRemoteDataSource;
  DriveBookingRepository(this.driveBookingRemoteDataSource);

  Future<List<Address>> getAddressList(String keyword);
  Future<TripEstimation> getTripEstimation(
    Address fromAddress,
    Address toAddress,
  );
}

@Injectable(as: DriveBookingRepository)
class DriveBookingRepositoryImpl extends DriveBookingRepository {
  DriveBookingRepositoryImpl(super.driveBookingRemoteDataSource);

  @override
  Future<List<Address>> getAddressList(String keyword) async {
    final response = await driveBookingRemoteDataSource.getAddressList(keyword);
    return response;
  }

  @override
  Future<TripEstimation> getTripEstimation(
    Address fromAddress,
    Address toAddress,
  ) async {
    final response = await driveBookingRemoteDataSource.getTripEstimation(
      fromAddress.location,
      toAddress.location,
    );
    return response;
  }
}
