import 'package:cabo_customer/core/enums/payment_type.dart';
import 'package:huylnt_flutter_component/reusable_core/constants/error_message.dart';
import 'package:huylnt_flutter_component/reusable_core/extensions/date_time.dart';

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

  String get formattedCost =>
      (cost != null) ? '$cost VND' : ErrorMessage.isNotDetermined;

  String get formattedDistance =>
      (distance != null) ? '$distance km' : ErrorMessage.isNotDetermined;

  String get formattedStartTime => startTime.dateTime.timeFirstDateAfter;

  String get formattedEndTime => endTime.dateTime.timeFirstDateAfter;
}
