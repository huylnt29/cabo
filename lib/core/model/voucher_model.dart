import 'package:cabo_customer/core/constants/error_message.dart';
import 'package:cabo_customer/core/converter/datetime_converter.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';
part 'voucher_model.g.dart';

@JsonSerializable()
@collection
class Voucher {
  Voucher({
    bool saved = false,
    bool used = false,
    required this.id,
    this.title,
    this.remaining,
    this.total,
    this.expirationEpochTime,
  });
  Id isarKey = Isar.autoIncrement;
  String id;
  String? title;
  int? remaining;
  int? total;
  double? expirationEpochTime;

  factory Voucher.fromJson(Map<String, Object?> json) =>
      _$VoucherFromJson(json);

  String get expirationDate {
    return DateTimeConverter.getDate(expirationEpochTime);
  }
}
