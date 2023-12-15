import 'package:bmi_calculator_2/app/config/types.dart';
import 'package:go_router/go_router.dart';

import '../../view/screens/calculator_view/calculator_screen.dart';
import '../../view/screens/results_view/results_screen.dart';

abstract class AppRoutes {
  static const String calculatorRoute = 'calculatorRoute';
  static const String resultsRoute = 'resultsRoute';
}

final appRouter = GoRouter(
  initialLocation: "/${AppRoutes.calculatorRoute}",
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
        path: "/${AppRoutes.calculatorRoute}",
        name: AppRoutes.calculatorRoute,
        builder: ((context, state) {
          return BMICalcuator();
        }),
        routes: [
          GoRoute(
            path: AppRoutes.resultsRoute,
            name: AppRoutes.resultsRoute,
            builder: ((context, state) {
              final bmiResultJson = state.extra as Map<String, dynamic>;
              return ResultsScreen(
                bmiIndex: bmiResultJson["bmiIndex"],
                interpretation: bmiResultJson["interpretation"],
                advice: bmiResultJson["advice"],
              );
            }),
          )
        ])
  ],
);
