import 'package:flutter/material.dart';

class AppThemes {
  static ThemeData themeData = ThemeData(
    appBarTheme: AppThemes.appBarTheme,
    scaffoldBackgroundColor: Colors.yellowAccent[400],
  );
  static AppBarTheme appBarTheme =
      const AppBarTheme(backgroundColor: Colors.black);
}