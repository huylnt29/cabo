import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'notification_event.dart';
part 'notification_state.dart';
part 'notification_bloc.freezed.dart';

class NotificationBloc extends Bloc<NotificationEvent, NotificationState> {
  NotificationBloc() : super(const NotificationState()) {
    on<UpdateDriverArrivalStatusEvent>((event, emit) {
      emit(state.copyWith(
        driverRemainingDistance: event.remainingDistance,
        driverRemainingTime: event.remainingTime,
      ));
    });
    on<AnnounceDriverArrivedEvent>(
      (event, emit) => emit(state.copyWith(didDriverArrive: true)),
    );
    on<ResetDriverArrivedEvent>(
      (event, emit) => emit(state.copyWith(didDriverArrive: false)),
    );
  }
}
