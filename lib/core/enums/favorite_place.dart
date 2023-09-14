enum FavoritePlace {
  recent,
  home,
  office,
  relativeHouse,
  restaurant,
  cinema,
  park,
  bar,
  other
}

extension FavoritePlaceX on FavoritePlace {
  String get name {
    switch (this) {
      case FavoritePlace.recent:
        return 'Recent';
      case FavoritePlace.other:
        return 'Other';
      case FavoritePlace.home:
        return 'Home';
      case FavoritePlace.office:
        return 'Office';
      case FavoritePlace.relativeHouse:
        return 'Relative house';
      case FavoritePlace.restaurant:
        return 'Restaurant';
      case FavoritePlace.cinema:
        return 'Cinema';
      case FavoritePlace.park:
        return 'Park';
      case FavoritePlace.bar:
        return 'Bar';
    }
  }
}
