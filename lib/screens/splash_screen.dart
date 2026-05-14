import 'package:flutter/material.dart';
import 'dart:async';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _fadeAnim;
  late Animation<double> _scaleAnim;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 1200),
    );
    _fadeAnim = CurvedAnimation(parent: _controller, curve: Curves.easeIn);
    _scaleAnim = Tween<double>(begin: 0.7, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.elasticOut),
    );
    _controller.forward();

    Timer(const Duration(seconds: 3), () {
      if (mounted) {
        Navigator.of(context).pushReplacement(
          PageRouteBuilder(
            pageBuilder: (_, __, ___) => const HomeScreen(),
            transitionsBuilder: (_, anim, __, child) =>
                FadeTransition(opacity: anim, child: child),
            transitionDuration: const Duration(milliseconds: 500),
          ),
        );
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF0F4F3),
      body: Center(
        child: FadeTransition(
          opacity: _fadeAnim,
          child: ScaleTransition(
            scale: _scaleAnim,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                // Logo area
                Row(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    // Circular logo with rings
                    SizedBox(
                      width: 90,
                      height: 90,
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          // Colored rings
                          CustomPaint(
                            size: const Size(90, 90),
                            painter: _RingsPainter(),
                          ),
                          // Avatar circle
                          Container(
                            width: 54,
                            height: 54,
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: const Color(0xFF1B4F72),
                              border: Border.all(
                                  color: Colors.white, width: 2),
                            ),
                            child: ClipOval(
                              child: Container(
                                color: const Color(0xFF5BA8A0),
                                child: const Icon(
                                  Icons.person,
                                  size: 34,
                                  color: Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Text
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                text: 'Easy',
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFF1B4F72),
                                  fontFamily: 'Nunito',
                                ),
                              ),
                              TextSpan(
                                text: 'Loan',
                                style: TextStyle(
                                  fontSize: 36,
                                  fontWeight: FontWeight.w900,
                                  color: Color(0xFF5BA8A0),
                                  fontFamily: 'Nunito',
                                ),
                              ),
                            ],
                          ),
                        ),
                        const Text(
                          'Your Categories, Your Amount.',
                          style: TextStyle(
                            fontSize: 13,
                            color: Colors.black54,
                            fontFamily: 'Nunito',
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _RingsPainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final cx = size.width / 2;
    final cy = size.height / 2;
    final rings = [
      const Color(0xFFAED6F1),
      const Color(0xFFA9DFBF),
      const Color(0xFFF9E79F),
      const Color(0xFFD7BDE2),
    ];
    final offsets = [
      const Offset(-8, -6),
      const Offset(8, -6),
      const Offset(0, 10),
      const Offset(0, -10),
    ];
    for (int i = 0; i < rings.length; i++) {
      final paint = Paint()
        ..color = rings[i].withOpacity(0.75)
        ..style = PaintingStyle.stroke
        ..strokeWidth = 3.5;
      canvas.drawCircle(
        Offset(cx + offsets[i].dx, cy + offsets[i].dy),
        28,
        paint,
      );
    }
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) => false;
}