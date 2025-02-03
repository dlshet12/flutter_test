import 'package:flutter/material.dart';
import './pages/home.dart'; // Import the Home page

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Loan Payment',
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepOrange),
      ),
       home: LoanPaymentScreen(), // Set HomeScreen as the initial page
    );
  }
}
