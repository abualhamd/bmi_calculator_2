import 'package:bmi_calculator_2/view/screens/results_view/results_screen.dart';
import 'package:flutter/material.dart';

import '../../view/screens/calculator_view/calculator_screen.dart';
import '../utils/app_strings.dart';

abstract class Routes {
  static const String calculatorRoute = '/';
  static const String resultsRoute = '/resultsScreen';
}

class RouteGenerator {
  static Route<dynamic> getRoute(RouteSettings settings) {
    switch (settings.name) {
      case Routes.calculatorRoute:
        return MaterialPageRoute(builder: (_) => const BMICalcuator());
      case Routes.resultsRoute:
        return MaterialPageRoute(builder: (_) => const ResultsScreen());
      default:
        return unDefinedRoute();
    }
  }

  static Route<dynamic> unDefinedRoute() {
    return MaterialPageRoute(
      builder: (_) => Scaffold(
        appBar: AppBar(title: const Text(AppStrings.undefinedRoute)),
        body: const Center(child: Text(AppStrings.undefinedRoute)),
      ),
    );
  }
}