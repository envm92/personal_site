import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

final ThemeData customTheme = _buildTheme();

ThemeData _buildTheme() {
  var baseTheme = ThemeData(
    brightness: Brightness.dark,
    primaryColorDark: Colors.pink
  );
  return baseTheme.copyWith(
      textTheme: GoogleFonts.sourceCodeProTextTheme(baseTheme.textTheme)
  );
}