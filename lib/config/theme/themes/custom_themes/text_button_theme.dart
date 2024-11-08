import 'package:flutter/material.dart';
import '/config/_config.dart';

final darkTextButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(
    elevation: 0,
    overlayColor: DarkThemeColors.onPrimaryFixedVariant,
    foregroundColor: DarkThemeColors.tertiary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TRadius.bR08),
    ),
    textStyle: TTextStyle.titleMedium().apply(
      color: DarkThemeColors.text,
    ),
  ),
);

final lightTextButtonTheme = TextButtonThemeData(
  style: TextButton.styleFrom(
    elevation: 0,
    overlayColor: LightThemeColors.onPrimaryFixedVariant,
    foregroundColor: LightThemeColors.tertiary,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(TRadius.bR08),
    ),
    textStyle: TTextStyle.titleMedium().apply(
      color: LightThemeColors.text,
    ),
  ),
);
