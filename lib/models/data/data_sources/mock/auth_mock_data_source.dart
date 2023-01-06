import 'package:flutter_mvvm_application/models/domain/repositories/auth_repository.dart';

import '../../../domain/entities/authentication_model.dart';
import '../../../domain/entities/profile_model.dart';
import '../../dtos/authentication_dto.dart';
import '../../dtos/profile_dto.dart';

abstract class AuthDatasource extends AuthRepository {

}

class AuthMockDataSource implements AuthDatasource {
  @override
  Future<AuthenticationModel> login(String userName, String passWord) async {
    return AuthenticationDto('accessToken', 'refreshToken');
  }

  @override
  Future logout() async {
  }

  @override
  Future<ProfileModel> profile() async {
    return ProfileDto('duc');
  }

  @override
  Future<String> defaultData() async {
    return 'Data Auth';
  }
}