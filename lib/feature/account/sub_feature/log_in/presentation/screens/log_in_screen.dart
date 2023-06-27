import 'package:cabo_customer/core/theme/app_colors.dart';
import 'package:cabo_customer/core/widgets/button_widget.dart';
import 'package:cabo_customer/core/widgets/scaffold_widget.dart';
import 'package:flutter/material.dart';

class LogInSreen extends StatefulWidget {
  const LogInSreen({super.key});

  @override
  State<LogInSreen> createState() => _LogInSreenState();
}

class _LogInSreenState extends State<LogInSreen> {
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
