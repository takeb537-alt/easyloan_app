import 'package:flutter/material.dart';
import '../main.dart';

class KycScreen extends StatelessWidget {
  const KycScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Complete KYC")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            const TextField(decoration: InputDecoration(labelText: "Full Name")),
            const TextField(decoration: InputDecoration(labelText: "PAN")),
            const TextField(decoration: InputDecoration(labelText: "DOB")),
            const TextField(decoration: InputDecoration(labelText: "UPI ID")),
            const TextField(decoration: InputDecoration(labelText: "Address")),
            const TextField(decoration: InputDecoration(labelText: "City")),
            const TextField(decoration: InputDecoration(labelText: "State")),
            const TextField(decoration: InputDecoration(labelText: "Pincode")),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () => Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => const MainNavigationScreen())),
              child: const Text("Submit KYC"),
            ),
          ],
        ),
      ),
    );
  }
}
