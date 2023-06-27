import 'package:isar/isar.dart';
part 'customer_model.g.dart';

@collection
class Customer {
  Id id = Isar.autoIncrement;
  double? paymentValue;
}
