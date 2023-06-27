import 'package:cabo_customer/core/theme/app_colors.dart';
import 'package:cabo_customer/core/widgets/button_widget.dart';
import 'package:cabo_customer/core/widgets/complete_scaffold_widget.dart';
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
      body: Container(),
      bottomNavigationBar: ButtonWidget(
          title: 'Submit',
          onPressed: () {
            return 'ok';
          }),
    );
  }
}
