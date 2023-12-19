import 'package:go_router/go_router.dart';

import '../../view/screens/calculator_view/calculator_screen.dart';
import '../../view/screens/results_view/results_screen.dart';

abstract class Routes {
  static const String calculatorRoute = 'calculatorRoute';
  static const String resultsRoute = 'resultsRoute';
}

final appRouter = GoRouter(
  initialLocation: "/${Routes.calculatorRoute}",
  debugLogDiagnostics: true,
  routes: [
    GoRoute(
        path: "/${Routes.calculatorRoute}",
        name: Routes.calculatorRoute,
        builder: ((context, state) {
          return BMICalcuator();
        }),
        routes: [
          GoRoute(
            path: Routes.resultsRoute,
            name: Routes.resultsRoute,
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
