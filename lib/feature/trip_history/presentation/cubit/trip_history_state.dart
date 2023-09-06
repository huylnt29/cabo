part of 'trip_history_cubit.dart';

@freezed
class TripHistoryState with _$TripHistoryState {
  const factory TripHistoryState({
    List<Trip>? trips,
    required LoadState loadState,
  }) = _TripHistoryState;
}
