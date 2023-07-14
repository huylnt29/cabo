import '../../../../core/model/voucher_model.dart';
import '../../../../core/network/local/isar/isar_database.dart';
import '../../../../core/network/remote/cabo_server/cabo_client.dart';
import '../model/customer_summary_model.dart';

part '../remote_data_source/home_remote_data_source.dart';

class HomeRepositoryImpl {
  HomeRepositoryImpl(this.homeRemoteDataSource);
  HomeRemoteDataSource homeRemoteDataSource;

  Future<CustomerSummary> getCustomerSummary() async {
    return await homeRemoteDataSource.getCustomerSummary();
  }

  Future<List<Voucher?>> getAllVouchers() async {
    return await homeRemoteDataSource.getAllVouchers();
  }
}