import 'package:cabo_customer/feature/notification/data/notification_category_enum.dart';
import 'package:cabo_customer/feature/notification/presentation/bloc/notification_bloc.dart';
import 'package:firebase_messaging/firebase_messaging.dart';

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

        default:
          break;
      }
    }
  }
}
