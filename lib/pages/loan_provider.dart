import 'package:flutter/material.dart';

class LoanProvider extends ChangeNotifier {
  double _pendingAmount = 0.0;

  double get pendingAmount => _pendingAmount;

  void setPendingAmount(double amount) {
    _pendingAmount = amount;
    notifyListeners();
  }
}
