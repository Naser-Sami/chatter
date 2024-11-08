import '/config/_config.dart';
import 'package:flutter/material.dart';

BottomNavigationBarThemeData lightBottomNavigationBarThemeData = const BottomNavigationBarThemeData(
  elevation: 0,
  backgroundColor: LightThemeColors.surface,
  selectedItemColor: LightThemeColors.primary,
  unselectedItemColor: LightThemeColors.secondary,
  showSelectedLabels: true,
  showUnselectedLabels: true,
);

BottomNavigationBarThemeData darkBottomNavigationBarThemeData = const BottomNavigationBarThemeData(
  elevation: 0,
  backgroundColor: DarkThemeColors.surface,
  selectedItemColor: DarkThemeColors.primary,
  unselectedItemColor: DarkThemeColors.secondary,
  showSelectedLabels: true,
  showUnselectedLabels: true,
);
