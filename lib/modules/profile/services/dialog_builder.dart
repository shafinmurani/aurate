import 'package:flutter/material.dart';

class DialogBuilder {
  static Future<void> build(BuildContext context,
    {required String title,
    required String content,
    required List<Widget> actions}) {
  return showDialog<void>(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
          title: Text(title),
          content: Text(
            content,
          ),
          actions: actions
          );
    },
  );
}
}
