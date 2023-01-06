import '../../../domain/entities/authentication_model.dart';
import '../../../domain/entities/profile_model.dart';
import '../mock/auth_mock_data_source.dart';

class AuthLocalDataSource extends AuthDatasource{
  @override
  Future<AuthenticationModel> login(String userName, String passWord) {
    // TODO: implement login
    throw UnimplementedError();
  }

  @override
  Future logout() {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<ProfileModel> profile() {
    // TODO: implement profile
    throw UnimplementedError();
  }

  @override
  Future<String> defaultData() async {
    return 'Data unAuth';
  }
}