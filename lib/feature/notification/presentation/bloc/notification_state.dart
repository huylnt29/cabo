part of 'notification_bloc.dart';

@freezed
class NotificationState with _$NotificationState {
  const factory NotificationState({
    String? driverRemainingDistance,
    String? driverRemainingTime,
    bool? didDriverArrive,
    bool? didTripDone,
  }) = _NotificationState;
}
