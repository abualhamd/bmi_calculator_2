import 'package:flutter/material.dart';
import 'colors.dart';

const BoxDecoration kBoxDecoration = BoxDecoration(
  borderRadius: const BorderRadius.all(const Radius.circular(15)),
  color: kInactiveGenderCardColor,
);

const BoxDecoration kInactiveBoxDecoration = BoxDecoration(
  borderRadius: const BorderRadius.all(const Radius.circular(15)),
  color: kInactiveGenderCardColor,
);

const BoxDecoration kActiveBoxDecoration = BoxDecoration(
  borderRadius: const BorderRadius.all(const Radius.circular(15)),
  color: kActiveGenderCardColor,
);

const TextStyle kActiveTitleTextStyle = TextStyle(
  fontSize: 20,
  color: Colors.white,
);

const TextStyle kInctiveTitleTextStyle = TextStyle(
  fontSize: 20,
  color: kGreyColor,
);

const TextStyle kNumbersTextStyle = TextStyle(
  fontSize: 35,
  fontWeight: FontWeight.bold,
  color: Colors.white,
);
