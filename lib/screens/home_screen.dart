import 'package:flutter/material.dart';
import 'apply_loan_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("EasyLoan")),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text("Welcome, User", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const SizedBox(height: 20),
            Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
              color: const Color(0密1565C0),
              child: const Padding(
                padding: EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text("Your Credit Limit", style: TextStyle(color: Colors.white70)),
                    Text("₹ 50,000", style: TextStyle(color: Colors.white, fontSize: 30, fontWeight: FontWeight.bold)),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text("Select Loan Amount"),
            GridView.count(
              shrinkWrap: true,
              crossAxisCount: 3,
              physics: const NeverScrollableScrollPhysics(),
              children: [100, 200, 500, 1000, 2000].map((amt) => Card(child: Center(child: Text("₹$amt")))).toList(),
            ),
            const SizedBox(height: 20),
            const Text("Recharge Loans"),
            const SizedBox(height: 10),
            Container(height: 100, color: Colors.grey[100], child: const Center(child: Text("No Recharges Available"))),
            const SizedBox(height: 20),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const ApplyLoanScreen())),
                child: const Text("Apply Now"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
