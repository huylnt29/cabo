import 'package:cabo_customer/feature/account/presentation/sign_up/input_otp_screen.dart';
import 'package:cabo_customer/feature/account/presentation/sign_up/sign_up_screen.dart';
import 'package:cabo_customer/feature/bottom_nav_bar.dart';
import 'package:cabo_customer/feature/drive_booking/presentation/location_searching/location_searching_screen.dart';

import 'package:cabo_customer/feature/home/presentation/home_screen.dart';
import 'package:cabo_customer/feature/splash/presentation/splash_screen.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';

import '../../feature/drive_history/presentation/drive_history_screen.dart';

Handler splashScreenHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
      const SplashScreen(),
);

Handler signUpScreenHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
      const SignUpScreen(),
);

Handler otpScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
        const OtpScreen());

Handler bottomNavBarHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
      const BottomNavBar(),
);

Handler locationSearchingScreenHandler = Handler(handlerFunc: (
  BuildContext? context,
  Map<String, List<String>> params,
) {
  final arg = context?.settings?.arguments as LocationSearchingPurpose;
  return LocationSearchingScreen(
    locationSearchingPurpose: arg,
  );
});
