import 'package:bloc/bloc.dart';
import 'package:cabo_customer/core/enums/payment_method.dart';
import 'package:cabo_customer/core/enums/vehicle_type.dart';
import 'package:cabo_customer/feature/drive_booking/data/model/trip_estimation.dart';
import 'package:cabo_customer/feature/drive_booking/domain/repository/drive_booking_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:huylnt_flutter_component/reusable_core/enums/load_state.dart';
import 'package:huylnt_flutter_component/reusable_core/extensions/logger.dart';

import '../../../../core/model/address.dart';

part 'drive_booking_event.dart';
part 'drive_booking_state.dart';
part 'drive_booking_bloc.freezed.dart';

class DriveBookingBloc extends Bloc<DriveBookingEvent, DriveBookingState> {
  DriveBookingBloc(this.driveBookingRepository)
      : super(const DriveBookingState(
          bookingLoadState: LoadState.initial,
          addressListLoadState: LoadState.initial,
          tripEstimationLoadState: LoadState.initial,
        )) {
    on<GetAddressListEvent>((event, emit) async {
      emit(state.copyWith(addressListLoadState: LoadState.loading));
      try {
        final response = await driveBookingRepository.getAddressList(
          event.locationKeyword,
        );
        emit(state.copyWith(
          addressList: response,
          addressListLoadState: LoadState.loaded,
        ));
      } catch (error) {
        Logger.e(error);
        emit(state.copyWith(addressListLoadState: LoadState.error));
      }
    });

    on<ConfirmBookingEvent>((event, emit) async {
      Logger.v('Right before confirming booking: ${event.string}');
      emit(state.copyWith(bookingLoadState: LoadState.loading));
    });

    on<TripEstimatingEvent>((event, emit) async {
      emit(state.copyWith(tripEstimationLoadState: LoadState.loading));
      try {
        final response = await driveBookingRepository.getTripEstimation(
          event.fromAddress,
          event.toAddress,
        );
        emit(state.copyWith(
          tripEstimation: response,
          tripEstimationLoadState: LoadState.loaded,
        ));
      } catch (error) {
        Logger.e(error);
        emit(state.copyWith(tripEstimationLoadState: LoadState.error));
      }
    });
  }
  final DriveBookingRepository driveBookingRepository;
}
