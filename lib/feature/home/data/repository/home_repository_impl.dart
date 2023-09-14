import 'package:cabo_customer/feature/home/domain/repository/home_repository.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/model/voucher_model.dart';
import '../../../../core/network/local/isar/isar_database.dart';
import '../../../../core/network/remote/cabo_server/api_client.dart';
import '../../../../core/service_locator/service_locator.dart';
import '../../../account/data/local_data_source/authentication_local_data_source.dart';
import '../model/customer_summary_model.dart';

part '../remote_data_source/home_remote_data_source.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  HomeRepositoryImpl(this.remoteDataSource);
  final HomeRemoteDataSource remoteDataSource;

  @override
  Future<CustomerSummary> getCustomerSummary() async {
    final account =
        await getIt<AuthenticationLocalDataSource>().getFirstAccount();
    final customerId = account!.id!;
    return await remoteDataSource.getCustomerSummary(customerId);
  }

  @override
  Future<List<Voucher?>> getAllVouchers() async {
    return await remoteDataSource.getAllVouchers();
  }
}
