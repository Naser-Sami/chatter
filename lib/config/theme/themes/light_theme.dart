import 'package:flutter/material.dart';
import '/config/theme/_theme.dart';

ThemeData _lightTheme = ThemeData.light(useMaterial3: true).copyWith(
  brightness: Brightness.light,
  colorScheme: colorSchemeLight,
  textTheme: TTextTheme.lightTextTheme,
  primaryTextTheme: TTextTheme.lightTextTheme,
  textButtonTheme: lightTextButtonTheme,
  scaffoldBackgroundColor: LightThemeColors.scaffoldBackground,
  extensions: lightExtensions,
  dividerTheme: lightDividerTheme,
  dividerColor: LightThemeColors.onBackground.withOpacity(0.25),
);

ThemeData get lightTheme => _lightTheme;
