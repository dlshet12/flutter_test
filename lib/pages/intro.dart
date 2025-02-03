import 'package:flutter/material.dart';

class IntroScreen extends StatelessWidget {
  final String loanAmount; // Add this field

  // Constructor to receive loanAmount
  const IntroScreen({Key? key, required this.loanAmount}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Intro Screen')),
      body: Center(
        child: Text(
          'Loan Amount Entered: ₹$loanAmount', // Display the loan amount
          style: const TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}