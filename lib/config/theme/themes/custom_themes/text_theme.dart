import 'package:flutter/material.dart';

import '/config/theme/_theme.dart';

class TTextTheme {
  TTextTheme._();

  static TextTheme lightTextTheme = TextTheme(
    displayLarge: TTextStyle.displayLarge().apply(
      color: LightThemeColors.text,
    ),
    displayMedium: TTextStyle.displayMedium().apply(
      color: LightThemeColors.text,
    ),
    displaySmall: TTextStyle.displaySmall().apply(
      color: LightThemeColors.text,
    ),
    headlineLarge: TTextStyle.headlineLarge().apply(
      color: LightThemeColors.text,
    ),
    headlineMedium: TTextStyle.headlineMedium().apply(
      color: LightThemeColors.text,
    ),
    headlineSmall: TTextStyle.headlineSmall().apply(
      color: LightThemeColors.text,
    ),
    titleLarge: TTextStyle.titleLarge().apply(
      color: LightThemeColors.text,
    ),
    titleMedium: TTextStyle.titleMedium().apply(
      color: LightThemeColors.text,
    ),
    titleSmall: TTextStyle.titleSmall().apply(
      color: LightThemeColors.text,
    ),
    bodyLarge: TTextStyle.bodyLarge().apply(
      color: LightThemeColors.text,
    ),
    bodyMedium: TTextStyle.bodyMedium().apply(
      color: LightThemeColors.text.withOpacity(0.60),
    ),
    bodySmall: TTextStyle.bodySmall().apply(
      color: LightThemeColors.text.withOpacity(0.60),
    ),
    labelLarge: TTextStyle.labelLarge().apply(
      color: LightThemeColors.text.withOpacity(0.60),
    ),
    labelMedium: TTextStyle.labelMedium().apply(
      color: LightThemeColors.text.withOpacity(0.60),
    ),
    labelSmall: TTextStyle.labelSmall().apply(
      color: LightThemeColors.text.withOpacity(0.60),
    ),
  );

  static TextTheme darkTextTheme = TextTheme(
    displayLarge: TTextStyle.displayLarge().apply(
      color: DarkThemeColors.text,
    ),
    displayMedium: TTextStyle.displayMedium().apply(
      color: DarkThemeColors.text,
    ),
    displaySmall: TTextStyle.displaySmall().apply(
      color: DarkThemeColors.text,
    ),
    headlineLarge: TTextStyle.headlineLarge().apply(
      color: DarkThemeColors.text,
    ),
    headlineMedium: TTextStyle.headlineMedium().apply(
      color: DarkThemeColors.text,
    ),
    headlineSmall: TTextStyle.headlineSmall().apply(
      color: DarkThemeColors.text,
    ),
    titleLarge: TTextStyle.titleLarge().apply(
      color: DarkThemeColors.text,
    ),
    titleMedium: TTextStyle.titleMedium().apply(
      color: DarkThemeColors.text,
    ),
    titleSmall: TTextStyle.titleSmall().apply(
      color: DarkThemeColors.text,
    ),
    bodyLarge: TTextStyle.bodyLarge().apply(
      color: DarkThemeColors.text,
    ),
    bodyMedium: TTextStyle.bodyMedium().apply(
      color: DarkThemeColors.text.withOpacity(0.60),
    ),
    bodySmall: TTextStyle.bodySmall().apply(
      color: DarkThemeColors.text.withOpacity(0.60),
    ),
    labelLarge: TTextStyle.labelLarge().apply(
      color: DarkThemeColors.text.withOpacity(0.60),
    ),
    labelMedium: TTextStyle.labelMedium().apply(
      color: DarkThemeColors.text.withOpacity(0.60),
    ),
    labelSmall: TTextStyle.labelSmall().apply(
      color: DarkThemeColors.text.withOpacity(0.60),
    ),
  );
}
