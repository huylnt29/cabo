import 'package:json_annotation/json_annotation.dart';

part 'trip_estimation.g.dart';

@JsonSerializable()
class TripEstimation {
  TripEstimation({required this.cost, required this.distance});
  factory TripEstimation.fromJson(Map<String, Object?> json) =>
      _$TripEstimationFromJson(json);

  String cost;
  String distance;

  // String get formattedDistance => '${distance.toStringAsFixed(0)} km';
  // String get formattedCost => '${cost.toStringAsFixed(0)} VND';
}
