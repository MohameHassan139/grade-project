import 'package:flutter/material.dart';

Future<void> pushScreen(
    {required BuildContext context, required Widget screen}) async {
  ThemeData themeData = Theme.of(context);
  Navigator.push(
    context,
    MaterialPageRoute(
      builder: (_) => Theme(data: themeData, child: screen),
    ),
  );
}
