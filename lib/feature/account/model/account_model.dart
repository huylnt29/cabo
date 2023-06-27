import 'package:isar/isar.dart';
part 'account_model.g.dart';

@collection
class Account {
  Id id = Isar.autoIncrement;
  String? firestoreId;
  String? fullName;
  String? phoneNumber;
  String? avatarPath;
}
