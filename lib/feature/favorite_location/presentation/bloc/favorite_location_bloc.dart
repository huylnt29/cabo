import 'package:bloc/bloc.dart';
import 'package:cabo_customer/core/enums/favorite_place.dart';
import 'package:cabo_customer/core/model/address.dart';
import 'package:cabo_customer/feature/favorite_location/data/model/favorite_location_model.dart';
import 'package:cabo_customer/feature/favorite_location/domain/repository/favorite_location_repository.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:huylnt_flutter_component/reusable_core/enums/load_state.dart';
import 'package:huylnt_flutter_component/reusable_core/extensions/logger.dart';

import '../../../../core/model/location.dart';

part 'favorite_location_event.dart';
part 'favorite_location_state.dart';

part 'favorite_location_bloc.freezed.dart';

class FavoriteLocationBloc
    extends Bloc<FavoriteLocationEvent, FavoriteLocationState> {
  late FavoritePlace favoritePlace;
  FavoriteLocationBloc(this.repository)
      : super(const FavoriteLocationState(
          loadState: LoadState.initial,
          newLocationLoadState: LoadState.initial,
          deleteLocationLoadState: LoadState.initial,
        )) {
    on<GetAllEvent>((event, emit) async {
      emit(state.copyWith(loadState: LoadState.loading));
      final response = await repository.getAll();
      emit(state.copyWith(
        favoriteLocations: response,
        loadState: LoadState.loaded,
      ));
    });
    on<GetAllByCategoryEvent>((event, emit) async {
      emit(state.copyWith(loadState: LoadState.loading));
      final response = await repository.getAllByCategory(event.favoritePlace);

      emit(state.copyWith(
        favoriteLocations: response,
        loadState: LoadState.loaded,
      ));

      favoritePlace = event.favoritePlace;
    });

    on<DeleteLocationEvent>((event, emit) async {
      emit(state.copyWith(deleteLocationLoadState: LoadState.loading));
      await repository.deleteFavoriteLocation(event.title);
      add(GetAllByCategoryEvent(favoritePlace));
    });

    on<CheckLocalExistence>((event, emit) async {
      final response = await repository.checkLocalExistence(event.location);
    });
  }
  final FavoriteLocationRepository repository;
}
