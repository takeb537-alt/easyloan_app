import 'package:flutter/material.dart';
import 'kyc_screen.dart';

class FaceVerificationScreen extends StatelessWidget {
  const FaceVerificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Face Verification")),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: Container(
              height: 250,
              width: 250,
              decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(125)),
              child: const Icon(Icons.camera_alt, size: 100, color: Colors.grey),
            ),
          ),
          const SizedBox(height: 30),
          const Text("Place your face inside the circle", style: TextStyle(fontSize: 16)),
          const SizedBox(height: 40),
          ElevatedButton(
            onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const KycScreen())),
            child: const Text("Start Verification"),
          ),
        ],
      ),
    );
  }
}
