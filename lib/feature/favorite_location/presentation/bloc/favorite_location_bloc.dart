import 'package:bloc/bloc.dart';
import 'package:cabo_customer/core/enums/favorite_place.dart';
import 'package:cabo_customer/core/model/address.dart';
import 'package:cabo_customer/feature/favorite_location/data/model/favorite_location_model.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:huylnt_flutter_component/reusable_core/enums/load_state.dart';

part 'favorite_location_event.dart';
part 'favorite_location_state.dart';

part 'favorite_location_bloc.freezed.dart';

class FavoriteLocationBloc
    extends Bloc<FavoriteLocationEvent, FavoriteLocationState> {
  FavoriteLocationBloc()
      : super(const FavoriteLocationState(
          loadState: LoadState.initial,
          newLocationLoadState: LoadState.initial,
          deleteLocationLoadState: LoadState.initial,
        )) {
    on<GetAllEvent>((event, emit) async {});
  }
}
