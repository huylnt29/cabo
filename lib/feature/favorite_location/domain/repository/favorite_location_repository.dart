import 'package:cabo_customer/core/enums/favorite_place.dart';
import 'package:cabo_customer/core/model/address.dart';
import 'package:cabo_customer/core/network/local/isar/isar_database.dart';
import 'package:cabo_customer/feature/favorite_location/data/model/favorite_location_model.dart';
import 'package:injectable/injectable.dart';
import 'package:isar/isar.dart';

import '../../../../core/model/location.dart';

part '../../data/local_data_source/favorite_location_local_data_source.dart';

abstract class FavoriteLocationRepository {
  FavoriteLocationRepository();
  Future<List<FavoriteLocation>> getAll();
  Future<List<FavoriteLocation>> getAllByCategory(
    FavoritePlace favoritePlace,
  );
  Future<int> putFavoriteLocation(
    String title,
    FavoritePlace favoritePlace,
    Address address,
  );
  Future<bool> deleteFavoriteLocation(String title);
  Future<FavoriteLocation?> checkLocalExistence(Location location);
}

@Injectable(as: FavoriteLocationRepository)
class FavoriteLocationRepositoryImpl extends FavoriteLocationRepository {
  FavoriteLocationRepositoryImpl(this.localDataSource);
  final FavoriteLocationLocalDataSource localDataSource;

  @override
  Future<List<FavoriteLocation>> getAll() async {
    return localDataSource.getAll();
  }

  @override
  Future<List<FavoriteLocation>> getAllByCategory(
    FavoritePlace favoritePlace,
  ) async {
    return localDataSource.getAllByCategory(favoritePlace);
  }

  @override
  Future<int> putFavoriteLocation(
    String title,
    FavoritePlace favoritePlace,
    Address address,
  ) async {
    return localDataSource.putFavoriteLocation(
      title,
      favoritePlace,
      address.address!,
      address.location!,
    );
  }

  @override
  Future<bool> deleteFavoriteLocation(String title) async {
    return localDataSource.deleteFavoriteLocation(title);
  }

  @override
  Future<FavoriteLocation?> checkLocalExistence(Location location) async {
    return localDataSource.checkLocalExistence(location);
  }
}
