import 'package:flutter/material.dart';

void showSnackBar({required BuildContext context, required String text}) {
  final snackBar = SnackBar(
    content: Text(text),
    backgroundColor: Colors.red,
  );
  ScaffoldMessenger.of(context).showSnackBar(snackBar);
}
