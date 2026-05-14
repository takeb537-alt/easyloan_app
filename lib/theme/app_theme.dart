import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTheme {
  static const Color primaryGreen = Color(0xFF5BA8A0);
  static const Color lightBg = Color(0xFFF0F4F3);
  static const Color darkBg = Color(0xFF1A2B2A);
  static const Color darkCard = Color(0xFF243B39);

  static ThemeData get lightTheme => ThemeData(
        brightness: Brightness.light,
        scaffoldBackgroundColor: lightBg,
        primaryColor: primaryGreen,
        colorScheme: const ColorScheme.light(
          primary: primaryGreen,
          secondary: primaryGreen,
          surface: Colors.white,
        ),
        textTheme: GoogleFonts.nunitoTextTheme(
          const TextTheme(
            bodyLarge: TextStyle(color: Colors.black87),
            bodyMedium: TextStyle(color: Colors.black54),
          ),
        ),
        appBarTheme: AppBarTheme(
          backgroundColor: lightBg,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.black87),
          titleTextStyle: GoogleFonts.nunito(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        useMaterial3: true,
      );

  static ThemeData get darkTheme => ThemeData(
        brightness: Brightness.dark,
        scaffoldBackgroundColor: darkBg,
        primaryColor: primaryGreen,
        colorScheme: const ColorScheme.dark(
          primary: primaryGreen,
          secondary: primaryGreen,
          surface: darkCard,
        ),
        textTheme: GoogleFonts.nunitoTextTheme(
          const TextTheme(
            bodyLarge: TextStyle(color: Colors.white),
            bodyMedium: TextStyle(color: Colors.white70),
          ),
        ).apply(bodyColor: Colors.white, displayColor: Colors.white),
        appBarTheme: AppBarTheme(
          backgroundColor: darkBg,
          elevation: 0,
          iconTheme: const IconThemeData(color: Colors.white),
          titleTextStyle: GoogleFonts.nunito(
            color: Colors.white,
            fontSize: 18,
            fontWeight: FontWeight.w700,
          ),
        ),
        useMaterial3: true,
      );
}