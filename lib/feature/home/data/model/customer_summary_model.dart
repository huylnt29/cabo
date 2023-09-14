import 'package:json_annotation/json_annotation.dart';

import '../../../trip_history/data/model/trip_model.dart';

part 'customer_summary_model.g.dart';

@JsonSerializable()
class CustomerSummary {
  CustomerSummary({
    this.totalTrip,
    this.recentTrip,
  });

  factory CustomerSummary.fromJson(Map<String, Object?> json) =>
      _$CustomerSummaryFromJson(json);

  int? totalTrip;
  Trip? recentTrip;
}
