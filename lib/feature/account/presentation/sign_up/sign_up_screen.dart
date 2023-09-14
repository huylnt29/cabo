import 'package:cabo_customer/core/automatic_generator/assets.gen.dart';
import 'package:cabo_customer/core/router/route_config.dart';
import 'package:cabo_customer/core/router/route_paths.dart';
import 'package:cabo_customer/core/theme/app_colors.dart';

import 'package:cabo_customer/feature/account/presentation/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:huylnt_flutter_component/reusable_core/enums/load_state.dart';
import 'package:huylnt_flutter_component/reusable_core/extensions/font_size.dart';
import 'package:huylnt_flutter_component/reusable_core/theme/app_text_styles.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/button_widget.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/complete_scaffold_widget.dart';
import 'package:huylnt_flutter_component/reusable_core/widgets/text_form_field_widget.dart';
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
    return BlocConsumer<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) {
        if (state.canNavigateToOtpScreen) {
          Routes.router.navigateTo(context, RoutePath.otpScreen);
        }
      },
      builder: (context, state) => CompleteScaffoldWidget(
        backButtonEnabled: false,
        appBarTextWidget: Text(
          'Sign up',
          style: AppTextStyles.text(
            AppColors.primaryColor,
          ),
        ),
        backgroundColor: AppColors.secondaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Assets.images.authIllustration.image(height: 270.sf),
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
          backgroundColor: AppColors.accentColor,
          title: (state.loadState == LoadState.initial)
              ? 'Submit'
              : 'Proceeding...',
          onPressed: () => _authenticationBloc.add(
            PhoneSentToFirebaseEvent(
              phoneNumerController.text,
              fullnameController.text,
            ),
          ),
        ),
      ),
    );
  }
}
