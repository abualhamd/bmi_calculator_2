import 'dart:math';

class CalcBrain {
  final int weight;
  final int height;
  double bmiIndex = 20;

  CalcBrain({required this.height, required this.weight});

  String get calcBMI {
    bmiIndex = weight / ((height / 100) * (height / 100));

    return bmiIndex.toInt().toString();
  }

  String get interpretation {
    if (bmiIndex >= 25) {
      return 'OVERWEIGHT';
    } else if (bmiIndex >= 18) {
      return 'NORMAL';
    } else {
      return 'UNDERWEIGHT';
    }
  }

  String get advice {
    if (bmiIndex >= 25) {
      return 'You have higher than normal body weight. Try to exercise more.';
    } else if (bmiIndex >= 18) {
      return 'You have a normal body weight. Good job!';
    } else {
      return 'You have a lower than normal body weight. You can eat a bit more.';
    }
  }
}
