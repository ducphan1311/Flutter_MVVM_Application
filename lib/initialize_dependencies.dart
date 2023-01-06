import 'package:dio/dio.dart';
import 'package:flutter_mvvm_application/view_models/auth/auth_bloc.dart';
import 'package:flutter_mvvm_application/view_models/auth_navigation/auth_navigation_bloc.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'env.dart';
import 'models/data/data_sources/local/local_service.dart';
import 'models/data/data_sources/mock/auth_mock_data_source.dart';
import 'models/data/repositories_impl/auth/auth_repository_impl.dart';
import 'models/domain/repositories/auth_repository.dart';

final sl = GetIt.instance;

Future initializeDependencies() async {
  Dio dio = Dio(BaseOptions(baseUrl: Env.instance.baseURL));
  dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));

  sl.registerLazySingleton(() => dio);

  sl.registerLazySingleton<AuthDatasource>(() => AuthMockDataSource());

  sl.registerLazySingleton<AuthRepository>(() => AuthRepositoryImpl(sl()));

  //region Local Service
  GetIt.instance.registerSingleton(await SharedPreferences.getInstance());

  sl.registerLazySingleton(() => LocalService());
  //endregion

  sl.registerLazySingleton(() => AuthNavigationBloc());

  sl.registerLazySingleton(() => AuthBloc());
}
