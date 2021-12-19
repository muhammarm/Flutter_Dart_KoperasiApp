import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TextStyles {
  static TextStyle light12(BuildContext context) {
    return Theme.of(context).textTheme.subtitle1!.copyWith(
      fontWeight: FontWeight.w300,
      fontSize: 12,
      color: Colors.black54,
    );
  }

  static TextStyle fieldTitle(BuildContext context) {
    return Theme.of(context).textTheme.subtitle1!.copyWith(
      fontWeight: FontWeight.w300,
      fontSize: 10,
      color: Colors.black54,
    );
  }

  static TextStyle fieldTitleSemibold(BuildContext context) {
    return Theme.of(context).textTheme.subtitle1!.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 11,
      color: Colors.black54,
    );
  }

  static TextStyle fieldInput(BuildContext context) {
    return Theme.of(context).textTheme.subtitle1!.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 12,
      color: Colors.black54,
    );
  }

  static TextStyle subTitleScreenBold(BuildContext context) {
    return Theme.of(context).textTheme.subtitle1!.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 13,
      color: Colors.black54,
    );
  }

  static TextStyle subTitleScreen(BuildContext context) {
    return Theme.of(context).textTheme.subtitle1!.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 13,
      color: Colors.black54,
    );
  }

  static TextStyle footerScreenBold(BuildContext context) {
    return Theme.of(context).textTheme.subtitle1!.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      color: Colors.black54,
    );
  }

  static TextStyle footerScreenBoldWhite(BuildContext context) {
    return Theme.of(context).textTheme.subtitle1!.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 20,
      color: Colors.white,
    );
  }

  static TextStyle footerScreen(BuildContext context) {
    return Theme.of(context).textTheme.subtitle1!.copyWith(
      fontWeight: FontWeight.w500,
      fontSize: 20,
      color: Colors.black54,
    );
  }

  static TextStyle regular14(BuildContext context) {
    return Theme.of(context).textTheme.subtitle1!.copyWith(
      fontWeight: FontWeight.w400,
      fontSize: 14,
      color: Colors.black54,
    );
  }

  static TextStyle semiBold18(BuildContext context) {
    return Theme.of(context).textTheme.subtitle1!.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 18,
      color: Colors.black54,
    );
  }

  static TextStyle semiBold24(BuildContext context) {
    return Theme.of(context).textTheme.subtitle1!.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 24,
      color: Colors.black54,
    );
  }

  static TextStyle semiBold12(BuildContext context) {
    return Theme.of(context).textTheme.subtitle1!.copyWith(
      fontWeight: FontWeight.w600,
      fontSize: 12,
      color: Colors.black54,
    );
  }
}
