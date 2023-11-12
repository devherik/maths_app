import 'package:flutter/material.dart';

class WidgetsUtil {
  void showMessage(String label, context) {
    final snack = SnackBar(
      content: Text(
        label,
        style: const TextStyle(fontWeight: FontWeight.w800),
        textAlign: TextAlign.center,
      ),
      backgroundColor: Colors.redAccent,
    );
    ScaffoldMessenger.of(context).showSnackBar(snack);
  }
}
