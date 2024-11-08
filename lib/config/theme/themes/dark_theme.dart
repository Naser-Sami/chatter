import 'package:flutter/material.dart';
import '/config/theme/_theme.dart';

ThemeData _darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: DarkThemeColors.scaffoldBackground,
  colorScheme: colorSchemeDark,
  textTheme: TTextTheme.darkTextTheme,
  primaryTextTheme: TTextTheme.darkTextTheme,
  textButtonTheme: darkTextButtonTheme,
  extensions: darkExtensions,
  dividerTheme: darkDividerTheme,
  dividerColor: DarkThemeColors.onBackground.withOpacity(0.25),
  // buttonTheme: const ButtonThemeData(
  //   splashColor: Colors.transparent,
  //   highlightColor: Colors.transparent,
  //   hoverColor: Colors.transparent,
  // ),
  // typography: Typography(),
  // -- Text form field
  // inputDecorationTheme:
  // -- Elevated Button
  // elevatedButtonTheme:
);

ThemeData get darkTheme => _darkTheme;
