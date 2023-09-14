part of 'notification_bloc.dart';

abstract class NotificationEvent {}

class UpdateDriverArrivalStatusEvent extends NotificationEvent {
  UpdateDriverArrivalStatusEvent({
    required this.remainingDistance,
    required this.remainingTime,
  });
  final String remainingTime;
  final String remainingDistance;
}

class AnnounceDriverArrivedEvent extends NotificationEvent {
  AnnounceDriverArrivedEvent();
}

class ResetDriverArrivedEvent extends NotificationEvent {
  ResetDriverArrivedEvent();
}

class AnnounceTripDoneEvent extends NotificationEvent {
  AnnounceTripDoneEvent();
}

class ResetTripDoneEvent extends NotificationEvent {
  ResetTripDoneEvent();
}
