import 'package:koperasi/data/models/auth_data.dart';
import 'package:koperasi/data/repository/auth_repo.dart';

class UserSignIn {
  final AuthRepo authRepo;
  UserSignIn(this.authRepo);

  Future<Map<String, dynamic>?> call(AuthData authData) async {
    return authRepo.userLogin(authData);
  }
}
