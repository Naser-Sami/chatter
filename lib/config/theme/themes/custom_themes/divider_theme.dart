import 'package:flutter/material.dart';

import '/config/_config.dart';

DividerThemeData? lightDividerTheme = DividerThemeData(
  space: 0,
  thickness: 1.2,
  color: LightThemeColors.onBackground.withOpacity(0.25),
);

DividerThemeData? darkDividerTheme = DividerThemeData(
  space: 0,
  thickness: 1.2,
  color: DarkThemeColors.onBackground.withOpacity(0.25),
);
