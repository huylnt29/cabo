import 'package:cabo_customer/core/network/local/shared_preferences/shared_preferences.dart';
import 'package:dio/dio.dart';
import 'package:huylnt_flutter_component/reusable_core/extensions/logger.dart';
import 'package:internet_connection_checker/internet_connection_checker.dart';

class ApiClientInterceptors extends InterceptorsWrapper {
  ApiClientInterceptors({required this.dio});

  final Dio dio;
  @override
  Future<void> onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final token = SharedPreferencesHelper.instance.getString('firebaseIdToken');

    if (token == null) {
      Logger.e('Empty bearer token');
      return;
    }

    if (token.isNotEmpty) {
      options.headers['Authorization'] = 'Bearer $token';
      Logger.custom(Logger.green, 'Bearer $token');
    }

    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(
    DioException err,
    ErrorInterceptorHandler handler,
  ) async {
    super.onError(err, handler);

    if (!await InternetConnectionChecker().hasConnection) {
      Logger.e('Internet disconnected');
    }
  }
}
