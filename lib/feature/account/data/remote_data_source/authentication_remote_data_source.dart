import 'package:cabo_customer/core/extensions/logger.dart';
import 'package:cabo_customer/core/network/local/isar/isar_database.dart';
import 'package:cabo_customer/core/network/remote/cabo_server/cabo_client.dart';
import 'package:cabo_customer/core/widgets/toast_widget.dart';
import 'package:cabo_customer/feature/account/data/model/account_model.dart';
import 'package:cabo_customer/feature/account/data/model/customer_model.dart';
import 'package:firebase_auth/firebase_auth.dart';

class AuthenticationRemoteDataSource with IsarDatabase {
  AuthenticationRemoteDataSource(this._caboClient);
  final CaboClient _caboClient;

  final _auth = FirebaseAuth.instance;
  var verificationId = '';

  Future<bool> checkPhone(String phoneNumber) async {
    final response = await _caboClient.checkPhone({'phoneNumber': phoneNumber});
    return response['isExisted'];
  }

  Future<String> getCustomerId() async {
    final account = await isarInstance!.collection<Account>().get(1);
    final firebaseIdToken = account!.firestoreIdToken;
    final response = await _caboClient.getId(firebaseIdToken!);

    final customer = await isarInstance!.collection<Customer>().get(1);
    customer!.customerId = response;
    isarInstance!.collection<Customer>().put(customer);
    return response;
  }

  Future<void> authenticateWithPhone(String phoneNumber) async {
    await _auth.verifyPhoneNumber(
      verificationCompleted: (credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (e) {
        if (e.code == 'invalid-phone-number') {
          ToastWidget.show('The given number is not valid');
        } else {
          ToastWidget.show(e.toString());
        }
      },
      codeSent: (verificationId, resendToken) {
        this.verificationId = verificationId;
      },
      codeAutoRetrievalTimeout: (verificationId) {
        this.verificationId = verificationId;
      },
    );
  }

  Future<bool> verifyOtp(String otp) async {
    var credentials =
        await _auth.signInWithCredential(PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: otp,
    ));
    return credentials.user != null ? true : false;
  }
}
