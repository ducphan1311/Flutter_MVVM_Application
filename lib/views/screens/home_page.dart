import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../view_models/auth/auth_bloc.dart';
import '../../view_models/auth_navigation/auth_navigation_bloc.dart';
import '../../view_models/auth_navigation/auth_navigation_state.dart';
import '../../view_models/home/home_bloc.dart';
import '../../view_models/home/home_state.dart';

class HomePage extends StatefulWidget {
  static const path = 'HomePage';
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
    context.read<HomeBloc>().fetchDefaultData();
  }

  @override
  Widget build(BuildContext context) {
    var profile = context
        .watch<AuthBloc>()
        .state
        .mapOrNull(authorized: (auth) => auth.profileModel);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      drawer: Drawer(
        child: profile != null
            ? Column(
                children: [
                  const SizedBox(
                    height: 32,
                  ),
                  Text('Helu ${profile.userName}'),
                  const SizedBox(
                    height: 16,
                  ),
                  ElevatedButton(
                    onPressed: () {
                      context.read<AuthBloc>().logout();
                      context.read<HomeBloc>().fetchDefaultData();
                    },
                    child: const Text('LogOut'),
                  ),
                ],
              )
            : ElevatedButton(
                onPressed: () {
                  context
                      .read<AuthNavigationBloc>()
                      .setState(const AuthNavigationState.unAuthorized());
                },
                child: const Text('Login'),
              ),
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: BlocBuilder<HomeBloc, HomeState>(builder: (context, state) {
          return state.when(
            (defaultData) {
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(defaultData),
                ],
              );
            },
            loading: () => const Center(
              child: CircularProgressIndicator(),
            ),
            error: (e) => Center(
              child: Text(e),
            ),
          );
        }),
      ),
    );
  }
}
