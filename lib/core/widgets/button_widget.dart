import 'package:cabo_customer/core/theme/app_colors.dart';
import 'package:cabo_customer/core/theme/app_text_styles.dart';
import 'package:flutter/material.dart';
import 'package:flutterui_modifiers/flutterui_modifiers.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({
    Key? key,
    required this.title,
    this.backgroundColor,
    required this.onPressed,
  }) : super(key: key);
  final Color? backgroundColor;
  final String title;
  final Function onPressed;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 24),
      child: ElevatedButton(
        onPressed: () {},
        child: Text(
          title,
          style: AppTextStyles.heading3(AppColors.secondaryColor),
        ).padding(
          horizontal: 10,
          vertical: 12,
        ),
      ).backgroundColor(Colors.transparent).shadow(12),
    ).backgroundColor(backgroundColor ?? AppColors.accentColor).corner(12);
  }
}
