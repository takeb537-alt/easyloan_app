import 'package:flutter/material.dart';
import 'face_verification_screen.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login")),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          children: [
            const TextField(decoration: InputDecoration(labelText: "Phone Number", border: OutlineInputBorder())),
            const SizedBox(height: 10),
            ElevatedButton(onPressed: () {}, child: const Text("Send OTP")),
            const SizedBox(height: 20),
            const TextField(decoration: InputDecoration(labelText: "OTP", border: OutlineInputBorder())),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const FaceVerificationScreen())),
                child: const Text("Verify"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
