import 'package:flutter/material.dart';
import 'home.dart';
import 'intro.dart';
import './bottom_navbar.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    LoanPaymentScreen(),  // Your home page
    IntroScreen(loanAmount: "10000"),  // Example navigation to intro screen
    Center(child: Text("Notifications Page")),
    Center(child: Text("Settings Page")),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomNavBar(
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
