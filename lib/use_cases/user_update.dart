import 'package:koperasi/data/models/user_profile.dart';
import 'package:koperasi/data/repository/user_profile_repo.dart';

class UserUpdate{
  UserProfileRepo userProfileRepo;

  UserUpdate(this.userProfileRepo);

  Future<int?> call(UserProfile userInfo) async {
    return await userProfileRepo.updateUserProfile(userInfo);
  }

  Future<UserProfile?> getData() async{
    print('user profile use case');
    UserProfile? userProfile = await userProfileRepo.getUserProfile();
    print('user profile use case');
    print(userProfile);
    return userProfile;
  }
}