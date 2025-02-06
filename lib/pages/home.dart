import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:http/http.dart' as http;
import 'package:provider/provider.dart';
import './loan_provider.dart';
import 'dart:convert';
import 'intro.dart';  

class LoanPaymentScreen extends StatefulWidget {
  @override
  _LoanPaymentScreenState createState() => _LoanPaymentScreenState();
}

class _LoanPaymentScreenState extends State<LoanPaymentScreen> {
  List<String> imageUrls = [];
  bool isLoading = false;
  bool _isTextFieldTapped = false; 
   TextEditingController loanAmountController = TextEditingController();
   TextEditingController pendingAmountController = TextEditingController();

@override
void initState() {
  super.initState();
  final loanProvider = Provider.of<LoanProvider>(context, listen: false);
  
  // Initialize with provider's value
  pendingAmountController.text = loanProvider.pendingAmount.toInt().toString();

  // Listen to provider changes
  loanProvider.addListener(() {
    pendingAmountController.text = loanProvider.pendingAmount.toInt().toString();
  });
}


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
          imageUrls =
              data.map((item) => item['urls']['regular'].toString()).toList();
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
       final loanProvider = Provider.of<LoanProvider>(context);

    // Update the text field when provider changes
    // pendingAmountController.text = loanProvider.pendingAmount.toInt().toString();

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
                controller: loanAmountController,
                keyboardType: TextInputType.number, // Allows numeric input
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  hintText:"Enter Loan Amount",
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
                 controller: pendingAmountController,
                keyboardType: TextInputType.number, // Allows numeric input
                showCursor: _isTextFieldTapped, // Initially false, will change on tap
                  readOnly: !_isTextFieldTapped,
                inputFormatters: [FilteringTextInputFormatter.digitsOnly],
                decoration: InputDecoration(
                  hintText: "2,00,000",
                  suffixIcon: const Icon(Icons.currency_rupee),
                  border: OutlineInputBorder(),
                ),
                  onTap: () {
    setState(() {
      _isTextFieldTapped = true; // Enables cursor on tap
    });
  },
                   onChanged: (value) {
                double newAmount = double.tryParse(value) ?? 0.0;
                loanProvider.setPendingAmount(newAmount);
              },
              ),
              const SizedBox(height: 20),

              // Buttons
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ElevatedButton(
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
                        : const Text("Image generate",
                            style: TextStyle(color: Colors.white)),
                  ),
                  const SizedBox(width: 10), // Add space between the buttons
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      padding: const EdgeInsets.symmetric(
                          horizontal: 24, vertical: 12),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                 onPressed: () {
                  String loanAmount = loanAmountController.text;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => IntroScreen(loanAmount: loanAmount),
                    ),
                  );
                },
                    child: const Text("Go to Intro",
                        style: TextStyle(color: Colors.white)),
                  ),
                ],
              ),
              const SizedBox(height: 20),

              // Display images from API
              if (imageUrls.isNotEmpty)
                Column(
                  children: imageUrls.map((url) {
                    return Padding(
                      padding: const EdgeInsets.symmetric(vertical: 10),
                      child: Image.network(url, height: 150, fit: BoxFit.cover),
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


