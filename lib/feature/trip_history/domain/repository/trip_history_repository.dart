import 'package:cabo_customer/core/service_locator/service_locator.dart';
import 'package:cabo_customer/feature/account/data/local_data_source/authentication_local_data_source.dart';
import 'package:cabo_customer/feature/trip_history/data/model/trip_model.dart';
import 'package:huylnt_flutter_component/reusable_core/extensions/logger.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/network/remote/cabo_server/api_client.dart';

part '../../data/remote_data_source/trip_history_remote_data_source.dart';

abstract class TripHistoryRepository {
  TripHistoryRepository();

  Future<List<Trip>?> getTrips();
}

@Injectable(as: TripHistoryRepository)
class TripHistoryRepositoryImpl extends TripHistoryRepository {
  final TripHistoryRemoteDataSource remoteDataSource;
  TripHistoryRepositoryImpl(this.remoteDataSource);

  @override
  Future<List<Trip>?> getTrips() async {
    final account =
        await getIt<AuthenticationLocalDataSource>().getFirstAccount();
    final customerId = account!.id!;

    return remoteDataSource.getTrips(customerId);
  }
}
