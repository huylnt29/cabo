import 'package:cabo_customer/feature/drive_booking/domain/repository/drive_booking_repository.dart';
import 'package:cabo_customer/feature/notification/data/notification_category_enum.dart';
import 'package:cabo_customer/feature/notification/presentation/bloc/notification_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

import '../../../../core/service_locator/service_locator.dart';

class NotificationUseCase {
  NotificationUseCase();
  void handleFcmData(
    RemoteMessage fcmMessage,
    NotificationBloc notificationBloc,
  ) {
    String? category = fcmMessage.data['category'];
    if (category != null) {
      switch (category.correspondingNotificationCategoryFromFcm) {
        case NotificationCategory.updateDriverDistanceAndTime:
          notificationBloc.add(UpdateDriverArrivalStatusEvent(
            remainingDistance: fcmMessage.data['driverRemainingDistance'],
            remainingTime: fcmMessage.data['driverRemainingTime'],
          ));
          break;
        case NotificationCategory.informTripDone:
          getIt<DriveBookingRepository>().deleteFirstBookingResponse();
          break;
        default:
          break;
      }
    }
  }
}
