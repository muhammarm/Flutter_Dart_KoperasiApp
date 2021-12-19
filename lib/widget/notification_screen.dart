import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';

class NotificationScreen extends StatelessWidget {
  final String? header;
  final String title;
  final String? subtitle;
  final Function? textClickableCallback;
  final String? textClickableTitle;
  final String? checkImage;

  NotificationScreen(
      {Key? key,
        this.header,
        required this.title,
        this.subtitle,
        this.textClickableTitle,
        this.textClickableCallback,
        this.checkImage})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Expanded(
          child: ListView(
            children: [
              Row(
                children: [
                  Container(
                      width: 128,
                      height: 128,
                      margin: const EdgeInsets.fromLTRB(6, 32, 0, 32),
                      child: Image.asset(
                          'assets/images/koperasi_indonesia-logo.png')),
                ],
              ),
              Center(
                  child: Image(image: AssetImage('assets/images/$checkImage'))),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 32, 0, 0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(0, 0, 0, 32),
                          child: Text(
                            header ?? 'Yey!',
                            style: Theme.of(context).textTheme.headline2,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Text(
                            title,
                            style: Theme.of(context).textTheme.bodyText1,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                              text: subtitle ?? '',
                              style: Theme.of(context).textTheme.headline5,
                              children: [
                                textClickableCallback != null
                                    ? TextSpan(
                                    text: textClickableTitle,
                                    style: Theme.of(context).textTheme.headline3,
                                    recognizer: TapGestureRecognizer()
                                      ..onTap = () => textClickableCallback!())
                                    : const TextSpan(),
                              ]),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        )



      ],
    );
  }
}
