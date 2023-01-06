import 'package:flutter_mvvm_application/models/domain/repositories/auth_repository.dart';

import '../../../../initialize_dependencies.dart';
import '../../../domain/entities/authentication_model.dart';
import '../../../domain/entities/profile_model.dart';
import '../../data_sources/local/local_service.dart';
import '../../data_sources/mock/auth_mock_data_source.dart';

class AuthRepositoryImpl implements AuthRepository {
  AuthDatasource authDatasource;
  LocalService localService = sl();

  AuthRepositoryImpl(this.authDatasource);

  @override
  Future<AuthenticationModel> login(String userName, String passWord) {
    return authDatasource.login(userName, passWord);
  }

  @override
  Future logout() {
    return authDatasource.logout();
  }

  @override
  Future<ProfileModel> profile() {
    return authDatasource.profile();
  }

  @override
  Future<String> defaultData() async {
    if (localService.isAuthorized()) {
      return 'Data Auth';
    } else {
      return 'Data UnAuth';
    }
  }
}