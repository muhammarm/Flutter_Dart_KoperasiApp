import 'package:flutter/material.dart';

class NavigationHeader extends StatelessWidget {
  GestureTapCallback actionCallback;
  String title = '';

  NavigationHeader(
      {Key? key, required this.title, required this.actionCallback})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: actionCallback,
      child: Row(
        children: [
          const SizedBox(
            width: 24,
            height: 24,
            child: Image(
              image: AssetImage('assets/images/arrow-left-thick.png'),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          ),
        ],
      ),
    );
  }
}
