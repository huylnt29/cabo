import 'package:cabo_customer/core/automatic_generator/assets.gen.dart';
import 'package:cabo_customer/core/theme/app_colors.dart';
import 'package:cabo_customer/core/widgets/button_widget.dart';
import 'package:cabo_customer/core/widgets/complete_scaffold_widget.dart';
import 'package:cabo_customer/core/widgets/text_form_field_widget.dart';
import 'package:flutter/material.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  @override
  Widget build(BuildContext context) {
    return CompleteScaffoldWidget(
      backButtonEnabled: true,
      appBarTitle: 'Verify OTP',
      backgroundColor: AppColors.secondaryColor,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Assets.images.logInIllustration.image(),
            const TextFormFieldWidget(
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
            return 'ok';
          }),
    );
  }
}
