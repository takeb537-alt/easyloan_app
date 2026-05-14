import 'dart:async';
import 'package:flutter/material.dart';

void main() {
  runApp(const EasyLoanApp());
}

class EasyLoanApp extends StatelessWidget {
  const EasyLoanApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Easy Loan',
      home: const SplashScreen(),
    );
  }
}

// --- Splash Screen Code ---
class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    // 3 second baad HomeScreen par bhejne ka logic
    Timer(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image 1000026368.png ko center mein dikhana
            Image.asset(
              'assets/1000026368.png',
              width: 250, 
            ),
          ],
        ),
      ),
    );
  }
}

// --- Next Screen (Home) ---
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Easy Loan Home")),
      body: const Center(
        child: Text("Welcome to Easy Loan App!"),
      ),
    );
  }
}
