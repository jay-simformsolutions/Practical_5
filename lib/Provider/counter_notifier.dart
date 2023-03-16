import 'package:flutter/material.dart';

class Counter extends ChangeNotifier {
  int count = 0;

  int get getCount => count;

  void incrementCounter() {
    count++;
    notifyListeners();
  }

  void decrementCounter() {
    count--;
    notifyListeners();
  }
}
