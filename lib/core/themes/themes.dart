import 'package:flutter/material.dart';
import 'package:skilltest/core/colors/colors.dart';

ThemeData themeData = ThemeData(
  scaffoldBackgroundColor: kBg,
  fontFamily: "Poppins",
  textSelectionTheme: const TextSelectionThemeData(
    cursorColor: kPrimary,
    selectionColor: Color.fromARGB(255, 116, 114, 206),
    selectionHandleColor: kPrimary,
  ),
  appBarTheme: const AppBarTheme(
    backgroundColor: Colors.white,
    surfaceTintColor: kWhite,
  ),
  cardTheme: CardThemeData(color: kWhite),
);
