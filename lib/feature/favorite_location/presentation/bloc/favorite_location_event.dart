part of 'favorite_location_bloc.dart';

abstract class FavoriteLocationEvent {}

class GetAllEvent extends FavoriteLocationEvent {
  GetAllEvent();
}

class GetAllByCategoryEvent extends FavoriteLocationEvent {
  GetAllByCategoryEvent(this.favoritePlace);
  final FavoritePlace favoritePlace;
}

class CreateNewLocationEvent extends FavoriteLocationEvent {
  CreateNewLocationEvent(
    this.title,
    this.favoritePlace,
    this.address,
  );
  final String title;
  final FavoritePlace favoritePlace;
  final Address address;
}

class DeleteLocationEvent extends FavoriteLocationEvent {
  DeleteLocationEvent(this.title);
  final String title;
}

class CheckLocalExistence extends FavoriteLocationEvent {
  CheckLocalExistence(this.location);
  final Location location;
}
