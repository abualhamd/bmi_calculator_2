import 'package:flutter/material.dart';

class CountData extends ChangeNotifier {
  int _age = 20;
  int _weight = 78;

  int get showAge => _age;
  int get showWeight => _weight;

  void incAge() {
    _age++;
    notifyListeners();
  }

  void decAge() {
    _age--;
    notifyListeners();
  }

  void incWeight() {
    _weight++;
    notifyListeners();
  }

  void decWeight() {
    _weight--;
    notifyListeners();
  }
}
