import 'package:flutter/material.dart';

import '../helpers/custom_material_colors.dart';
import '../utils/colors_manager.dart';

final appTheme = ThemeData(
  primarySwatch: CustomMaterialColor(ColorsManager.backgroundColor).color,
  scaffoldBackgroundColor: ColorsManager.backgroundColor,
);
