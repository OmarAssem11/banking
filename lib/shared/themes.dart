import 'package:flutter/material.dart';

final lightTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Color(0xff150050),
    onPrimary: Colors.white,
    secondary: Color(0xff52616B),
    onSecondary: Colors.black,
    error: Color.fromARGB(255, 122, 42, 47),
    onError: Color.fromARGB(255, 156, 25, 145),
    background: Colors.white,
    onBackground: Color.fromARGB(255, 59, 42, 207),
    surface: Color.fromARGB(255, 235, 232, 232),
    onSurface: Color.fromARGB(255, 10, 85, 95),
    outline: Colors.white,
    tertiary: Colors.white,
    onTertiary: Colors.black,
    tertiaryContainer: Color.fromARGB(255, 59, 42, 207),
  ),
  textTheme: const TextTheme(
    subtitle1: TextStyle(
      fontSize: 16,
      color: Colors.blueGrey,
    ),
    subtitle2: TextStyle(
      fontSize: 12,
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
    headline6: TextStyle(
      fontSize: 20,
      color: Colors.black,
    ),
    bodyText1: TextStyle(
      fontSize: 15,
      color: Colors.black,
      fontWeight: FontWeight.bold,
    ),
  ),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.black),
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.black,
    ),
    backgroundColor: Colors.white,
    shape: Border(
      bottom: BorderSide(
        color: Colors.white,
      ),
    ),
    elevation: 0,
  ),
  scaffoldBackgroundColor: Colors.white,
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Color(0xff150050),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Colors.white,
  ),
  snackBarTheme: const SnackBarThemeData(
    contentTextStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  ),
  dialogTheme: const DialogTheme(
    titleTextStyle: TextStyle(
      color: Colors.black,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    backgroundColor: Colors.white,
  ),
);

final darkTheme = ThemeData(
  colorScheme: const ColorScheme(
    brightness: Brightness.light,
    primary: Colors.black,
    onPrimary: Colors.black,
    secondary: Color.fromARGB(255, 171, 174, 177),
    onSecondary: Colors.white,
    error: Color.fromARGB(255, 122, 42, 47),
    onError: Color.fromARGB(255, 156, 25, 145),
    background: Color.fromARGB(255, 13, 4, 39),
    onBackground: Color.fromARGB(255, 33, 10, 73),
    surface: Color.fromARGB(255, 7, 1, 27),
    onSurface: Color.fromARGB(255, 82, 83, 85),
    outline: Color.fromARGB(255, 171, 174, 177),
    tertiary: Color.fromARGB(255, 7, 1, 27),
    onTertiary: Color.fromARGB(255, 171, 174, 177),
    tertiaryContainer: Color.fromARGB(255, 57, 12, 136),
  ),
  textTheme: const TextTheme(
    subtitle1: TextStyle(
      fontSize: 16,
      color: Colors.blueGrey,
    ),
    subtitle2: TextStyle(
      fontSize: 12,
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
    headline6: TextStyle(
      fontSize: 20,
      color: Colors.white,
    ),
    bodyText1: TextStyle(
      fontSize: 15,
      color: Colors.white,
      fontWeight: FontWeight.bold,
    ),
  ),
  appBarTheme: const AppBarTheme(
    iconTheme: IconThemeData(color: Colors.white),
    titleTextStyle: TextStyle(
      fontSize: 20,
      fontWeight: FontWeight.bold,
      color: Colors.white,
    ),
    backgroundColor: Colors.black,
    shape: Border(
      bottom: BorderSide(),
    ),
  ),
  scaffoldBackgroundColor: Colors.black,
  progressIndicatorTheme: const ProgressIndicatorThemeData(
    color: Color.fromARGB(255, 170, 23, 12),
  ),
  bottomSheetTheme: const BottomSheetThemeData(
    backgroundColor: Color.fromARGB(255, 7, 1, 27),
  ),
  snackBarTheme: const SnackBarThemeData(
    contentTextStyle: TextStyle(
      fontSize: 16,
      fontWeight: FontWeight.bold,
    ),
  ),
  dialogTheme: const DialogTheme(
    titleTextStyle: TextStyle(
      color: Colors.white,
      fontSize: 20,
      fontWeight: FontWeight.bold,
    ),
    backgroundColor: Colors.black,
  ),
);
