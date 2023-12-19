import 'package:bmi_calculator_2/app/utils/app_strings.dart';
import 'package:flutter/material.dart';

import 'config/app_theme.dart';
import 'config/go_router.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: appRouter,
      title: AppStrings.appTitle,
      theme: appTheme,
    );
  }
}
