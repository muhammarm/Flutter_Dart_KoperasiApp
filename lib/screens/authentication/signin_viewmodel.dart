import 'package:koperasi/data/api/api_helper.dart';
import 'package:koperasi/data/api/api_helper_impl.dart';
import 'package:koperasi/data/models/auth_data.dart';
import 'package:koperasi/data/models/user_profile.dart';
import 'package:koperasi/data/repository/auth_repo.dart';
import 'package:koperasi/data/repository/auth_repo_impl.dart';
import 'package:koperasi/navigation/navigator_service.dart';
import 'package:koperasi/screens/base_viewmodel.dart';
import 'package:koperasi/use_cases/user_sign_in.dart';
import 'package:koperasi/utils/screen_state.dart';

class SignInViewModel extends BaseViewModel{
  final UserSignIn _userSignIn;
  //final NavigatorService _navigatorService;

  SignInViewModel(this._userSignIn);

  String? _username;
  String? get username => _username;

  bool? _logedIn;
  bool? get logedIn => _logedIn;

  String? _password;
  String? get password => _password;

  login(AuthData authData) async {
    try{
      setScreenState(ScreenState.loading());
      await _userSignIn.call(authData);
      _logedIn = true;
      notifyListeners();
      setScreenState(ScreenState.idle());

    } catch(e){
      print('kesini');
      setScreenState(ScreenState.idle());
      setScreenState(ScreenState.failed(e.toString()));
    }
  }


}