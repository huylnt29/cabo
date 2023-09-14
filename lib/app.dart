import 'package:cabo_customer/core/service_locator/service_locator.dart';

import 'package:cabo_customer/feature/account/presentation/bloc/authentication_bloc.dart';
import 'package:cabo_customer/feature/drive_booking/presentation/bloc/drive_booking_bloc.dart';
import 'package:cabo_customer/feature/notification/presentation/bloc/notification_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'core/router/route_config.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider.value(
          value: getIt<AuthenticationBloc>(),
        ),
        BlocProvider.value(
          value: getIt<NotificationBloc>(),
        ),
        BlocProvider.value(
          value: getIt<DriveBookingBloc>(),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: Routes.router.generator,
        initialRoute: '/',
        theme: ThemeData(
          fontFamily: GoogleFonts.tillana().fontFamily,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
