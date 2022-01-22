import 'package:flutter/material.dart';

class Go {
  static void to(BuildContext context, Widget widget) {
    Navigator.push(context, MaterialPageRoute(builder: (_) => widget));
  }

  static void off(BuildContext context, Widget widget,
      [bool showRouteNavigation = true]) async {
    if (showRouteNavigation) {
      Navigator.pushReplacement(
          context, MaterialPageRoute(builder: (_) => widget));
      return;
    }
    Navigator.push(context, MaterialPageRoute(builder: (_) => widget));
  }

  static void offAll(BuildContext context, Widget widget) async {
    Navigator.pushAndRemoveUntil(
        context, MaterialPageRoute(builder: (_) => widget), (_) => false);
  }

  static void popAndPushNamed(BuildContext context, String routeName) async {
    Navigator.popAndPushNamed(context, routeName);
  }

  static void pushNamed(BuildContext context, String routeName) async {
    Navigator.pushNamed(context, routeName);
  }

  static void back(BuildContext context) {
    Navigator.pop(context);
  }
}
