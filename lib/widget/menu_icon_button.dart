import 'package:flutter/material.dart';

class MenuIconButton extends StatelessWidget {
  Function actionCallback;
  String title;
  IconData iconData;

  MenuIconButton(
      {Key? key,
        required this.title,
        required this.iconData,
        required this.actionCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        actionCallback();
      },
      child: Row(
        children: [
          Icon(
            iconData,
            color: Theme.of(context).primaryColor,
            size: 32.0,
          ),
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(5),
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                      width: 1, color: Theme.of(context).primaryColorLight),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(5.0),
                child: Text(
                  title,
                  style: Theme.of(context).textTheme.bodyText2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
