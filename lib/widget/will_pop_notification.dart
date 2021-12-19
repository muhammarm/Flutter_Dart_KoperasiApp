import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:koperasi/widget/bottom_sheet_dialog.dart';

Future<bool> willPopNotification(BuildContext context, String title,
    {bool isSystemExit = false}) async {
  return await showButtomSheetDialog(
      context, title, DialogType.EXIT, null, () {
    if (isSystemExit) {
      SystemChannels.platform.invokeMethod('SystemNavigator.pop');
    } else {
      Navigator.pop(context);
    }
  }, imageName: 'assets/images/exit_confirmation_2.png');
}

Future<bool> willPopExit() async {
  SystemChannels.platform.invokeMethod('SystemNavigator.pop');
  return false;
}
