import 'package:bmi_calculator_2/app/utils/app_strings.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../view/provider/bmi_provider.dart';
import 'config/app_theme.dart';
import 'config/routes_manager.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      child: MaterialApp(
        onGenerateRoute: RouteGenerator.getRoute,
        title: AppStrings.appTitle,
        theme: appTheme,
      ),
      create: (context) => BMIProvider(),
    );
  }
}