import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'loan_provider.dart';

class IntroScreen extends StatefulWidget {
  final String loanAmount;
  

  const IntroScreen({Key? key, required this.loanAmount}) : super(key: key);

  @override
  _IntroScreenState createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  late TextEditingController pendingAmountController;
bool _isTextFieldTapped = false;

  @override
  void initState() {
    super.initState();
    final loanProvider = Provider.of<LoanProvider>(context, listen: false);

    // Initialize controller with the value only once
    pendingAmountController = TextEditingController(
      text: loanProvider.pendingAmount % 1 == 0
          ? loanProvider.pendingAmount.toInt().toString()
          : loanProvider.pendingAmount.toString(),
    );
  }

  @override
  void dispose() {
    pendingAmountController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final loanProvider = Provider.of<LoanProvider>(context);

    return Scaffold(
      appBar: AppBar(title: const Text('Intro Screen')),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Loan Amount Entered: ₹${widget.loanAmount}',
              style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 20),

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
                double? newAmount = double.tryParse(value);
                if (newAmount != null) {
                  loanProvider.setPendingAmount(newAmount);
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
