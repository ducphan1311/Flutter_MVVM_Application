import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mvvm_application/models/data/data_sources/local/local_service.dart';
import 'package:get_it/get_it.dart';

import '../../initialize_dependencies.dart';
import '../../models/domain/repositories/auth_repository.dart';
import '../../utils/cache.dart';
import '../auth_navigation/auth_navigation_bloc.dart';
import '../auth_navigation/auth_navigation_state.dart';
import 'auth_state.dart';


class AuthBloc extends Cubit<AuthState> {
  AuthBloc() : super(const AuthState.unAuthorized());

  final authNavigationBloc = GetIt.instance.get<AuthNavigationBloc>();
  AuthRepository authRepository = sl();
  LocalService localService = sl();

  Future login(String userName, String passWord) async {
    final auth = await authRepository.login(userName, passWord);
    final profile = await authRepository.profile();
    Cache.profile = profile;
    localService.saveAuth(isAuth: true);
    emit(AuthState.authorized(profile));
    authNavigationBloc.setState(const AuthNavigationState.authorized());
  }

  void logout() {
    Cache.profile = null;
    localService.saveAuth();
    emit(const AuthState.unAuthorized());
    authNavigationBloc.setState(const AuthNavigationState.guestMode());
  }

  Future initializeApp() async {
    final profile = await authRepository.profile();
    Cache.profile = profile;
    emit(AuthState.authorized(profile));
  }
}
