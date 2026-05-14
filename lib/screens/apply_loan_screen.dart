import 'package:flutter/material.dart';

class ApplyLoanScreen extends StatelessWidget {
  const ApplyLoanScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Apply Loan")),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Selected Amount: ₹ 2000", style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                padding: const EdgeInsets.all(10),
                color: Colors.grey[100],
                child: const SingleChildScrollView(child: Text("Terms and Conditions Content...")),
              ),
            ),
            Row(
              children: [
                Checkbox(value: false, onChanged: (v) {}),
                const Text("I agree to terms"),
              ],
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(onPressed: () {}, child: const Text("Proceed")),
            ),
          ],
        ),
      ),
    );
  }
}
