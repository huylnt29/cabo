import '../../../../core/model/voucher_model.dart';
import '../../data/model/customer_summary_model.dart';
import '../../data/repository/home_repository_impl.dart';

abstract class HomeRepository {
  HomeRepository(this.homeRemoteDataSource);
  HomeRemoteDataSource homeRemoteDataSource;

  Future<CustomerSummary> getCustomerSummary();

  Future<List<Voucher?>> getAllVouchers();
}
