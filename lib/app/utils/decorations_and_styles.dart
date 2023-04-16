import 'package:flutter/material.dart';
import 'colors_manager.dart';

const BoxDecoration kBoxDecoration = BoxDecoration(
  borderRadius: const BorderRadius.all(const Radius.circular(15)),
  color: ColorsManager.inactiveGenderCardColor,
);

const BoxDecoration kInactiveBoxDecoration = BoxDecoration(
  borderRadius: const BorderRadius.all(const Radius.circular(15)),
  color: ColorsManager.inactiveGenderCardColor,
);

const BoxDecoration kActiveBoxDecoration = BoxDecoration(
  borderRadius: const BorderRadius.all(const Radius.circular(15)),
  color: ColorsManager.activeGenderCardColor,
);

const TextStyle kActiveTitleTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.white,
);

const TextStyle kInctiveTitleTextStyle = TextStyle(
  fontSize: 20,
  color: ColorsManager.greyColor,
);

const TextStyle kNumbersTextStyle = TextStyle(
  fontSize: 35,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
