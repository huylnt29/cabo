part of 'favorite_location_bloc.dart';

abstract class FavoriteLocationEvent {}

class GetAllEvent extends FavoriteLocationEvent {
  GetAllEvent();
}

class GetAllByCategoryEvent extends FavoriteLocationEvent {
  GetAllByCategoryEvent();
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
