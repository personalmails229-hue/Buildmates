import 'package:flutter/material.dart';

class AppState extends ChangeNotifier {
  String userName = '';
  double walletBalance = 0.0;

  void login(String name) {
    userName = name;
    notifyListeners();
  }

  void topUp(double amount) {
    walletBalance += amount;
    notifyListeners();
  }

  void deductCommission(double amount) {
    walletBalance -= amount;
    if (walletBalance < 0) walletBalance = 0;
    notifyListeners();
  }
}
