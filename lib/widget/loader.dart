import 'package:flutter/material.dart';

class Loader extends StatelessWidget {
  double? opacity;
  bool? dismissibles;
  Color? color;
  String? loadingTxt;

  Loader(
      {Key? key, this.opacity, this.dismissibles, this.color, this.loadingTxt})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: opacity ?? 0.5,
          child: const ModalBarrier(dismissible: false, color: Colors.black),
        ),
        Container(
          alignment: Alignment.center,
          padding: const EdgeInsets.only(bottom: 64),
          child: const CircularProgressIndicator(),
        ),
        Center(
          child: Container(
            margin: const EdgeInsets.only(top: 5),
            child: Text(loadingTxt ?? 'Mohon tunggu...',
                style: const TextStyle(color: Colors.white70, fontSize: 18)),
          ),
        ),
      ],
    );
  }
}
