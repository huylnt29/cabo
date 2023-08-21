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
    as _i11;
import '../../feature/home/data/repository/home_repository_impl.dart' as _i9;
import '../../feature/home/domain/repository/home_repository.dart' as _i10;
import '../../feature/home/presentation/bloc/home_bloc.dart' as _i12;
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
  gh.factory<_i8.AuthenticationUseCase>(() => _i8.AuthenticationUseCase(
      authenticationRepository: gh<_i6.AuthenticationRepository>()));
  gh.factory<_i9.HomeRemoteDataSource>(
      () => _i9.HomeRemoteDataSource(gh<_i5.ApiClient>()));
  gh.factory<_i10.HomeRepository>(
      () => _i9.HomeRepositoryImpl(gh<_i9.HomeRemoteDataSource>()));
  gh.factory<_i11.AuthenticationBloc>(
      () => _i11.AuthenticationBloc(gh<_i8.AuthenticationUseCase>()));
  gh.factory<_i12.HomeBloc>(() => _i12.HomeBloc(gh<_i10.HomeRepository>()));
  return getIt;
}
