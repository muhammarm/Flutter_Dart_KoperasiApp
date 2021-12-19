import 'package:koperasi/data/api/api_helper.dart';
import 'package:koperasi/data/db/db_helper.dart';
import 'package:koperasi/data/db/user_profile_dao.dart';
import 'package:koperasi/data/models/user_profile.dart';
import 'package:koperasi/data/repository/user_profile_repo.dart';
import 'package:koperasi/utils/api_response_status.dart';
import 'package:koperasi/utils/string_compare.dart';

class UserProfileRepoImpl implements UserProfileRepo {
  final db = DbHelper.instance;
  ApiHelper apiHelper;

  UserProfileRepoImpl(this.apiHelper);

  @override
  Future<UserProfile?> getUserProfile() async{
    try {
      print('user profile repo');
      final userProfileList = await db.getData(UserProfileDao.TABLE_NAME);
      if (userProfileList != null) {
        if (userProfileList.isNotEmpty) {
          Map<String, dynamic> userProfile = userProfileList.first;
          print('get user profile');
          print(userProfile);
          return UserProfile.fromMap(userProfile);
        } else {
          return null;
        }
      }
      return null;
    } catch (e) {
      print('error: $e');
      rethrow;
    }
  }

  @override
  Future<int?> updateUserProfile(UserProfile userProfile) async {
    try{
      final apiResponse = await apiHelper.postData('/profile', {
        'name': userProfile.name,
        'gender': userProfile.gender,
        'email': userProfile.email,
        'address': userProfile.address,
        'dateOfBirth': userProfile.dateOfBirth,
        'maritalStatus': userProfile.maritalStatus,
        'status': userProfile.status,
        'education': userProfile.education,
        'phone': userProfile.phone,
        'religion': userProfile.religion,
        'motherMaiden' : userProfile.motherMaiden,
        'fixedIncome' : userProfile.fixedIncome,
        'placeOfBirth' : userProfile.placeOfBirth
      });

      Map<String, dynamic> id = {'id' : '1'};
      UserProfile? userInfo = await getUserProfile();
      int? result;

      if(apiResponse.status.equalsIgnoreCase(ApiResponseStatus.SUCCESS.toShortString())){
        if(userInfo == null) {
          print('user info');
          print(userInfo);
          result = await db.insert(UserProfileDao.TABLE_NAME, {
            UserProfileDao.ID: '1',
            UserProfileDao.NAME_FIELD: userProfile.name,
            UserProfileDao.GENDER: userProfile.gender,
            UserProfileDao.EMAIL_FIELD: userProfile.email,
            UserProfileDao.ADDRESS: userProfile.address,
            UserProfileDao.DATE_OF_BIRTH: userProfile.dateOfBirth,
            UserProfileDao.MARITAL_STATUS_FIELD: userProfile.maritalStatus,
            UserProfileDao.STATUS_FIELD: userProfile.status,
            UserProfileDao.EDUCATION_FIELD: userProfile.education,
            UserProfileDao.PHONE_FIELD: userProfile.education,
            UserProfileDao.RELIGION: userProfile.religion,
            UserProfileDao.MOTHER_MAIDEN: userProfile.motherMaiden,
            UserProfileDao.FIXED_INCOME: userProfile.fixedIncome,
            UserProfileDao.PLACE_OF_BIRTH: userProfile.placeOfBirth
          },);
          print('Inserted data');
        }else{
          result = await db.update(UserProfileDao.TABLE_NAME, {
            UserProfileDao.NAME_FIELD: userProfile.name,
            UserProfileDao.GENDER: userProfile.gender,
            UserProfileDao.EMAIL_FIELD: userProfile.email,
            UserProfileDao.ADDRESS: userProfile.address,
            UserProfileDao.DATE_OF_BIRTH: userProfile.dateOfBirth,
            UserProfileDao.MARITAL_STATUS_FIELD: userProfile.maritalStatus,
            UserProfileDao.STATUS_FIELD: userProfile.status,
            UserProfileDao.EDUCATION_FIELD: userProfile.education,
            UserProfileDao.PHONE_FIELD: userProfile.education,
            UserProfileDao.RELIGION: userProfile.religion,
            UserProfileDao.MOTHER_MAIDEN: userProfile.motherMaiden,
            UserProfileDao.FIXED_INCOME: userProfile.fixedIncome,
            UserProfileDao.PLACE_OF_BIRTH: userProfile.placeOfBirth
          }, id);
          print('Updated data');
        }

        if(result != null){
          print('result');
          return 1;
        }else{
          return null;
        }
      }
    }catch(e){
      print(e);
    }
  }
}