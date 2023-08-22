import 'package:isar/isar.dart';
part 'account_model.g.dart';

@collection
class Account {
  Id modelKey = Isar.autoIncrement;
  @Index(unique: true)
  String? id;
  String? fullName;
  @Index(unique: true, replace: true)
  String? phoneNumber;
  String? avatarPath;

  int? totalTrip;
  double? paymentValue;
  bool? vip;
}
