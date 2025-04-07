// lib/theme.dart
import 'package:flutter/material.dart';

const Color primaryColor = Color(0xFFA75D5D);
const Color secondaryColor = Color(0xFFD3756B);
const Color accentColor = Color(0xFFF0997D);
const Color lightAccentColor = Color(0xFFFFC3A1);
const Color backgroundColor = Colors.white;
const Color textColor = Colors.black87;

ThemeData appTheme = ThemeData(
  primaryColor: primaryColor,
  hintColor: secondaryColor,
  scaffoldBackgroundColor: backgroundColor,
  textTheme: TextTheme(
    headlineLarge: TextStyle(
      fontSize: 32,
      fontWeight: FontWeight.bold,
      color: textColor,
    ),
    headlineMedium: TextStyle(
      fontSize: 24,
      fontWeight: FontWeight.w600,
      color: textColor,
    ),
    bodyLarge: TextStyle(
      fontSize: 16,
      color: textColor,
    ),
    bodyMedium: TextStyle(
      fontSize: 14,
      color: textColor,
    ),
  ),
  inputDecorationTheme: InputDecorationTheme(
    border: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: accentColor),
    ),
    focusedBorder: OutlineInputBorder(
      borderRadius: BorderRadius.circular(12),
      borderSide: BorderSide(color: primaryColor, width: 2),
    ),
    labelStyle: TextStyle(color: textColor),
  ),
  elevatedButtonTheme: ElevatedButtonThemeData(
    style: ElevatedButton.styleFrom(
      backgroundColor: primaryColor,
      foregroundColor: Colors.white,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(12),
      ),
      padding: EdgeInsets.symmetric(vertical: 16, horizontal: 24),
    ),
  ),
  colorScheme: ColorScheme.fromSwatch().copyWith(secondary: secondaryColor),
);