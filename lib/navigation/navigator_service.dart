import 'package:flutter/cupertino.dart';

class NavigatorService {
  final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

  Future<dynamic> navigateTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  Future<dynamic> navigatePushTo(String routeName) {
    return navigatorKey.currentState!.pushNamed(routeName);
  }

  Future<dynamic> navigatePopAndPushTo(String routeName) {
    return navigatorKey.currentState!.popAndPushNamed(routeName);
  }

  // Future<dynamic> navigateToLogin() {
  //   return navigatorKey.currentState!.pushAndRemoveUntil(
  //       MaterialPageRoute(builder: (context) => SigninScreen()),
  //           (Route<dynamic> route) => false);
  // }

  goBack() {
    navigatorKey.currentState!.pop();
  }
}