import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '/const/theme/styles.dart';

final _baseLight = ThemeData.light();
final _baseDark = ThemeData.dark();

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
  disabledColor: Styles.grey3,
  backgroundColor: Colors.white,
  scaffoldBackgroundColor: Colors.white,
  iconTheme: const IconThemeData(color: Colors.white),
  appBarTheme: const AppBarTheme(
    backgroundColor: Styles.primaryColor,
  ),
  textTheme: GoogleFonts.mulishTextTheme(_baseLight.textTheme),
  buttonTheme: _baseLight.buttonTheme.copyWith(
    colorScheme: colorSchemeLight,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Styles.grey3),
    ),
  ),
);

final darkTheme = _baseDark.copyWith(
  colorScheme: colorSchemeDark,
  primaryColor: Styles.primaryColor,
  disabledColor: Styles.grey3,
  // backgroundColor: Colors.white,
  // scaffoldBackgroundColor: Colors.white,
  iconTheme: const IconThemeData(color: Colors.white),
  appBarTheme: const AppBarTheme(
    backgroundColor: Styles.primaryColor,
  ),
  textTheme: GoogleFonts.mulishTextTheme(_baseLight.textTheme),
  buttonTheme: _baseDark.buttonTheme.copyWith(
    colorScheme: colorSchemeDark,
  ),
  inputDecorationTheme: const InputDecorationTheme(
    enabledBorder: UnderlineInputBorder(
      borderSide: BorderSide(color: Styles.grey3),
    ),
  ),
);
