import 'package:cabo_customer/core/automatic_generator/assets.gen.dart';
import 'package:cabo_customer/core/router/route_config.dart';
import 'package:cabo_customer/core/router/route_paths.dart';
import 'package:cabo_customer/core/theme/app_colors.dart';
import 'package:cabo_customer/core/widgets/button_widget.dart';
import 'package:cabo_customer/core/widgets/complete_scaffold_widget.dart';
import 'package:cabo_customer/core/widgets/text_form_field_widget.dart';
import 'package:cabo_customer/core/widgets/toast_widget.dart';
import 'package:cabo_customer/feature/account/presentation/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';

class LogInScreen extends StatefulWidget {
  const LogInScreen({super.key});

  @override
  State<LogInScreen> createState() => _LogInScreenState();
}

class _LogInScreenState extends State<LogInScreen> {
  late AuthenticationBloc _authenticationBloc;
  final phoneNumerController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _authenticationBloc = context.read<AuthenticationBloc>();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthenticationBloc, AuthenticationState>(
      listener: (context, state) => {
        if (state.phoneExisted!)
          {Routes.router.navigateTo(context, RoutePath.otpScreen)}
      },
      child: CompleteScaffoldWidget(
        backButtonEnabled: false,
        appBarTitle: 'Log in',
        backgroundColor: AppColors.secondaryColor,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Assets.images.logInIllustration.image(),
              TextFormFieldWidget(
                controller: phoneNumerController,
                labelText: 'Phone number',
                textInputType: TextInputType.phone,
                colorTheme: AppColors.primaryColor,
              ),
            ],
          ),
        ),
        bottomNavigationBar: ButtonWidget(
          title: 'Submit',
          onPressed: logInFormSubmitted,
        ),
      ),
    );
  }

  Future<void> logInFormSubmitted() async {
    if (phoneNumerController.text.length == 10) {
      _authenticationBloc
          .add(PhoneExistenceCheckEvent(phoneNumerController.text));
    } else {
      ToastWidget.show('Phone number must include 10 digits.');
    }
  }
}
