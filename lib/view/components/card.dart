import 'package:bmi_calculator_2/app/utils/decorations_and_styles.dart';
import 'package:flutter/material.dart';

class CardWidget extends StatelessWidget {
  final Widget child;

  CardWidget({required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: kBoxDecoration,
      child: child,
    );
  }
}
