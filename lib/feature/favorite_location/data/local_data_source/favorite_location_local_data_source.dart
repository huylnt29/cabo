part of '../../domain/repository/favorite_location_repository.dart';

class FavoriteLocationLocalDataSource with IsarDatabase {
  FavoriteLocationLocalDataSource() {
    favoriteLocationsCollection = isarInstance!.favoriteLocations;
  }
  late IsarCollection<FavoriteLocation> favoriteLocationsCollection;
  Future<List<FavoriteLocation>> getAll() async {
    final response = await favoriteLocationsCollection.where().findAll();
    return response;
  }

  Future<List<FavoriteLocation>> getAllByCategory(
    FavoritePlace favoritePlace,
  ) async {
    final response = await favoriteLocationsCollection
        .filter()
        .favoritePlaceEqualTo(favoritePlace)
        .findAll();
    return response;
  }

  Future<int> updateByKey(
    FavoriteLocation favoriteLocation,
  ) async {
    int modelKey = -1;
    await isarInstance!.writeTxn(() async {
      modelKey = await favoriteLocationsCollection.put(favoriteLocation);
    });
    return modelKey;
  }

  Future<int> putFavoriteLocation(
    String title,
    FavoritePlace favoritePlace,
    String address,
    Location location,
  ) async {
    int modelKey = -1;
    await isarInstance!.writeTxn(() async {
      modelKey = await favoriteLocationsCollection.putByTitle(
        FavoriteLocation()
          ..title = title
          ..favoritePlace = favoritePlace
          ..address = address
          ..location = location,
      );
    });
    return modelKey;
  }

  Future<bool> deleteFavoriteLocation(String title) async {
    await isarInstance!.writeTxn(() async {
      await favoriteLocationsCollection.deleteByTitle(title);
    });
    return true;
  }

  Future<FavoriteLocation?> checkLocalExistence(Location location) async {
    final response = await favoriteLocationsCollection
        .filter()
        .location(
          (q) => q.latEqualTo(location.lat).and().longEqualTo(location.long),
        )
        .findFirst();
    return response;
  }
}
