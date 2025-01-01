import 'package:flutter/material.dart';

ThemeData lightTheme = ThemeData(
    colorScheme: ColorScheme.light(
      surface: const Color(0xFFDFE0DF),
      primary: const Color(0xFF151414),
      secondary: const Color(0xFFFFFFFF),
      tertiary: const Color(0xFFC8C8C8),
      inversePrimary: const Color(0xFF424242),
    ),
    dialogTheme: DialogTheme(
      titleTextStyle: TextStyle(color: const Color(0xFF151414)),
      contentTextStyle: TextStyle(color: const Color(0xFF151414)),
      backgroundColor: const Color(0xFFDFE0DF),
    ));
