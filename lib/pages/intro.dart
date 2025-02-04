import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'loan_provider.dart';

class IntroScreen extends StatelessWidget {
  final String loanAmount;

  IntroScreen({Key? key, required this.loanAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final loanProvider = Provider.of<LoanProvider>(context);
    TextEditingController pendingAmountController = TextEditingController(
      text: loanProvider.pendingAmount % 1 == 0 
          ? loanProvider.pendingAmount.toInt().toString() // Show as integer
          : loanProvider.pendingAmount.toString(),
    );

    return Scaffold(
      appBar: AppBar(title: const Text('Intro Screen')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Loan Amount Entered: ₹$loanAmount',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

            // Pending Amount TextField
            const Text(
              "Pending Amount",
              style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
            ),
            TextField(
              controller: pendingAmountController,
              keyboardType: TextInputType.number,
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                hintText: "Enter Pending Amount",
                suffixIcon: const Icon(Icons.currency_rupee),
              ),
              onChanged: (value) {
                double newAmount = double.tryParse(value) ?? 0.0;
                loanProvider.setPendingAmount(newAmount);
              },
            ),
          ],
        ),
      ),
    );
  }
}
