// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';

class MyThemes {
  static const primary = Colors.red;
  static const primaryColor = Colors.white;

  static final darkTheme = ThemeData(
    scaffoldBackgroundColor: Colors.grey.shade900,
    colorScheme: const ColorScheme.dark(primary: primary),
    primaryColorDark: primaryColor,
    // primaryTextTheme: Theme.of(context){
    //   return(accentColor(Colors.yellow));
    // },
    //cardColor: Colors.green,
    dividerColor: Colors.white,
  );

  static final lightTheme = ThemeData(
    scaffoldBackgroundColor: Color.fromRGBO(254, 23, 72, 1),
    primaryColorDark: Color.fromRGBO(254, 23, 72, 1),
    colorScheme: const ColorScheme.light(primary: primary),
    dividerColor: Colors.black,
  );
}
