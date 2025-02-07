import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'loan_provider.dart';

class NotificationsScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final loanProvider = Provider.of<LoanProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text("Unsplash Images")),
      body: loanProvider.unsplashImages.isNotEmpty
          ? GridView.builder(
              padding: EdgeInsets.all(10),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
              ),
              itemCount: loanProvider.unsplashImages.length,
              itemBuilder: (context, index) {
                return ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(
                    loanProvider.unsplashImages[index],
                    fit: BoxFit.cover,
                  ),
                );
              },
            )
          : Center(child: CircularProgressIndicator()),
    );
  }
}
