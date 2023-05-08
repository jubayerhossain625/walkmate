import 'package:flutter/material.dart';

final darkTheme = ThemeData(
  primaryColor: Colors.black,
  brightness: Brightness.dark,
  dividerColor: Colors.black12,
  colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.grey ).copyWith(
      background:const Color(0xFF191A1B)).copyWith(
      secondary: const Color(0xFFFFFFFF), brightness: Brightness.dark,),
);

final lightTheme = ThemeData(
  primaryColor: Colors.white,
  brightness: Brightness.light,
  dividerColor: const Color(0xFFFFFFFF),
  colorScheme: ColorScheme.fromSwatch(
      primarySwatch: Colors.grey).copyWith(
      background:const Color(0xFFFFFFFF)).copyWith(
      secondary: Colors.black, brightness: Brightness.light),
);