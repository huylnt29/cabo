import 'package:cabo_customer/core/enums/payment_type.dart';

import 'package:isar/isar.dart';
import 'package:json_annotation/json_annotation.dart';
part 'trip_model.g.dart';

@JsonSerializable()
class Trip {
  Trip({
    required this.id,
    this.cost,
    this.distance,
    this.startTime,
    this.endTime,
    this.customerOrderLocation,
    this.toLocation,
    this.paymentType,
  });

  String id;
  int? cost;
  int? distance;
  int? startTime;
  int? endTime;
  String? customerOrderLocation;
  String? toLocation;
  @enumerated
  PaymentType? paymentType;

  factory Trip.fromJson(Map<String, Object?> json) => _$TripFromJson(json);
}
