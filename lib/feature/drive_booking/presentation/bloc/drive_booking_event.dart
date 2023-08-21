part of 'drive_booking_bloc.dart';

abstract class DriveBookingEvent {}

class GetAddressList extends DriveBookingEvent {
  GetAddressList(this.locationKeyword);
  final String locationKeyword;
}
