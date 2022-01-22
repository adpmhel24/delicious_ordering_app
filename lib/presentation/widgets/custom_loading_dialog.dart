import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';

Future<Object?> customLoadingDialog(BuildContext context) {
  return showAnimatedDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        content: Container(
          height: 100.0,
          child: Center(
            child: CircularProgressIndicator(),
          ),
        ),
      );
    },
    animationType: DialogTransitionType.size,
    curve: Curves.fastOutSlowIn,
  );
}
