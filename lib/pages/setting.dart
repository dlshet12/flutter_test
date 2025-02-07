import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'loan_provider.dart';

class SettingsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loanProvider = Provider.of<LoanProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Settings & Images")),
      body: Column(
        children: [
          // Display Images
          Expanded(
            child: loanProvider.unsplashPhotos.isNotEmpty
                ? GridView.builder(
                    padding: EdgeInsets.all(10),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: loanProvider.unsplashPhotos.length,
                    itemBuilder: (context, index) {
                      return ClipRRect(
                        borderRadius: BorderRadius.circular(10),
                        child: Image.network(
                          loanProvider.unsplashPhotos[index],
                          fit: BoxFit.cover,
                        ),
                      );
                    },
                  )
                : Center(child: CircularProgressIndicator()),
          ),
        ],
      ),
    );
  }
}
