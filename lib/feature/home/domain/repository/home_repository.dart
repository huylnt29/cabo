import '../../../../core/model/voucher_model.dart';
import '../../data/model/customer_summary_model.dart';

abstract class HomeRepository {
  HomeRepository();

  Future<CustomerSummary> getCustomerSummary();

  Future<List<Voucher?>> getAllVouchers();
}
