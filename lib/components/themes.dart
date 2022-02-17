import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff150050),
    onPrimary: Color(0xffffffff),
    secondary: Color(0xff52616B),
    onSecondary: Color(0xff000000),
    error: Color.fromARGB(255, 122, 42, 47),
    onError: Color.fromARGB(255, 156, 25, 145),
    background: Color(0xffffffff),
    onBackground: Color.fromARGB(255, 59, 42, 207),
    surface: Color.fromARGB(255, 214, 213, 213),
    onSurface: Color.fromARGB(255, 10, 85, 95),
  ),
  textTheme: const TextTheme(
    subtitle1: TextStyle(
      fontSize: 16,
      color: Colors.blueGrey,
    ),
    subtitle2: TextStyle(
      fontSize: 10,
      color: Colors.blueGrey,
    ),
    headline1: TextStyle(
      fontSize: 18,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      fontSize: 14,
      color: Colors.black,
    ),
    headline3: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline4: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    headline5: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    labelMedium: TextStyle(
      color: Colors.grey,
      fontSize: 14,
    ),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    linearMinHeight: 10,
    color: Color(0xff150050),
    linearTrackColor: Colors.white,
  ),
);

final darkTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff000000),
    onPrimary: Color(0xff000000),
    secondary: Color.fromARGB(255, 171, 174, 177),
    onSecondary: Color(0xffffffff),
    error: Color.fromARGB(255, 122, 42, 47),
    onError: Color.fromARGB(255, 156, 25, 145),
    background: Color.fromARGB(255, 13, 4, 39),
    onBackground: Color.fromARGB(255, 33, 10, 73),
    surface: Color.fromARGB(255, 7, 1, 27),
    onSurface: Color.fromARGB(255, 82, 83, 85),
  ),
  textTheme: const TextTheme(
    subtitle1: TextStyle(
      fontSize: 16,
      color: Colors.blueGrey,
    ),
    subtitle2: TextStyle(
      fontSize: 10,
      color: Colors.blueGrey,
    ),
    headline1: TextStyle(
      fontSize: 18,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
    headline2: TextStyle(
      fontSize: 14,
      color: Colors.white,
    ),
    headline3: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    headline4: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: Color.fromARGB(255, 171, 174, 177),
    ),
    headline5: TextStyle(
      fontSize: 13,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    labelMedium: TextStyle(
      color: Colors.grey,
      fontSize: 14,
    ),
  ),
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    linearMinHeight: 10,
    color: Color.fromARGB(255, 170, 23, 12),
    linearTrackColor: Color.fromARGB(255, 33, 10, 73),
  ),
);
