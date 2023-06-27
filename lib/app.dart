import 'package:flutter/material.dart';

import 'core/router/route_config.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      onGenerateRoute: Routes.router.generator,
      initialRoute: '/',
      debugShowCheckedModeBanner: false,
    );
  }
}
