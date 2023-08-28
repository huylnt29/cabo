import 'package:json_annotation/json_annotation.dart';
import 'package:isar/isar.dart';
part 'booking_response.g.dart';

@JsonSerializable()
@collection
class BookingResponse {
  BookingResponse({required this.tripId, required this.driver});
  factory BookingResponse.fromJson(Map<String, Object?> json) =>
      _$BookingResponseFromJson(json);
  @JsonKey(includeFromJson: false)
  Id modelKey = Isar.autoIncrement;
  String tripId;
  @JsonKey(name: 'driverInfo')
  Driver driver;
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
