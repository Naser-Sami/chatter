import 'package:flutter/material.dart';
import '/config/theme/_theme.dart';

ThemeData _lightTheme = ThemeData.light(useMaterial3: true).copyWith(
  brightness: Brightness.light,
  scaffoldBackgroundColor: LightThemeColors.surface,
  colorScheme: colorSchemeLight,
  textTheme: TTextTheme.lightTextTheme,
  primaryTextTheme: TTextTheme.lightTextTheme,
  textButtonTheme: lightTextButtonTheme,
  extensions: lightExtensions,
  dividerTheme: lightDividerTheme,
  dividerColor: LightThemeColors.onBackground.withOpacity(0.25),
  bottomNavigationBarTheme: lightBottomNavigationBarThemeData,
);

ThemeData get lightTheme => _lightTheme;
