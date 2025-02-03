import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

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

class LoanPaymentScreen extends StatefulWidget {
  @override
  _LoanPaymentScreenState createState() => _LoanPaymentScreenState();
}

class _LoanPaymentScreenState extends State<LoanPaymentScreen> {
  List<String> imageUrls = [];
  bool isLoading = false;

  Future<void> fetchImages() async {
    setState(() {
      isLoading = true;
    });

    try {
      final response = await http.get(
        Uri.parse(
            'https://api.unsplash.com/photos/random?count=5&client_id=uEBT29Z36M1XkJ15L-PmQZxcSvlxR_fhARYY4DYtMTE'),
      );

      if (response.statusCode == 200) {
        List<dynamic> data = json.decode(response.body);
        setState(() {
          imageUrls = data
              .map((item) => item['urls']['regular'].toString())
              .toList();
        });
      } else {
        print("Failed to load images: ${response.statusCode}");
      }
    } catch (e) {
      print("Error fetching images: $e");
    }

    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/hindenburg.webp',
                      height: 150,
                      fit: BoxFit.cover,
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
              const Text("Prospect No: 7653243",
                  style: TextStyle(fontWeight: FontWeight.bold)),
              const SizedBox(height: 10),
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
              const Text("Pending Amount"),
              TextField(
                decoration: InputDecoration(
                  hintText: "2,00,000",
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
                        horizontal: 24, vertical: 12),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(6),
                    ),
                  ),
                  onPressed: fetchImages,
                  child: isLoading
                      ? CircularProgressIndicator(color: Colors.white)
                      : const Text("Proceed",
                          style: TextStyle(color: Colors.white)),
                ),
              ),
              const SizedBox(height: 20),

              // Display images from API
              if (imageUrls.isNotEmpty)
                Column(
                  children: imageUrls.map((url) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Image.network(url,
                          height: 150, fit: BoxFit.cover),
                    );
                  }).toList(),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
