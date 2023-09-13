import 'package:cabo_customer/core/enums/favorite_place.dart';
import 'package:cabo_customer/core/enums/payment_method.dart';
import 'package:cabo_customer/core/enums/vehicle_type.dart';
import 'package:cabo_customer/core/network/local/isar/isar_database.dart';
import 'package:cabo_customer/core/service_locator/service_locator.dart';
import 'package:cabo_customer/feature/account/data/local_data_source/authentication_local_data_source.dart';
import 'package:cabo_customer/feature/drive_booking/data/model/booking_response.dart';
import 'package:cabo_customer/feature/drive_booking/data/model/form_booking_request.dart';

import 'package:cabo_customer/feature/drive_booking/data/model/trip_estimation.dart';
import 'package:cabo_customer/feature/favorite_location/data/model/favorite_location_model.dart';
import 'package:dio/dio.dart';
import 'package:huylnt_flutter_component/reusable_core/extensions/date_time.dart';
import 'package:huylnt_flutter_component/reusable_core/extensions/logger.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import '../../../../core/model/address.dart';
import '../../../../core/model/location.dart';
import '../../../../core/network/remote/cabo_server/api_client.dart';
import '../../../account/data/model/account_model.dart';
import '../../../favorite_location/domain/repository/favorite_location_repository.dart';

part '../../data/remote_data_source/drive_booking_remote_data_source.dart';
part '../../data/local_data_source/drive_booking_local_data_source.dart';

abstract class DriveBookingRepository {
  DriveBookingRepository();

  Future<List<Address>> getAddressList(String keyword);
  Future<TripEstimation> getTripEstimation(
    Address fromAddress,
    Address toAddress,
    VehicleType vehicleType,
  );
  Future<dynamic> proceedBooking(
    Location fromLocation,
    Location toLocation,
    TripEstimation tripEstimation,
    VehicleType vehicleType,
    PaymentMethod paymentMethod,
  );
  Future<BookingResponse?> getFirstBookingResponse();
  Future<int> saveBookingResponse(
    BookingResponse bookingResponse,
    FormBookingRequest bookingRequest,
  );
  Future<bool> deleteFirstBookingResponse();
}

@Injectable(as: DriveBookingRepository)
class DriveBookingRepositoryImpl extends DriveBookingRepository {
  DriveBookingRepositoryImpl(
    this.remoteDataSource,
    this.localDataSource,
    this.favoriteLocationLocalDataSource,
  );
  final DriveBookingRemoteDataSource remoteDataSource;
  final DriveBookingLocalDataSource localDataSource;
  final FavoriteLocationLocalDataSource favoriteLocationLocalDataSource;

  @override
  Future<List<Address>> getAddressList(String keyword) async {
    final response = await remoteDataSource.getAddressList(keyword);
    return response;
  }

  @override
  Future<TripEstimation> getTripEstimation(
    Address fromAddress,
    Address toAddress,
    VehicleType vehicleType,
  ) async {
    final response = await remoteDataSource.getTripEstimation(
      fromAddress.location!,
      toAddress.location!,
      vehicleType.serverKey,
    );
    return response;
  }

  @override
  Future<dynamic> proceedBooking(
    Location fromLocation,
    Location toLocation,
    TripEstimation tripEstimation,
    VehicleType vehicleType,
    PaymentMethod paymentMethod,
  ) async {
    final account =
        await getIt<AuthenticationLocalDataSource>().getFirstAccount();
    final response = await remoteDataSource.proceedBooking(
      account!,
      fromLocation,
      toLocation,
      tripEstimation,
      vehicleType.serverKey,
      paymentMethod.serverKey,
    );
    return response;
  }

  @override
  Future<BookingResponse?> getFirstBookingResponse() async {
    return localDataSource.getFirstBookingResponse();
  }

  @override
  Future<int> saveBookingResponse(
    BookingResponse bookingResponse,
    FormBookingRequest bookingRequest,
  ) async {
    return localDataSource.saveBookingResponse(
      bookingResponse.copyWith(
        formBookingRequest: bookingRequest,
      ),
    );
  }

  @override
  Future<bool> deleteFirstBookingResponse() async {
    final bookingResponse = await localDataSource.getFirstBookingResponse();
    if (bookingResponse != null) {
      await handleSaveFavoriteLocation(bookingResponse.request!.fromAddress!);
      await handleSaveFavoriteLocation(bookingResponse.request!.toAddress!);
    }
    return localDataSource.deleteFirstBookingResponse();
  }

  Future<dynamic> handleSaveFavoriteLocation(Address address) async {
    final favoriteLocation =
        await favoriteLocationLocalDataSource.checkLocalExistence(
      address.location!,
    );
    return (favoriteLocation == null)
        ? favoriteLocationLocalDataSource.putFavoriteLocation(
            'A place on ${DateTime.now().timeFirstDateAfter}',
            FavoritePlace.recent,
            address.address!,
            address.location!,
          )
        : favoriteLocationLocalDataSource.updateByKey(favoriteLocation);
  }
}
