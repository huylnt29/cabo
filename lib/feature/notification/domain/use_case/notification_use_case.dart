import 'package:cabo_customer/core/extensions/build_context.dart';
import 'package:cabo_customer/feature/drive_booking/domain/repository/drive_booking_repository.dart';
import 'package:cabo_customer/feature/drive_booking/presentation/bloc/drive_booking_bloc.dart';
import 'package:cabo_customer/feature/notification/data/notification_category_enum.dart';
import 'package:cabo_customer/feature/notification/presentation/bloc/notification_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';

import '../../../../core/service_locator/service_locator.dart';

class NotificationUseCase {
  NotificationUseCase();
  void handleFcmData(
    RemoteMessage fcmMessage,
    BuildContext context,
  ) {
    String? category = fcmMessage.data['category'];
    if (category != null) {
      switch (category.correspondingNotificationCategoryFromFcm) {
        case NotificationCategory.updateDriverDistanceAndTime:
          context.notificationBloc.add(UpdateDriverArrivalStatusEvent(
            remainingDistance: fcmMessage.data['driverRemainingDistance'],
            remainingTime: fcmMessage.data['driverRemainingTime'],
          ));
          break;
        case NotificationCategory.informDriverArrived:
          context.notificationBloc.add(AnnounceDriverArrivedEvent());
          break;
        case NotificationCategory.informTripDone:
          context.notificationBloc.add(AnnounceTripDoneEvent());
          context.driveBookingBloc.add(ResetBookingEvent());
          getIt<DriveBookingRepository>().deleteFirstBookingResponse();
          break;

        default:
          break;
      }
    }
  }
}
