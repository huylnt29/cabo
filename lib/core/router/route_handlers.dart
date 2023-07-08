import 'package:cabo_customer/feature/account/presentation/bloc/authentication_bloc.dart';
import 'package:cabo_customer/feature/account/presentation/sign_up/input_otp_screen.dart';
import 'package:cabo_customer/feature/account/presentation/sign_up/sign_up_screen.dart';
import 'package:cabo_customer/feature/home/presentation/home_screen.dart';
import 'package:cabo_customer/feature/splash/presentation/splash_screen.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

Handler splashScreenHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
      const SplashScreen(),
);

Handler signUpScreenHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
      const SignUpScreen(),
);

Handler otpScreenHandler = Handler(
    handlerFunc: (BuildContext? context, Map<String, List<String>> params) {
  return BlocProvider.value(
    value: BlocProvider.of<AuthenticationBloc>(context!),
    child: OtpScreen(),
  );
});

Handler homeScreenHandler = Handler(
  handlerFunc: (BuildContext? context, Map<String, List<String>> params) =>
      const HomeScreen(),
);
