import 'package:dio/dio.dart';

import 'cabo_client.dart';

class CaboClientConfig {
  static Dio initApiService({String? apiEndpoint}) {
    final dio = Dio();
    if (apiEndpoint != null) {
      dio.options.baseUrl = apiEndpoint;
    }

    dio.options.connectTimeout = const Duration(seconds: 50);
    dio.options.headers['Content-Type'] = 'application/json';

    dio.options.headers['Accept'] = 'application/json';

    return dio;
  }

  static CaboClient getApiClient() {
    final apiClient = CaboClient(initApiService());
    return apiClient;
  }
}
