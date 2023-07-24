import 'dart:io';

import 'package:flutter/material.dart';

class HomeBloc {
  double c$ = 0;
  double l$ = 0;
  double a$ = 0;

  double meterCubic() {
    return c$ * a$ * l$;
  }

  double somaContinua(sum, c) {
    return sum + c;
  }

  double difZero(value) {
    if (value != '') {
      return double.parse(value);
    } else {
      return 0;
    }
  }

  // validate functions

  bool isEmpty() {
    if (a$ == 0 || c$ == 0 || l$ == 0) {
      return true;
    } else {
      return false;
    }
  }

  // behavior fuctions

  void closeApp() {
    exit(0);
  }
}
