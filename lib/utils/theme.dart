import 'package:flutter/material.dart';
import 'package:movable_cube/utils/colors.dart';

final theme = ThemeData(
    appBarTheme: const AppBarTheme(
      color: MyColors.amberActiveColor, // Укажите желаемый цвет AppBar
    ),
    colorScheme: ColorScheme.fromSeed(seedColor: MyColors.amberActiveColor),
    useMaterial3: true,
    textTheme: const TextTheme(
        labelMedium:
            TextStyle(color: MyColors.textDisActiveColor, fontSize: 16),
        labelSmall: TextStyle(color: MyColors.textActiveColor, fontSize: 16),
        titleMedium: TextStyle(color: MyColors.whiteColor, fontSize: 20)));
