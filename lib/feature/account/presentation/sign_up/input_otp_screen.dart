import 'package:cabo_customer/core/automatic_generator/assets.gen.dart';

import 'package:cabo_customer/core/router/route_config.dart';
import 'package:cabo_customer/core/router/route_paths.dart';
import 'package:cabo_customer/core/theme/app_colors.dart';

import 'package:cabo_customer/feature/account/presentation/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huylnt_flutter_component/reusable_core/enums/load_state.dart';
import 'package:huylnt_flutter_component/reusable_core/extensions/logger.dart';
import 'package:huylnt_flutter_component/reusable_core/theme/app_text_styles.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/button_widget.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/complete_scaffold_widget.dart';
import 'package:pinput/pinput.dart';

class OtpScreen extends StatefulWidget {
  const OtpScreen({super.key});

  @override
  State<OtpScreen> createState() => _OtpScreenState();
}

class _OtpScreenState extends State<OtpScreen> {
  late AuthenticationBloc _authenticationBloc;
  final otpController = TextEditingController();
  @override
  void initState() {
    _authenticationBloc = context.read<AuthenticationBloc>();
    Logger.d('Authentication bloc in OTP screen: $_authenticationBloc');
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state.otpCorrect) {
          Routes.router.navigateTo(
            context,
            RoutePath.bottomNavBar,
          );
        }
      },
      builder: (context, state) => CompleteScaffoldWidget(
        backButtonEnabled: false,
        appBarTextWidget: Text(
          'Verify OTP',
          style: AppTextStyles.text(
            AppColors.primaryColor,
          ),
        ),
        backgroundColor: AppColors.secondaryColor,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              children: [
                Assets.images.authIllustration.image(height: 300),
                Pinput(
                  length: 6,
                  showCursor: true,
                  defaultPinTheme: PinTheme(
                    width: 45,
                    height: 50,
                    margin: const EdgeInsets.all(4),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(
                        width: 2,
                        color: AppColors.purpleBackgroundColor,
                      ),
                    ),
                    textStyle: AppTextStyles.heading1(AppColors.primaryColor),
                  ),
                  onChanged: (value) => otpController.text = value,
                )
              ],
            ),
          ),
        ),
        bottomNavigationBar: ButtonWidget(
          backgroundColor: AppColors.accentColor,
          title: (state.loadState == LoadState.loading)
              ? 'Verifying...'
              : 'Submit',
          onPressed: () => _authenticationBloc.add(
            OtpVerificationEvent(otpController.text),
          ),
        ),
      ),
    );
  }
}
