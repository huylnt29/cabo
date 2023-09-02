import 'package:json_annotation/json_annotation.dart';
import 'package:isar/isar.dart';

import '../../../../core/enums/payment_method.dart';
import '../../../../core/enums/vehicle_type.dart';
import '../../../../core/model/address.dart';

part 'form_booking_request.g.dart';

@JsonSerializable()
@embedded
class FormBookingRequest {
  Address? fromAddress;
  Address? toAddress;
  @enumerated
  PaymentMethod paymentMethod = PaymentMethod.cash;
  @enumerated
  VehicleType vehicleType = VehicleType.car4;
}
