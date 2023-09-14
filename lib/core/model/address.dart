import 'package:cabo_customer/core/model/location.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
part 'address.g.dart';

@JsonSerializable()
@embedded
class Address {
  Address({this.address, this.location});
  factory Address.fromJson(Map<String, Object?> json) =>
      _$AddressFromJson(json);

  Map<String, dynamic> toJson() => _$AddressToJson(this);

  Location? location;
  String? address;
}
