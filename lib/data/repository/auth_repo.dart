import 'package:koperasi/data/models/auth_data.dart';

abstract class AuthRepo{
  Future<Map<String, dynamic>?> userLogin(AuthData authData);
  Future<bool> logout(String token);
}