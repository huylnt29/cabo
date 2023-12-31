import 'package:cabo_customer/core/router/route_paths.dart';
import 'package:fluro/fluro.dart';
import 'package:flutter/widgets.dart';

import 'route_handlers.dart';

class Routes {
  Routes();

  static final router = FluroRouter();
  static RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();

  static void configureRoutes() {
    setRouter(RoutePath.splashScreen, handler: splashScreenHandler);
    setRouter(RoutePath.logInScreen, handler: signUpScreenHandler);
    setRouter(RoutePath.otpScreen, handler: otpScreenHandler);
    setRouter(RoutePath.bottomNavBar, handler: bottomNavBarHandler);
    setRouter(
      RoutePath.locationSearchingScreen,
      handler: locationSearchingScreenHandler,
    );
    setRouter(
      RoutePath.realTimeTrackingScreen,
      handler: realTimeTrackingScreenHandler,
    );
    setRouter(
      RoutePath.viewFavoriteLocationScreen,
      handler: viewFavoriteLocationScreenHandler,
    );
  }

  static void setRouter(
    String path, {
    required Handler handler,
    TransitionType? transitionType,
  }) {
    transitionType ??= TransitionType.cupertino;
    router.define(path, handler: handler, transitionType: transitionType);
  }
}
