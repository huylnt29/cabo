import 'package:cabo_customer/core/network/remote/cabo_server/cabo_client_interceptors.dart';
import 'package:dio/dio.dart';

import 'cabo_client.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class CaboClientConfig {
  static Dio initApiService({String? baseUrl}) {
    final dio = Dio();
    if (baseUrl != null) {
      dio.options.baseUrl = baseUrl;
    }
    dio.interceptors.add(CaboClientInterceptors(dio: dio));
    dio.options.connectTimeout = const Duration(seconds: 50);
    dio.options.headers['Content-Type'] = 'application/json';

    dio.options.headers['Accept'] = 'application/json';

    dio.interceptors.add(PrettyDioLogger(
      requestHeader: true,
      requestBody: true,
    ));

    return dio;
  }

  static CaboClient getApiClient() {
    final apiClient = CaboClient(initApiService());
    return apiClient;
  }
}
