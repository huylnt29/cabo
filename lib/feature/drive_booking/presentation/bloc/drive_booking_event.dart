part of 'drive_booking_bloc.dart';

abstract class DriveBookingEvent {}

class FetchCurrentBookingEvent extends DriveBookingEvent {
  FetchCurrentBookingEvent();
}

class GetAddressListEvent extends DriveBookingEvent {
  GetAddressListEvent(this.locationKeyword);
  final String locationKeyword;
}

class ConfirmBookingEvent extends DriveBookingEvent {
  ConfirmBookingEvent(
    this.fromAddress,
    this.toAddress,
    this.paymentMethod,
    this.vehicleType,
  );
  final Address fromAddress;
  final Address toAddress;
  final PaymentMethod paymentMethod;
  final VehicleType vehicleType;

  String get string =>
      '${fromAddress.toJson()} - ${toAddress.toJson()} - $paymentMethod - $vehicleType';
}

class ResetBookingEvent extends DriveBookingEvent {
  ResetBookingEvent();
}

class TripEstimatingEvent extends DriveBookingEvent {
  TripEstimatingEvent(
    this.fromAddress,
    this.toAddress,
    this.vehicleType,
  );
  final Address fromAddress;
  final Address toAddress;
  final VehicleType vehicleType;
}
