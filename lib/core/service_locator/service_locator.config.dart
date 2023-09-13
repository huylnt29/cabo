// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../feature/account/data/local_data_source/authentication_local_data_source.dart'
    as _i3;
import '../../feature/account/data/remote_data_source/authentication_remote_data_source.dart'
    as _i4;
import '../../feature/account/data/repository/authentication_repository_impl.dart'
    as _i7;
import '../../feature/account/domain/repository/authentication_repository.dart'
    as _i6;
import '../../feature/account/domain/use_case/authentication_use_case.dart'
    as _i8;
import '../../feature/account/presentation/bloc/authentication_bloc.dart'
    as _i16;
import '../../feature/drive_booking/domain/repository/drive_booking_repository.dart'
    as _i9;
import '../../feature/drive_booking/presentation/bloc/drive_booking_bloc.dart'
    as _i20;
import '../../feature/favorite_location/domain/repository/favorite_location_repository.dart'
    as _i10;
import '../../feature/favorite_location/presentation/bloc/favorite_location_bloc.dart'
    as _i17;
import '../../feature/home/data/repository/home_repository_impl.dart' as _i11;
import '../../feature/home/domain/repository/home_repository.dart' as _i12;
import '../../feature/home/presentation/bloc/home_bloc.dart' as _i18;
import '../../feature/notification/domain/use_case/notification_use_case.dart'
    as _i14;
import '../../feature/notification/presentation/bloc/notification_bloc.dart'
    as _i13;
import '../../feature/trip_history/domain/repository/trip_history_repository.dart'
    as _i15;
import '../../feature/trip_history/presentation/cubit/trip_history_cubit.dart'
    as _i19;
import '../network/remote/cabo_server/api_client.dart' as _i5;

// ignore_for_file: unnecessary_lambdas
// ignore_for_file: lines_longer_than_80_chars
// initializes the registration of main-scope dependencies inside of GetIt
_i1.GetIt $initGetIt(
  _i1.GetIt getIt, {
  String? environment,
  _i2.EnvironmentFilter? environmentFilter,
}) {
  final gh = _i2.GetItHelper(
    getIt,
    environment,
    environmentFilter,
  );
  gh.factory<_i3.AuthenticationLocalDataSource>(
      () => _i3.AuthenticationLocalDataSource());
  gh.factory<_i4.AuthenticationRemoteDataSource>(
      () => _i4.AuthenticationRemoteDataSource(gh<_i5.ApiClient>()));
  gh.factory<_i6.AuthenticationRepository>(
      () => _i7.AuthenticationRepositoryImpl(
            gh<_i3.AuthenticationLocalDataSource>(),
            gh<_i4.AuthenticationRemoteDataSource>(),
          ));
  gh.factory<_i8.AuthenticationUseCase>(
      () => _i8.AuthenticationUseCase(gh<_i6.AuthenticationRepository>()));
  gh.factory<_i9.DriveBookingLocalDataSource>(
      () => _i9.DriveBookingLocalDataSource());
  gh.factory<_i9.DriveBookingRemoteDataSource>(
      () => _i9.DriveBookingRemoteDataSource(gh<_i5.ApiClient>()));
  gh.factory<_i10.FavoriteLocationLocalDataSource>(
      () => _i10.FavoriteLocationLocalDataSource());
  gh.factory<_i10.FavoriteLocationRepository>(() =>
      _i10.FavoriteLocationRepositoryImpl(
          gh<_i10.FavoriteLocationLocalDataSource>()));
  gh.factory<_i11.HomeRemoteDataSource>(
      () => _i11.HomeRemoteDataSource(gh<_i5.ApiClient>()));
  gh.factory<_i12.HomeRepository>(
      () => _i11.HomeRepositoryImpl(gh<_i11.HomeRemoteDataSource>()));
  gh.factory<_i13.NotificationBloc>(() => _i13.NotificationBloc());
  gh.factory<_i14.NotificationUseCase>(() => _i14.NotificationUseCase());
  gh.factory<_i15.TripHistoryRemoteDataSource>(
      () => _i15.TripHistoryRemoteDataSource(gh<_i5.ApiClient>()));
  gh.factory<_i15.TripHistoryRepository>(() =>
      _i15.TripHistoryRepositoryImpl(gh<_i15.TripHistoryRemoteDataSource>()));
  gh.factory<_i16.AuthenticationBloc>(
      () => _i16.AuthenticationBloc(gh<_i8.AuthenticationUseCase>()));
  gh.factory<_i9.DriveBookingRepository>(() => _i9.DriveBookingRepositoryImpl(
        gh<_i9.DriveBookingRemoteDataSource>(),
        gh<_i9.DriveBookingLocalDataSource>(),
        gh<_i10.FavoriteLocationLocalDataSource>(),
      ));
  gh.factory<_i17.FavoriteLocationBloc>(
      () => _i17.FavoriteLocationBloc(gh<_i10.FavoriteLocationRepository>()));
  gh.factory<_i18.HomeBloc>(() => _i18.HomeBloc(gh<_i12.HomeRepository>()));
  gh.factory<_i19.TripHistoryCubit>(
      () => _i19.TripHistoryCubit(gh<_i15.TripHistoryRepository>()));
  gh.factory<_i20.DriveBookingBloc>(
      () => _i20.DriveBookingBloc(gh<_i9.DriveBookingRepository>()));
  return getIt;
}
