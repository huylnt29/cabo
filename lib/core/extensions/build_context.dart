import 'package:cabo_customer/feature/drive_booking/presentation/bloc/drive_booking_bloc.dart';
import 'package:cabo_customer/feature/notification/presentation/bloc/notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

extension ShortBuildContext on BuildContext {
  Bloc get notificationBloc {
    return read<NotificationBloc>();
  }

  Bloc get driveBookingBloc {
    return read<DriveBookingBloc>();
  }
}
