part of 'favorite_location_bloc.dart';

@freezed
class FavoriteLocationState with _$FavoriteLocationState {
  const factory FavoriteLocationState({
    List<FavoriteLocation>? favoriteLocations,
    required LoadState loadState,
    required LoadState newLocationLoadState,
    required LoadState deleteLocationLoadState,
  }) = _FavoriteLocationState;
}
