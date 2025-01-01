import 'package:flutter/material.dart';

ThemeData darkTheme = ThemeData(
  colorScheme: ColorScheme.dark(
    surface: const Color(0xFF212121),
    primary: Colors.grey.shade100,
    secondary: const Color(0xFF616161),
    tertiary: const Color(0xFF393939),
    inversePrimary: Colors.grey.shade300,
  ),
  dialogTheme: DialogTheme(
    titleTextStyle: TextStyle(
      color: const Color(0xFFE0E0E0),
      fontSize: 25,
      fontWeight: FontWeight.w600,
    ),
    contentTextStyle: TextStyle(color: const Color(0xFFE0E0E0)),
    backgroundColor: const Color(0xFF212121),
  ),
  iconTheme: IconThemeData(
    color: Colors.grey.shade200,
  ),
);
