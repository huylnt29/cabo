import 'package:json_annotation/json_annotation.dart';

part 'trip_estimation.g.dart';

@JsonSerializable()
class TripEstimation {
  TripEstimation({required this.cost, required this.distance});
  factory TripEstimation.fromJson(Map<String, Object?> json) =>
      _$TripEstimationFromJson(json);

  double cost;
  double distance;
}
