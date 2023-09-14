import 'package:cabo_customer/core/enums/payment_method.dart';

import 'package:huylnt_flutter_component/reusable_core/extensions/date_time.dart';

import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';

import 'trip_status_enum.dart';

part 'trip_model.g.dart';

@JsonSerializable()
class Trip {
  Trip({
    this.id,
    this.cost,
    this.distance,
    this.startTime,
    this.endTime,
    this.orderLocation,
    this.toLocation,
    this.paymentType,
  });
  @JsonKey(name: 'tripId')
  String? id;
  String? cost;
  String? distance;
  int? startTime;
  int? endTime;
  @JsonKey(name: 'customerOrderLocation')
  String? orderLocation;
  String? toLocation;
  @enumerated
  PaymentMethod? paymentType;
  @enumerated
  TripStatus? status;
  factory Trip.fromJson(Map<String, Object?> json) => _$TripFromJson(json);

  // String get formattedCost =>
  //     (cost != null) ? '$cost VND' : ErrorMessage.isNotDetermined;

  // String get formattedDistance =>
  //     (distance != null) ? '$distance km' : ErrorMessage.isNotDetermined;

  String get formattedStartTime => startTime.dateTime.timeFirstDateAfter;

  String get formattedEndTime => endTime.dateTime.timeFirstDateAfter;
}
