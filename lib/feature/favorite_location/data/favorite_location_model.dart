import 'package:isar/isar.dart';

import '../../../core/enums/favorite_location_type.dart';
part 'favorite_location_model.g.dart';

@collection
class FavoriteLocation {
  Id id = Isar.autoIncrement;
  @Index(unique: true, replace: true)
  String? title;
  @enumerated
  FavoriteLocationType favoriteLocationType = FavoriteLocationType.none;
  String? address;
  String? famousNearbySite;
}
