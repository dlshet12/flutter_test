import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import './pages/loan_provider.dart';
import './pages/main_screen.dart';  // Import your MainScreen

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoanProvider()),
      ],
      child: const MyApp(),
    ),
  );
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
      home: MainScreen(), // Use MainScreen instead of LoanPaymentScreen
    );
  }
}
