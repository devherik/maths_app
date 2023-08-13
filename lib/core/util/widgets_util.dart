import 'package:flutter/material.dart';

class WidgetsUtil {
  void showMessage(String label, context) {
    final snack = SnackBar(
      content: Text(
        label,
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.redAccent,
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }
}
