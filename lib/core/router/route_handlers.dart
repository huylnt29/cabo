import 'package:cabo_customer/feature/account/sub_feature/log_in/presentation/screens/log_in_screen.dart';
import 'package:cabo_customer/feature/splash/presentation/splash_screen.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';

Handler splashScreenHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
      const SplashScreen(),
);

Handler logInScreenHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
      const LogInScreen(),
);
