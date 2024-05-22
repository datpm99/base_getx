import 'package:flutter/material.dart';
import '/const/theme/styles.dart';

final _baseLight = ThemeData.light(useMaterial3: false);
final _baseDark = ThemeData.dark(useMaterial3: false);

final colorSchemeLight = ColorScheme.fromSwatch(
  brightness: Brightness.light,
  accentColor: Styles.primaryColor,
  primarySwatch: Colors.lightBlue,
  backgroundColor: Colors.white,
);

final colorSchemeDark = ColorScheme.fromSwatch(
  brightness: Brightness.dark,
  accentColor: Styles.primaryColor,
  primarySwatch: Colors.lightBlue,
  backgroundColor: Colors.white,
);

final lightTheme = _baseLight.copyWith(
  colorScheme: colorSchemeLight,
  primaryColor: Styles.primaryColor,
  disabledColor: Styles.grey2,
  scaffoldBackgroundColor: Colors.white,
  iconTheme: const IconThemeData(color: Colors.white),
  appBarTheme: const AppBarTheme(backgroundColor: Styles.primaryColor),
  textTheme: _baseLight.textTheme.apply(fontFamily: 'Roboto'),
  buttonTheme: _baseLight.buttonTheme.copyWith(colorScheme: colorSchemeLight),
  inputDecorationTheme: const InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Styles.grey2),
    ),
  ),
);

final darkTheme = _baseDark.copyWith(
  colorScheme: colorSchemeDark,
  primaryColor: Styles.primaryColor,
  disabledColor: Styles.grey2,
  scaffoldBackgroundColor: Colors.white,
  iconTheme: const IconThemeData(color: Colors.white),
  appBarTheme: const AppBarTheme(backgroundColor: Styles.primaryColor),
  textTheme: _baseDark.textTheme.apply(fontFamily: 'Roboto'),
  buttonTheme: _baseDark.buttonTheme.copyWith(colorScheme: colorSchemeDark),
  inputDecorationTheme: const InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Styles.grey2),
    ),
  ),
);
