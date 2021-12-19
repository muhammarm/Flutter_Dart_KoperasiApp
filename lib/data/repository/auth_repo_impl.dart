import 'package:koperasi/data/api/api_helper.dart';
import 'package:koperasi/data/models/auth_data.dart';
import 'package:koperasi/data/repository/auth_repo.dart';
import 'package:koperasi/utils/api_response_status.dart';
import 'package:koperasi/utils/string_compare.dart';

class AuthRepoImpl implements AuthRepo{
  
  ApiHelper apiHelper;


  AuthRepoImpl(this.apiHelper);

  @override
  Future<bool> logout(String token) {
    // TODO: implement logout
    throw UnimplementedError();
  }

  @override
  Future<Map<String, dynamic>?> userLogin(AuthData authData) async {
    try{
      final apiResponse = await apiHelper.postData('/login', authData.toMap());
      if (apiResponse.status.equalsIgnoreCase(ApiResponseStatus.SUCCESS.toShortString())) {
        final loginInfo = apiResponse.data as Map<String, dynamic>;
        print('login info');
        print(loginInfo);
        return loginInfo;
      } else {
        return null;
      }
    }catch(e){
      print(e);
      rethrow;
    }
  }
  
}