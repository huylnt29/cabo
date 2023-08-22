import 'package:freezed_annotation/freezed_annotation.dart';
part 'location.g.dart';

@JsonSerializable()
class Location {
  Location(this.lat, this.long);
  factory Location.fromJson(Map<String, Object?> json) =>
      _$LocationFromJson(json);

  Map<String, dynamic> toJson() => _$LocationToJson(this);

  @JsonKey(name: 'latitude')
  double lat;

  @JsonKey(name: 'longitude')
  double long;
}
