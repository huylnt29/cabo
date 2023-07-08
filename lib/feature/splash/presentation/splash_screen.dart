import 'package:cabo_customer/core/automatic_generator/assets.gen.dart';
import 'package:cabo_customer/core/extensions/load_state.dart';
import 'package:cabo_customer/core/router/route_config.dart';
import 'package:cabo_customer/core/router/route_paths.dart';
import 'package:cabo_customer/core/service_locator/service_locator.dart';
import 'package:cabo_customer/core/theme/app_colors.dart';
import 'package:cabo_customer/core/theme/app_text_styles.dart';
import 'package:cabo_customer/core/widgets/complete_scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutterui_modifiers/flutterui_modifiers.dart';

import '../../account/presentation/bloc/authentication_bloc.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  late AuthenticationBloc authenticationBloc;
  @override
  void initState() {
    authenticationBloc = context.read<AuthenticationBloc>();
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => authenticationBloc.add(AutoLogInEvent()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state.loadState == LoadState.loaded) {
          if (state.canLoginAutomatically) {
            Routes.router.navigateTo(context, RoutePath.homeScreen);
          } else {
            Routes.router.navigateTo(context, RoutePath.logInScreen);
          }
        }
      },
      child: CompleteScaffoldWidget(
        appBarOverlapped: true,
        backButtonEnabled: false,
        appBarTitle: 'Cabo',
        body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
              fit: BoxFit.fill,
              image: AssetImage(Assets.images.splashScreenBackground.path),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(36),
            child: Text(
              'A car booking app that eases your journey',
              textAlign: TextAlign.center,
              style: AppTextStyles.heading1(AppColors.primaryColor),
            ).align(Alignment.center),
          ),
        ).frame(
          height: double.infinity,
          width: double.infinity,
        ),
      ),
    );
  }
}
