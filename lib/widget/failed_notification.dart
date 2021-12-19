import 'package:flutter/material.dart';
import 'package:koperasi/widget/bottom_sheet_dialog.dart';

class FailedNotification extends StatelessWidget {
  const FailedNotification({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future.delayed(const Duration(milliseconds: 1000),(){
      showButtomSheetDialog(context, 'Oops..terjadi kendala teknis',
          DialogType.INFO, null, () {},
          imageName: 'assets/images/exit_confirmation_2.png');
    });
    return Container();
  }
}
