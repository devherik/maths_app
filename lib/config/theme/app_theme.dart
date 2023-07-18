import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

abstract class AppTheme {
  static ThemeData get light {
    return ThemeData(
      appBarTheme: const AppBarTheme(
        elevation: 0.0,
        color: Colors.transparent,
      ),
      scaffoldBackgroundColor: const Color.fromARGB(
        255,
        206,
        228,
        180,
      ),
      primarySwatch: Colors.lightGreen,
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.lightGreen),
      useMaterial3: true,
      fontFamily: GoogleFonts.raleway().fontFamily,
    );
  }
}
