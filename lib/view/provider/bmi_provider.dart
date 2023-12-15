import 'package:flutter/material.dart';

import '../../app/utils/app_strings.dart';
import '../../app/utils/enums/enums.dart';
import '../../models/bmi_model.dart';

class BMIProvider extends ChangeNotifier {
  final BMIModel bmiModel = BMIModel();

  void setGender({required Gender gender}) {
    bmiModel.setGender(gender);
    notifyListeners();
  }

  void setHeight({required int height}) {
    bmiModel.setHeight(height);
    notifyListeners();
  }

  void incWeight() {
    bmiModel.incWeight();
    notifyListeners();
  }

  void decWeight() {
    bmiModel.decWeight();
    notifyListeners();
  }

  void incAge() {
    bmiModel.incAge();
    notifyListeners();
  }

  void decAge() {
    bmiModel.decAge();
    notifyListeners();
  }

  int _bmiIndex = 20;
  int get bmiIndex => _bmiIndex;

  void calcBMI() {
    final value =
        bmiModel.weight / ((bmiModel.height / 100) * (bmiModel.height / 100));
    _bmiIndex = value.toInt();
  }

  String get interpretation {
    if (_bmiIndex >= 25) {
      return AppStrings.overweight;
    } else if (_bmiIndex >= 18) {
      return AppStrings.normal;
    } else {
      return AppStrings.underweight;
    }
  }

  String get advice {
    if (_bmiIndex >= 25) {
      return AppStrings.overweightMessage;
    } else if (_bmiIndex >= 18) {
      return AppStrings.normalMessage;
    } else {
      return AppStrings.underweightMessage;
    }
  }
}
