import 'package:flutter/material.dart';

class MyThemes {
  static const primary = Colors.blue;
  static const primaryColor = Colors.white;

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(primary: primary),
    primaryColorDark: primaryColor,
    dividerColor: Colors.white,
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.white,
    primaryColorDark: primaryColor,
    colorScheme: const ColorScheme.light(primary: primary),
    dividerColor: Colors.black,
  );
}
