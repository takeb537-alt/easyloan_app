import 'package:flutter/material.dart';

class LoanCalculatorScreen extends StatelessWidget {
  const LoanCalculatorScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Loan Calculator")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            const TextField(decoration: InputDecoration(labelText: "Loan Amount")),
            const TextField(decoration: InputDecoration(labelText: "Interest Rate (%)")),
            const TextField(decoration: InputDecoration(labelText: "Tenure (Months)")),
            const SizedBox(height: 20),
            ElevatedButton(onPressed: () {}, child: const Text("Calculate")),
            const SizedBox(height: 30),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(color: Colors.blue[50], borderRadius: BorderRadius.circular(10)),
              child: const Column(
                children: [
                  Text("Estimated EMI: ₹ 0"),
                  Text("Total Interest: ₹ 0"),
                  Text("Total Payment: ₹ 0"),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
