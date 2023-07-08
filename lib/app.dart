import 'package:cabo_customer/core/service_locator/service_locator.dart';
import 'package:cabo_customer/feature/account/data/local_data_source/authentication_local_data_source.dart';
import 'package:cabo_customer/feature/account/data/remote_data_source/authentication_remote_data_source.dart';
import 'package:cabo_customer/feature/account/data/repository/authentication_repository_impl.dart';
import 'package:cabo_customer/feature/account/domain/use_case/authentication_use_case.dart';
import 'package:cabo_customer/feature/account/presentation/bloc/authentication_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'core/router/route_config.dart';

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => AuthenticationBloc(
            AuthenticationUseCase(
              authenticationRepository: AuthenticationRepositoryImpl(
                authenticationRemoteDataSource: AuthenticationRemoteDataSource(
                  getIt(),
                ),
                authenticationLocalDataSource: AuthenticationLocalDataSource(),
              ),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        onGenerateRoute: Routes.router.generator,
        initialRoute: '/',
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
