import 'package:koperasi/data/models/user_profile.dart';
import 'package:koperasi/screens/base_viewmodel.dart';
import 'package:koperasi/use_cases/user_update.dart';
import 'package:koperasi/utils/screen_state.dart';

class ChangeProfileViewmodel extends BaseViewModel{
  final UserUpdate _userUpdate;

  ChangeProfileViewmodel(this._userUpdate){
    _onGetUserProfile();
  }

  UserProfile? _userProfile;

  UserProfile? get userProfile => _userProfile;

  int? _statusUpdated;

  int? get statusUpdated => _statusUpdated;

  // ChangeProfileViewmodel() {
  //   _onGetUserProfile();
  // }

   _onGetUserProfile() async {
    try {
      print('usr get data');
      setScreenState(ScreenState.loading());
      _userProfile = await _userUpdate.getData();
      print(_userProfile);
      setScreenState(ScreenState.idle());
    } catch (e) {
      print('error user get data');
      setScreenState(ScreenState.idle());
      setScreenState(ScreenState.failed(e.toString()));
    }
  }



  submitUpdateProfile(UserProfile userProfile) async {
    print('User profile');
    print(userProfile);
    try {
      setScreenState(ScreenState.loading());
      final statusUpdateProcess = await _userUpdate.call(userProfile);
      _statusUpdated = statusUpdateProcess;
      setScreenState(ScreenState.idle());
    } catch (e) {
      setScreenState(ScreenState.idle());
      setScreenState(ScreenState.failed(e.toString()));
    }
  }
}