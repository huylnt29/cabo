import 'dart:async';

import 'package:cabo_customer/core/automatic_generator/assets.gen.dart';
import 'package:cabo_customer/core/router/route_config.dart';
import 'package:cabo_customer/core/router/route_paths.dart';
import 'package:cabo_customer/core/theme/app_colors.dart';
import 'package:cabo_customer/core/widgets/button_widget.dart';
import 'package:cabo_customer/core/widgets/complete_scaffold_widget.dart';
import 'package:cabo_customer/core/widgets/text_form_field_widget.dart';
import 'package:cabo_customer/feature/account/presentation/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  late AuthenticationBloc _authenticationBloc;
  final phoneNumerController = TextEditingController();
  final fullnameController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _authenticationBloc = context.read<AuthenticationBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return CompleteScaffoldWidget(
      backButtonEnabled: false,
      appBarTitle: 'Log in',
      backgroundColor: AppColors.secondaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Assets.images.logInIllustration.image(height: 300),
            TextFormFieldWidget(
              controller: phoneNumerController,
              labelText: 'Phone number',
              textInputType: TextInputType.phone,
              colorTheme: AppColors.primaryColor,
            ),
            TextFormFieldWidget(
              controller: fullnameController,
              labelText: 'Full name',
              textInputType: TextInputType.text,
              colorTheme: AppColors.primaryColor,
            ),
          ],
        ),
      ),
      bottomNavigationBar: ButtonWidget(
          title: 'Submit',
          onPressed: () {
            _authenticationBloc.add(
              PhoneSentToFirebaseEvent(
                phoneNumerController.text,
                fullnameController.text,
              ),
            );
            Timer(
              const Duration(seconds: 3),
              () => Routes.router.navigateTo(context, RoutePath.otpScreen),
            );
          }),
    );
  }
}
