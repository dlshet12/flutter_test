import 'package:flutter/material.dart';

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
      home: LoanPaymentScreen(),
    );
  }
}

class LoanPaymentScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Image.network(
                      'https://www.freemalaysiatoday.com/_next/image/?url=https%3A%2F%2Fmedia.freemalaysiatoday.com%2Fwp-content%2Fuploads%2F2024%2F07%2F0949d2ab-hindenburg.jpg&w=1200&q=75',
                      height: 150,
                    ),
                    const SizedBox(height: 20),
                    const Text(
                      "Let's Accelerate Your Aspirations with Rapid Loan Disbursement!",
                      textAlign: TextAlign.center,
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 5),
                    const Text(
                      "Complete your loan payment in a few easy steps.",
                      textAlign: TextAlign.center,
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    const SizedBox(height: 10),
                  ],
                ),
              ),

              // Prospect Number
              const Text("Prospect No: 7653243",
                  style: TextStyle(fontWeight: FontWeight.bold)),

              const SizedBox(height: 10),

              // Loan Amount
              const Text("Loan Amount"),
              TextField(
                decoration: InputDecoration(
                  hintText: "20,00,000",
                  suffixIcon: const Icon(Icons.currency_rupee),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              const Text("Disbursed Till Date"),
              TextField(
                decoration: InputDecoration(
                  hintText: "Day/Month/Year",
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 10),

              const Text(
                "Click To View Details",
                style: TextStyle(
                  color: Color.fromARGB(255, 8, 39, 243),
                  fontWeight: FontWeight.bold,
                  decoration: TextDecoration.underline,
                ),
              ),

              const SizedBox(height: 10),

              // Pending Amount
              const Text("Pending Amount"),
              TextField(
                decoration: InputDecoration(
                  hintText: "20,00,000",
                  suffixIcon: const Icon(Icons.currency_rupee),
                  border: OutlineInputBorder(),
                ),
              ),

              const SizedBox(height: 20),

              // Proceed Button
              Align(
                alignment: Alignment.centerLeft,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.deepOrange,
                    padding: const EdgeInsets.symmetric(
                        horizontal: 24, vertical: 12), // Adjust width
                    shape: RoundedRectangleBorder(
                      borderRadius:
                          BorderRadius.circular(6), // Reduced border radius
                    ),
                  ),
                  onPressed: () {},
                  child: const Text(
                    "Proceed",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
