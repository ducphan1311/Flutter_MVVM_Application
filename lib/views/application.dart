import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mvvm_application/views/screens/splash_page.dart';
import 'package:get_it/get_it.dart';

import '../models/data/data_sources/local/local_service.dart';
import '../view_models/auth_navigation/auth_navigation_bloc.dart';
import '../view_models/auth_navigation/auth_navigation_state.dart';
import 'navigator/auth_navigator.dart';
import 'navigator/main_navigator.dart';

class Application extends StatefulWidget {
  static const path = 'Application';
  const Application({Key? key}) : super(key: key);

  @override
  State<Application> createState() => _ApplicationState();
}

class _ApplicationState extends State<Application> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: BlocBuilder<AuthNavigationBloc, AuthNavigationState>(
        bloc: context.read<AuthNavigationBloc>(),
        builder: (context, state) {
        return state.when(
            authorized: () => const MainNavigator(),
            unAuthorized: () => const AuthNavigator(),
            guestMode: () => const MainNavigator(),
            loadConfig: () => SplashPage(initializeApp: (context) async {
              if (GetIt.instance.get<LocalService>().isAuthorized()) {
                    return const AuthNavigationState.authorized();
                  } else {
                    return const AuthNavigationState.guestMode();
                  }
                }));
      },
        buildWhen: (stateOld, stateCurrent) {
          return stateOld.runtimeType != stateCurrent.runtimeType;
        },),
    );
  }
}
