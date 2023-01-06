import '../entities/authentication_model.dart';
import '../entities/profile_model.dart';

abstract class AuthRepository {
  Future<AuthenticationModel> login(String userName, String passWord);

  Future logout();

  Future<ProfileModel> profile();

  Future<String> defaultData();
}