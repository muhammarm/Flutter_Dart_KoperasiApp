import 'package:flutter/material.dart';

class KaskitaFormButton extends StatelessWidget {
  Function actionCallback;
  String title;
  double paddingTop = 15;
  double paddingBottom = 15;

  KaskitaFormButton(
      {Key? key, required this.title, required this.actionCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
          padding: EdgeInsets.only(top: paddingTop, bottom: paddingBottom),
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30.0))),
      onPressed: () {
        actionCallback();
      },
      child: Text(title, style: Theme.of(context).textTheme.button),
    );
  }
}
