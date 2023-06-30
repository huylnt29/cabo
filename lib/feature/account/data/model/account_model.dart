import 'package:isar/isar.dart';
part 'account_model.g.dart';

@collection
class Account {
  Id id = Isar.autoIncrement;
  String? firestoreIdToken;
  String? fullName;
  String? phoneNumber;
  String? avatarPath;
}