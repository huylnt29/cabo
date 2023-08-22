part of 'drive_booking_bloc.dart';

abstract class DriveBookingEvent {}

class GetAddressListEvent extends DriveBookingEvent {
  GetAddressListEvent(this.locationKeyword);
  final String locationKeyword;
}

class ConfirmBookingEvent extends DriveBookingEvent {
  ConfirmBookingEvent(
    this.fromLocation,
    this.toLocation,
    this.paymentMethod,
    this.vehicleType,
  );
  final Address fromLocation;
  final Address toLocation;
  final int paymentMethod;
  final int vehicleType;

  String get string =>
      '${fromLocation.toJson()} - ${toLocation.toJson()} - $paymentMethod - $vehicleType';
}
