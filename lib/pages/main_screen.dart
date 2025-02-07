import 'package:flutter/material.dart';
import 'home.dart';
import 'intro.dart';
import './bottom_navbar.dart';
import 'package:provider/provider.dart';
import './loan_provider.dart';
import './notification.dart';
import './setting.dart';
class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    LoanPaymentScreen(),  // Your home page
    IntroScreen(loanAmount: "10000"),  // Example navigation to intro screen
     NotificationsScreen(),
    SettingsScreen(),
  ];

 void _onItemTapped(int index) {
  setState(() {
    _selectedIndex = index;

    final loanProvider = Provider.of<LoanProvider>(context, listen: false);

    if (index == 2 && loanProvider.unsplashImages.isEmpty) { // Notifications tab
      loanProvider.fetchUnsplashImages();
    }

    if (index == 3) { // Settings tab
      if (loanProvider.unsplashPhotos.isEmpty) {
        loanProvider.fetchUnsplashPhotos();
      }
      loanProvider.fetchSettingsData();
    }
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
