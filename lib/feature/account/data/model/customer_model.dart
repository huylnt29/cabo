import 'package:isar/isar.dart';
part 'customer_model.g.dart';

@collection
class Customer {
  Id id = Isar.autoIncrement;
  @Index(unique: true)
  String? customerId;
  double? paymentValue;
}
