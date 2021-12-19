enum ScreenEvent { NONE, LOADING, SUCCESS, FAILED }

extension ParseToString on ScreenEvent {
  String toShortString() {
    return toString().split('.').last;
  }
}

class ScreenState {
  ScreenEvent event = ScreenEvent.NONE;
  dynamic data;
  String? message;

  ScreenState._privateConstructor();

  static final ScreenState _internal = ScreenState._privateConstructor();


//
//  ScreenState(this.event, {this.data, this.message});

  static idle() {
    _internal.event = ScreenEvent.NONE;
    return _internal;
  }

  static loading() {
    _internal.event = ScreenEvent.LOADING;
    return _internal;
  }

  static success(dynamic data) {
    _internal.event = ScreenEvent.SUCCESS;
    _internal.data = data;
    return _internal;
  }

  static failed(String? message) {
    _internal.event = ScreenEvent.FAILED;
    _internal.message = message ?? '';
    return _internal;
  }
}
