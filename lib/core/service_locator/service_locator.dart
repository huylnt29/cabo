import 'package:cabo_customer/core/network/remote/cabo_server/api_client.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'service_locator.config.dart';

final getIt = GetIt.instance;

// ignore: inference_failure_on_function_return_type
@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false,
)
// ignore: always_declare_return_types
configureDependencies({required Dio dio}) {
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(dio));

  $initGetIt(getIt);
}
