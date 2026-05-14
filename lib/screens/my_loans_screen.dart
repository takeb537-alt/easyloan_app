import 'package:flutter/material.dart';
import 'repayment_screen.dart';

class MyLoansScreen extends StatelessWidget {
  const MyLoansScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("My Loans")),
      body: ListView(
        padding: const EdgeInsets.all(16),
        children: [
          Card(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
            child: ListTile(
              title: const Text("Personal Loan #1234"),
              subtitle: const Text("Amount: ₹1000 | Due: 25 May"),
              trailing: const Icon(Icons.arrow_forward_ios),
              onTap: () => Navigator.push(context, MaterialPageRoute(builder: (context) => const RepaymentScreen())),
            ),
          ),
          const SizedBox(height: 50),
          const Center(child: Text("No active loans", style: TextStyle(color: Colors.grey))),
        ],
      ),
    );
  }
}
