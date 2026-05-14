import 'package:flutter/material.dart';
import 'package:easy_loan/screens/home_screen.dart';

void main() {
  runApp(const EasyLoanApp());
}

class EasyLoanApp extends StatelessWidget {
  const EasyLoanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'EasyLoan',
      theme: ThemeData(
        // Font name agar use kar rahe hain
        // fontFamily: 'SFPro',
        scaffoldBackgroundColor: const Color(0xFFEAF1F1), // Light background from screenshot
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF6DAF9A), // Accent color from buttons
          primary: const Color(0xFF1F1F1F), // Standard text color
        ),
        useMaterialDesign: true,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
        ),
      ),
      home: const HomeScreen(),
    );
  }
}
