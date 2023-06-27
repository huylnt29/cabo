import 'package:cabo_customer/core/automatic_generator/assets.gen.dart';
import 'package:cabo_customer/core/theme/app_colors.dart';
import 'package:cabo_customer/core/theme/app_text_styles.dart';
import 'package:cabo_customer/core/widgets/scaffold_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutterui_modifiers/flutterui_modifiers.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 2),
      () => checkRoute(),
    );
  }

  @override
  Widget build(BuildContext context) {
    return CompleteScaffoldWidget(
      backButtonEnabled: false,
      appBarTitle: 'Cabo',
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fill,
            image: AssetImage(Assets.images.splashScreenBackground.path),
          ),
        ),
        child: Text(
          'Welcome',
          style: AppTextStyles.heading3(AppColors.primaryColor),
        ).centered(),
      ).frame(
        height: double.infinity,
        width: double.infinity,
      ),
    );
  }

  Future<void> checkRoute() async {}
}
