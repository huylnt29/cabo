import 'package:cabo_customer/core/model/address.dart';
import 'package:isar/isar.dart';

import '../../../../core/enums/favorite_place.dart';
import '../../../../core/model/location.dart';

part 'favorite_location_model.g.dart';

@collection
class FavoriteLocation {
  Id id = Isar.autoIncrement;
  @Index(unique: true, replace: true)
  String? title;
  @enumerated
  FavoritePlace favoritePlace = FavoritePlace.other;
  String? address;
  Location? location;
  DateTime modifiedAt = DateTime.now();
}
