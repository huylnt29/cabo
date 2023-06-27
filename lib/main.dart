import 'dart:async';

import 'package:cabo_customer/core/network/remote/cabo_server/cabo_client_config.dart';
import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'app.dart';
import 'core/network/local/isar/isar_database.dart';
import 'core/router/route_config.dart';
import 'core/service_locator/service_locator.dart';

void main() async {
  runZonedGuarded(() async {
    WidgetsFlutterBinding.ensureInitialized();
    await dotenv.load();
    configureDependencies(
      dio: CaboClientConfig.initApiService(
          baseUrl: dotenv.env['CABO_SERVER_URL']),
    );
    await IsarDatabase.init();
    Routes.configureRoutes();
    runApp(const App());
  }, (error, stackTrace) async {
    throw error;
  });
}
