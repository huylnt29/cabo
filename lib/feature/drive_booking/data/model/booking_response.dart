import 'package:cabo_customer/feature/drive_booking/data/model/form_booking_request.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:isar/isar.dart';

import '../../../../core/model/address.dart';
import '../../../../core/model/location.dart';
part 'booking_response.g.dart';

@JsonSerializable()
@collection
class BookingResponse {
  BookingResponse({
    required this.tripId,
    required this.driver,
    this.request,
  });

  factory BookingResponse.fromJson(Map<String, Object?> json) =>
      _$BookingResponseFromJson(json);

  @JsonKey(includeFromJson: false)
  Id modelKey = Isar.autoIncrement;
  String tripId;
  @JsonKey(name: 'driverInfo')
  Driver driver;
  @JsonKey(includeFromJson: false)
  FormBookingRequest? request;

  BookingResponse copyWith({FormBookingRequest? formBookingRequest}) =>
      BookingResponse(
        tripId: tripId,
        driver: driver,
        request: formBookingRequest ?? request,
      );
}

@JsonSerializable()
@embedded
class Driver {
  Driver({
    this.fullName,
    this.phoneNumber,
    this.avatar,
    this.brand,
    this.regNo,
    // required this.realAddress,
  });

  factory Driver.fromJson(Map<String, Object?> json) => _$DriverFromJson(json);

  String? fullName;
  String? phoneNumber;
  String? avatar;
  String? brand;
  String? regNo;
  // @JsonKey(name: 'location')
  // String realAddress;
}
