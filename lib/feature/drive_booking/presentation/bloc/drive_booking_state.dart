part of 'drive_booking_bloc.dart';

@freezed
class DriveBookingState with _$DriveBookingState {
  const factory DriveBookingState({
    @Default([]) List<Address> addressList,
    required LoadState addressListLoadState,
    TripEstimation? tripEstimation,
    required LoadState tripEstimationLoadState,
    required LoadState bookingLoadState,
  }) = _DriveBookingState;
}
