import 'package:cabo_customer/core/automatic_generator/assets.gen.dart';
import 'package:cabo_customer/core/router/route_config.dart';
import 'package:cabo_customer/core/router/route_paths.dart';
import 'package:cabo_customer/core/theme/app_colors.dart';
import 'package:cabo_customer/core/widgets/button_widget.dart';
import 'package:cabo_customer/core/widgets/complete_scaffold_widget.dart';
import 'package:cabo_customer/core/widgets/text_form_field_widget.dart';
import 'package:cabo_customer/core/widgets/toast_widget.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  final otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return CompleteScaffoldWidget(
      backButtonEnabled: false,
      appBarTitle: 'Verify OTP',
      backgroundColor: AppColors.secondaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Assets.images.logInIllustration.image(),
            TextFormFieldWidget(
              controller: otpController,
              labelText: 'OTP',
              textInputType: TextInputType.number,
              colorTheme: AppColors.primaryColor,
            ),
          ],
        ),
      ),
      bottomNavigationBar: ButtonWidget(
        title: 'Submit',
        onPressed: () {
          if (otpController.text.length == 4) {
            Routes.router.navigateTo(context, RoutePath.homeScreen);
          } else {
            ToastWidget.show('OTP code must include 4 digits.');
          }
        },
      ),
    );
  }
}
