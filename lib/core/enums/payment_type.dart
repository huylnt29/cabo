import 'package:freezed_annotation/freezed_annotation.dart';

enum PaymentType {
  @JsonValue(1)
  cash,
  @JsonValue(2)
  digital,
  none,
}
