import 'package:flutter/cupertino.dart';
import 'package:koperasi/utils/screen_state.dart';

abstract class BaseViewModel with ChangeNotifier {
  ScreenState _screenState = ScreenState.idle();
  ScreenState get screenState => _screenState;

  void setScreenState(ScreenState value) {
    _screenState = value;
    notifyListeners();
  }
}
