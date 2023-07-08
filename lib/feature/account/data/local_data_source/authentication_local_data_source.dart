import 'package:cabo_customer/core/network/local/isar/isar_database.dart';

import '../model/account_model.dart';
import '../model/customer_model.dart';

class AuthenticationLocalDataSource with IsarDatabase {
  Future<int> insertNewCustomer(String customerId) async {
    final customerCollection = isarInstance!.collection<Customer>();
    final customer = Customer()..customerId = customerId;
    return await customerCollection.put(customer);
  }

  Future<int> insertNewAccount(
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
      accountKey = await accountCollection.put(account);
    });
    return accountKey;
  }
}
