import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_mvvm_application/models/domain/repositories/auth_repository.dart';
import 'package:get_it/get_it.dart';
import '../../initialize_dependencies.dart';
import 'home_state.dart';

class HomeBloc extends Cubit<HomeState> {
  HomeBloc() : super(const HomeState.loading());
  AuthRepository authRepository = sl();
  Future fetchDefaultData() async {
    var data = await authRepository.defaultData();
    emit(HomeState(data));
  }
}