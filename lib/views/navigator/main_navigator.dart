import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../utils/navigator_support.dart';
import '../../view_models/home/home_bloc.dart';
import '../screens/home_page.dart';


class MainNavigator extends StatefulWidget {
  static const path = '/main_navigator';
  const MainNavigator({Key? key}) : super(key: key);

  @override
  State<MainNavigator> createState() => _MainNavigatorState();
}

class _MainNavigatorState extends State<MainNavigator> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) {
        return HomeBloc();
      },
      child: NavigatorSupport(
        initialRoute: HomePage.path,
        onGenerateRoute: (settings) {
          switch (settings.name) {
            case HomePage.path:
              return MaterialPageRoute(
                  builder: (context) => const HomePage());
            default:
              return MaterialPageRoute(builder: (context) => Container());
          }
        },
      ),
    );
  }
}
