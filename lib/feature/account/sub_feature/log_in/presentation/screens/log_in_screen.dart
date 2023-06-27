import 'package:cabo_customer/core/automatic_generator/assets.gen.dart';
import 'package:cabo_customer/core/router/route_config.dart';
import 'package:cabo_customer/core/router/route_paths.dart';
import 'package:cabo_customer/core/theme/app_colors.dart';
import 'package:cabo_customer/core/widgets/button_widget.dart';
import 'package:cabo_customer/core/widgets/complete_scaffold_widget.dart';
import 'package:cabo_customer/core/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  @override
  Widget build(BuildContext context) {
    return CompleteScaffoldWidget(
      backButtonEnabled: false,
      appBarTitle: 'Log in',
      backgroundColor: AppColors.secondaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Assets.images.logInIllustration.image(),
            const TextFormFieldWidget(
              labelText: 'Phone number',
              textInputType: TextInputType.phone,
              colorTheme: AppColors.primaryColor,
            ),
          ],
        ),
      ),
      bottomNavigationBar: ButtonWidget(
          title: 'Submit',
          onPressed: () {
            Routes.router.navigateTo(context, RoutePath.otpScreen);
          }),
    );
  }
}
