import 'package:json_annotation/json_annotation.dart';

import '../../../../core/model/location.dart';

part 'booking_response.g.dart';

@JsonSerializable()
class BookingResponse {
  BookingResponse({required this.tripId, required this.driver});
  factory BookingResponse.fromJson(Map<String, Object?> json) =>
      _$BookingResponseFromJson(json);

  String tripId;
  Driver driver;
}

@JsonSerializable()
class Driver {
  Driver({
    required this.fullName,
    required this.phoneNumber,
    this.avatar,
    required this.brand,
    required this.regNo,
    required this.location,
  });
  factory Driver.fromJson(Map<String, Object?> json) => _$DriverFromJson(json);

  String fullName;
  String phoneNumber;
  String? avatar;
  String brand;
  String regNo;
  Location location;
}
