import 'package:flutter/material.dart';

class Launch {
  static void launch(BuildContext context, Widget widget) {
    Navigator.of(context).push(new MaterialPageRoute(builder: (context) {
      return widget;
    }));
  }
}
