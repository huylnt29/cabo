import 'package:cabo_customer/feature/trip_history/data/model/trip_model.dart';
import 'package:cabo_customer/feature/trip_history/domain/repository/trip_history_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:huylnt_flutter_component/reusable_core/enums/load_state.dart';
import 'package:huylnt_flutter_component/reusable_core/extensions/logger.dart';

part 'trip_history_state.dart';

part 'trip_history_cubit.freezed.dart';

class TripHistoryCubit extends Cubit<TripHistoryState> {
  TripHistoryCubit(this.repository)
      : super(
          const TripHistoryState(
            loadState: LoadState.initial,
          ),
        );
  final TripHistoryRepository repository;

  Future<void> getTripHistory() async {
    emit(state.copyWith(loadState: LoadState.loading));
    try {
      final response = await repository.getTrips();
      emit(state.copyWith(
        loadState: LoadState.loaded,
        trips: response,
      ));
    } on Exception catch (error) {
      Logger.e(error);
      emit(state.copyWith(loadState: LoadState.error));
    }
  }
}
