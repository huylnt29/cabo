import 'package:bloc/bloc.dart';

import 'package:cabo_customer/feature/drive_booking/data/model/booking_response.dart';
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
    on<FetchCurrentBookingEvent>((event, emit) async {
      try {
        final response = await driveBookingRepository.getFirstBookingResponse();
        emit(state.copyWith(bookingResponse: response));
      } catch (error) {
        Logger.e(error);
      }
    });

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

      try {
        final response = await driveBookingRepository.proceedBooking(
          event.fromAddress.location!,
          event.toAddress.location!,
          state.tripEstimation!,
          event.vehicleType,
          event.paymentMethod,
        );
        if (response is BookingResponse) {
          emit(state.copyWith(
            bookingResponse: response,
            bookingLoadState: LoadState.loaded,
          ));
          await driveBookingRepository.saveBookingResponse(response);
        } else {
          emit(state.copyWith(
            bookingResponse: BookingResponse(
              tripId: '123456',
              driver: Driver(
                fullName: 'Le Minh Nhat',
                phoneNumber: '0774848931',
                brand: 'Yamaha',
                regNo: 'AbcXyz',
              ),
            ),
            bookingLoadState: LoadState.loaded,
          ));
          // TODO: Remove faked flow
          await driveBookingRepository.saveBookingResponse(response);
        }
      } catch (error) {
        Logger.e(error);
        emit(state.copyWith(bookingLoadState: LoadState.error));
      }
    });

    on<ResetBookingEvent>((event, emit) async {
      await Future.delayed(
        const Duration(seconds: 1),
        () => emit(state.copyWith(bookingLoadState: LoadState.initial)),
      );
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