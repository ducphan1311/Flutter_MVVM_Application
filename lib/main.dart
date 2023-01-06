import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mvvm_application/view_models/auth/auth_bloc.dart';
import 'package:flutter_mvvm_application/view_models/auth_navigation/auth_navigation_bloc.dart';
import 'package:flutter_mvvm_application/views/application.dart';
import 'package:get_it/get_it.dart';

import 'initialize_dependencies.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  await initializeDependencies();

  runApp(MultiBlocProvider(
    providers: [
      BlocProvider.value(value: GetIt.instance.get<AuthNavigationBloc>()),
      BlocProvider.value(value: GetIt.instance.get<AuthBloc>())
    ],
    child: const Application(),
  ));
}
