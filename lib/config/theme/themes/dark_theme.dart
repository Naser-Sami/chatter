import 'package:flutter/material.dart';
import '/config/theme/_theme.dart';

ThemeData _darkTheme = ThemeData.dark(useMaterial3: true).copyWith(
  brightness: Brightness.dark,
  scaffoldBackgroundColor: DarkThemeColors.surface,
  colorScheme: colorSchemeDark,
  textTheme: TTextTheme.darkTextTheme,
  primaryTextTheme: TTextTheme.darkTextTheme,
  textButtonTheme: darkTextButtonTheme,
  extensions: darkExtensions,
  dividerTheme: darkDividerTheme,
  dividerColor: DarkThemeColors.onBackground.withOpacity(0.25),
  bottomNavigationBarTheme: darkBottomNavigationBarThemeData,
);

ThemeData get darkTheme => _darkTheme;
