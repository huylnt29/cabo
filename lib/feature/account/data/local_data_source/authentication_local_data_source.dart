import 'package:cabo_customer/core/network/local/isar/isar_database.dart';

import '../model/account_model.dart';
import '../model/customer_model.dart';

class AuthenticationLocalDataSource with IsarDatabase {
  Future<int> putCustomer(String customerId) async {
    final customerCollection = isarInstance!.collection<Customer>();
    final customer = Customer()..customerId = customerId;
    int customerKey = -1;
    await isarInstance!.writeTxn(() async {
      customerKey = await customerCollection.putByCustomerId(customer);
    });
    return customerKey;
  }

  Future<int> putAccount(
    String firebaseIdToken,
    String phoneNumber,
    String fullName,
  ) async {
    final accountCollection = isarInstance!.collection<Account>();
    final account = Account()
      ..firestoreIdToken = firebaseIdToken
      ..phoneNumber = phoneNumber
      ..fullName = fullName;

    int accountKey = -1;
    await isarInstance!.writeTxn(() async {
      accountKey = await accountCollection.putByPhoneNumber(account);
    });
    return accountKey;
  }
}
