part of '../../domain/repository/favorite_location_repository.dart';

class FavoriteLocationLocalDataSource with IsarDatabase {
  FavoriteLocationLocalDataSource();

  Future<List<FavoriteLocation>> getAll() async {
    final response = await isarInstance!.favoriteLocations.where().findAll();
    return response;
  }

  Future<List<FavoriteLocation>> getAllByCategory(
    FavoritePlace favoritePlace,
  ) async {
    final response = await isarInstance!.favoriteLocations
        .filter()
        .favoritePlaceEqualTo(favoritePlace)
        .findAll();
    return response;
  }

  Future<int> putFavoriteLocation(
    String title,
    FavoritePlace favoritePlace,
    String address,
    Location location,
  ) async {
    final favoriteLocationsCollection = isarInstance!.favoriteLocations;

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
      await isarInstance!.favoriteLocations.deleteByTitle(title);
    });
    return true;
  }
}
