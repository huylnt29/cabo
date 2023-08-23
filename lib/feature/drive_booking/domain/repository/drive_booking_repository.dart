import 'package:cabo_customer/core/network/local/isar/isar_database.dart';
import 'package:cabo_customer/feature/drive_booking/data/model/booking_response.dart';
import 'package:cabo_customer/feature/drive_booking/data/model/trip_estimation.dart';
import 'package:dio/dio.dart';
import 'package:huylnt_flutter_component/reusable_core/extensions/logger.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/model/address.dart';
import '../../../../core/model/location.dart';
import '../../../../core/network/remote/cabo_server/api_client.dart';
import '../../../account/data/model/account_model.dart';

part '../../data/remote_data_source/drive_booking_remote_data_source.dart';

abstract class DriveBookingRepository {
  final DriveBookingRemoteDataSource driveBookingRemoteDataSource;
  DriveBookingRepository(this.driveBookingRemoteDataSource);

  Future<List<Address>> getAddressList(String keyword);
  Future<TripEstimation> getTripEstimation(
    Address fromAddress,
    Address toAddress,
  );
  Future<dynamic> proceedBooking(
    Location fromLocation,
    Location toLocation,
    TripEstimation tripEstimation,
    int vehicleType,
    int paymentMethod,
  );
}

@Injectable(as: DriveBookingRepository)
class DriveBookingRepositoryImpl extends DriveBookingRepository
    with IsarDatabase {
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

  @override
  Future<dynamic> proceedBooking(
    Location fromLocation,
    Location toLocation,
    TripEstimation tripEstimation,
    int vehicleType,
    int paymentMethod,
  ) async {
    final account = await isarInstance!.collection<Account>().get(1);
    final response = await driveBookingRemoteDataSource.proceedBooking(
      account!,
      fromLocation,
      toLocation,
      tripEstimation,
      vehicleType,
      paymentMethod,
    );
    return response;
  }
}
