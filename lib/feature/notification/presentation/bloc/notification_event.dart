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
