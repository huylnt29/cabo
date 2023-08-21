import 'package:cabo_customer/feature/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/model/voucher_model.dart';
import '../../../../core/network/local/isar/isar_database.dart';
import '../../../../core/network/remote/cabo_server/api_client.dart';
import '../model/customer_summary_model.dart';

part '../remote_data_source/home_remote_data_source.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl(super.homeRemoteDataSource);

  @override
  Future<CustomerSummary> getCustomerSummary() async {
    return await homeRemoteDataSource.getCustomerSummary();
  }

  @override
  Future<List<Voucher?>> getAllVouchers() async {
    return await homeRemoteDataSource.getAllVouchers();
  }
}
