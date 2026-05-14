import 'package:flutter/material.dart';

class RepaymentScreen extends StatelessWidget {
  const RepaymentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Repayment")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const Text("Total Due: ₹ 1050"),
            const Text("Due Date: 25 May 2026"),
            const SizedBox(height: 20),
            const TextField(decoration: InputDecoration(labelText: "Partial Payment Amount")),
            const Spacer(),
            Container(
              height: 60,
              width: double.infinity,
              decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(30)),
              child: const Center(child: Text(">>> Swipe to Pay >>>", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
