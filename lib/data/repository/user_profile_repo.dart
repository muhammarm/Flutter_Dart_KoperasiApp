import 'package:koperasi/data/models/user_profile.dart';

abstract class UserProfileRepo {
  Future<UserProfile?> getUserProfile();
  Future<int?> updateUserProfile(UserProfile userProfile);
}
