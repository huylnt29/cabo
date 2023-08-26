import 'package:cabo_customer/core/network/local/isar/isar_database.dart';

import '../model/account_model.dart';

class AuthenticationLocalDataSource with IsarDatabase {
  Future<int> putAccount(
    String id,
    String phoneNumber,
    String fullName,
  ) async {
    final accountCollection = isarInstance!.collection<Account>();
    final account = Account()
      ..id = id
      ..phoneNumber = phoneNumber
      ..fullName = fullName;

    int accountKey = -1;
    await isarInstance!.writeTxn(() async {
      accountKey = await accountCollection.putById(account);
    });
    return accountKey;
  }

  Future<Account?> getFirstAccount() async {
    final account = await isarInstance!.collection<Account>().get(1);
    return account;
  }
}
