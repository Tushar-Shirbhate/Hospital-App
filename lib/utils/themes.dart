import 'package:flutter/material.dart';

class MyThemes {
  static final primary = Colors.blue;
  static final primaryColor = Colors.blue.shade300;

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: ColorScheme.dark(primary: primary),
    primaryColorDark: primaryColor,
    dividerColor: Colors.white,
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    primaryColorDark: primaryColor,
    colorScheme: ColorScheme.dark(primary: primary),
    dividerColor: Colors.black,
  );
}
