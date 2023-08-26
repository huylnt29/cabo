enum NotificationCategory { updateDriverDistanceAndTime, informTripDone }

extension NotificationCategoryUtil on NotificationCategory {
  String get serverKey {
    switch (this) {
      case NotificationCategory.updateDriverDistanceAndTime:
        return 'UPDATE_DRIVER_DISTANCE_AND_TIME';
      case NotificationCategory.informTripDone:
        return 'INFORM_TRIP_DONE';
    }
  }
}

extension StringXForNotificationCategory on String {
  NotificationCategory? get correspondingNotificationCategoryFromFcm {
    return NotificationCategory.values.firstWhere(
      (element) => element.serverKey == this,
    );
  }
}
