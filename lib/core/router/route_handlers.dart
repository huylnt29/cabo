import 'package:cabo_customer/feature/account/presentation/log_in/input_otp_screen.dart';
import 'package:cabo_customer/feature/account/presentation/log_in/log_in_screen.dart';
import 'package:cabo_customer/feature/home/presentation/home_screen.dart';
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

Handler otpScreenHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
      const OtpScreen(),
);

Handler homeScreenHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
      const HomeScreen(),
);
