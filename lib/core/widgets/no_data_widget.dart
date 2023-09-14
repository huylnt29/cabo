import 'package:cabo_customer/core/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:huylnt_flutter_component/reusable_core/constants/error_message.dart';
import 'package:huylnt_flutter_component/reusable_core/extensions/font_size.dart';
import 'package:huylnt_flutter_component/reusable_core/theme/app_text_styles.dart';

import '../automatic_generator/assets.gen.dart';

class NoDataWidget extends StatelessWidget {
  const NoDataWidget({super.key, this.message = ErrorMessage.isNotDetermined});
  final String message;
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10.sf, horizontal: 24.sf),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Assets.images.emptyResult.image(
            fit: BoxFit.cover,
            width: MediaQuery.of(context).size.width.sf / 2,
          ),
          12.vSpace,
          Text(
            message,
            textAlign: TextAlign.center,
            style: AppTextStyles.heading3(
              AppColors.textColor,
            ),
          ),
          12.vSpace,
        ],
      ),
    );
  }
}
